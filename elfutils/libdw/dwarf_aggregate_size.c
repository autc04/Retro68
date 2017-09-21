/* Compute size of an aggregate type from DWARF.
   Copyright (C) 2010, 2014, 2016 Red Hat, Inc.
   This file is part of elfutils.

   This file is free software; you can redistribute it and/or modify
   it under the terms of either

     * the GNU Lesser General Public License as published by the Free
       Software Foundation; either version 3 of the License, or (at
       your option) any later version

   or

     * the GNU General Public License as published by the Free
       Software Foundation; either version 2 of the License, or (at
       your option) any later version

   or both in parallel, as here.

   elfutils is distributed in the hope that it will be useful, but
   WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   General Public License for more details.

   You should have received copies of the GNU General Public License and
   the GNU Lesser General Public License along with this program.  If
   not, see <http://www.gnu.org/licenses/>.  */

#ifdef HAVE_CONFIG_H
# include <config.h>
#endif

#include <dwarf.h>
#include "libdwP.h"


static Dwarf_Die *
get_type (Dwarf_Die *die, Dwarf_Attribute *attr_mem, Dwarf_Die *type_mem)
{
  Dwarf_Die *type = INTUSE(dwarf_formref_die)
    (INTUSE(dwarf_attr_integrate) (die, DW_AT_type, attr_mem), type_mem);

  if (INTUSE(dwarf_peel_type) (type, type) != 0)
    return NULL;

  return type;
}

static int
array_size (Dwarf_Die *die, Dwarf_Word *size,
	    Dwarf_Attribute *attr_mem, Dwarf_Die *type_mem)
{
  Dwarf_Word eltsize;
  if (INTUSE(dwarf_aggregate_size) (get_type (die, attr_mem, type_mem),
				    &eltsize) != 0)
      return -1;

  /* An array can have DW_TAG_subrange_type or DW_TAG_enumeration_type
     children instead that give the size of each dimension.  */

  Dwarf_Die child;
  if (INTUSE(dwarf_child) (die, &child) != 0)
    return -1;

  bool any = false;
  Dwarf_Word total = 0;
  do
    {
      Dwarf_Word count;
      switch (INTUSE(dwarf_tag) (&child))
	{
	case DW_TAG_subrange_type:
	  /* This has either DW_AT_count or DW_AT_upper_bound.  */
	  if (INTUSE(dwarf_attr_integrate) (&child, DW_AT_count,
					    attr_mem) != NULL)
	    {
	      if (INTUSE(dwarf_formudata) (attr_mem, &count) != 0)
		return -1;
	    }
	  else
	    {
	      Dwarf_Sword upper;
	      Dwarf_Sword lower;
	      if (INTUSE(dwarf_formsdata) (INTUSE(dwarf_attr_integrate)
					   (&child, DW_AT_upper_bound,
					    attr_mem), &upper) != 0)
		return -1;

	      /* Having DW_AT_lower_bound is optional.  */
	      if (INTUSE(dwarf_attr_integrate) (&child, DW_AT_lower_bound,
						attr_mem) != NULL)
		{
		  if (INTUSE(dwarf_formsdata) (attr_mem, &lower) != 0)
		    return -1;
		}
	      else
		{
		  Dwarf_Die cu = CUDIE (die->cu);
		  int lang = INTUSE(dwarf_srclang) (&cu);
		  if (lang == -1
		      || INTUSE(dwarf_default_lower_bound) (lang, &lower) != 0)
		    return -1;
		}
	      if (unlikely (lower > upper))
		return -1;
	      count = upper - lower + 1;
	    }
	  break;

	case DW_TAG_enumeration_type:
	  /* We have to find the DW_TAG_enumerator child with the
	     highest value to know the array's element count.  */
	  count = 0;
	  Dwarf_Die enum_child;
	  int has_children = INTUSE(dwarf_child) (die, &enum_child);
	  if (has_children < 0)
	    return -1;
	  if (has_children > 0)
	    do
	      if (INTUSE(dwarf_tag) (&enum_child) == DW_TAG_enumerator)
		{
		  Dwarf_Word value;
		  if (INTUSE(dwarf_formudata) (INTUSE(dwarf_attr_integrate)
					       (&enum_child, DW_AT_const_value,
						attr_mem), &value) != 0)
		    return -1;
		  if (value >= count)
		    count = value + 1;
		}
	    while (INTUSE(dwarf_siblingof) (&enum_child, &enum_child) > 0);
	  break;

	default:
	  continue;
	}

      /* This is a subrange_type or enumeration_type and we've set COUNT.
	 Now determine the stride for this array dimension.  */
      Dwarf_Word stride = eltsize;
      if (INTUSE(dwarf_attr_integrate) (&child, DW_AT_byte_stride,
					attr_mem) != NULL)
	{
	  if (INTUSE(dwarf_formudata) (attr_mem, &stride) != 0)
	    return -1;
	}
      else if (INTUSE(dwarf_attr_integrate) (&child, DW_AT_bit_stride,
					     attr_mem) != NULL)
	{
	  if (INTUSE(dwarf_formudata) (attr_mem, &stride) != 0)
	    return -1;
	  if (stride % 8) 	/* XXX maybe compute in bits? */
	    return -1;
	  stride /= 8;
	}

      any = true;
      total += stride * count;
    }
  while (INTUSE(dwarf_siblingof) (&child, &child) == 0);

  if (!any)
    return -1;

  *size = total;
  return 0;
}

static int
aggregate_size (Dwarf_Die *die, Dwarf_Word *size, Dwarf_Die *type_mem)
{
  Dwarf_Attribute attr_mem;

  if (INTUSE(dwarf_attr_integrate) (die, DW_AT_byte_size, &attr_mem) != NULL)
    return INTUSE(dwarf_formudata) (&attr_mem, size);

  switch (INTUSE(dwarf_tag) (die))
    {
    case DW_TAG_subrange_type:
      return aggregate_size (get_type (die, &attr_mem, type_mem),
			     size, type_mem); /* Tail call.  */

    case DW_TAG_array_type:
      return array_size (die, size, &attr_mem, type_mem);

    /* Assume references and pointers have pointer size if not given an
       explicit DW_AT_byte_size.  */
    case DW_TAG_pointer_type:
    case DW_TAG_reference_type:
    case DW_TAG_rvalue_reference_type:
      *size = die->cu->address_size;
      return 0;
    }

  /* Most types must give their size directly.  */
  return -1;
}

int
dwarf_aggregate_size (Dwarf_Die *die, Dwarf_Word *size)
{
  Dwarf_Die type_mem;

  if (INTUSE (dwarf_peel_type) (die, die) != 0)
    return -1;

  return aggregate_size (die, size, &type_mem);
}
INTDEF (dwarf_aggregate_size)
OLD_VERSION (dwarf_aggregate_size, ELFUTILS_0.144)
NEW_VERSION (dwarf_aggregate_size, ELFUTILS_0.161)
