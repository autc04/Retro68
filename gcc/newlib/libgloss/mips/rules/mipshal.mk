# Copyright 2015, Imagination Technologies Limited and/or its
#                 affiliated group companies.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice,
# this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation
# and/or other materials provided with the distribution.
# 3. Neither the name of the copyright holder nor the names of its
# contributors may be used to endorse or promote products derived from this
# software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

# Usage:
#
# "include mipshal.mk" should be included in the top level makefile of the
# project seeking to use this file. The variables CC and LD will be defined
# by this file. The variables CFLAGS and LDFLAGS will be extended by this
# file.
#
# Symbols that are to be overwridden should be defined in the the makefile
# before "include mipshal.mk" or passed to make on the command line in the
# form 'make STACK=0x1000' or 'make FLASH_START=0xBFC00000'.
#
# Care should be taken to ensure that no pre-existing environment variables
# collide with the set of variables that this file inspects as unintended
# results may happen.

# Portable 'lowercase' func.
lc = $(subst A,a,$(subst B,b,$(subst C,c,$(subst D,d,$(subst E,e,$(subst F,f,$(subst G,g,$(subst H,h,$(subst I,i,$(subst J,j,$(subst K,k,$(subst L,l,$(subst M,m,$(subst N,n,$(subst O,o,$(subst P,p,$(subst Q,q,$(subst R,r,$(subst S,s,$(subst T,t,$(subst U,u,$(subst V,v,$(subst W,w,$(subst X,x,$(subst Y,y,$(subst Z,z,$1))))))))))))))))))))))))))

# Default values for the linker script symbols listed below are
# defined in the linker script.

# These are linker script symbols that are prefixed with '__"
priv_symbols = MEMORY_BASE MEMORY_SIZE STACK
priv_symbols += BEV_OVERRIDE
priv_symbols += ENABLE_XPA
priv_symbols += FLUSH_TO_ZERO
priv_symbols += FLASH_START APP_START FLASH_APP_START
priv_symbols += ISR_VEC_SPACE ISR_VECTOR_COUNT

comma := ,

# A bit of makefile magic:
# foreach symbol in overridable ld-symbols :
#   If symbol has a value, produce a linker argument for that symbol.
MIPS_HAL_LDFLAGS = $(foreach a,$(priv_symbols),$(if $($a),-Wl$(comma)--defsym$(comma)__$(call lc,$(a))=$($a)))

# Linker scripts for 32 & 64bit and ABI flags.
LDSCRIPT32 ?= uhi32.ld
LDSCRIPT64 ?= uhi64_64.ld
LDSCRIPTN32 ?= uhi64_n32.ld

ifdef ENDIAN
  ifeq ($(ENDIAN), EL)
    ENDIANF = -EL
  else
    ifeq ($(ENDIAN), EB)
      ENDIANF = -EB
    else
      $(error Endian must be either EL, EB or undefined for default)
    endif
  endif
endif

# Pick the appropiate flags based on $(ABI)
ifeq ($(ABI), 32)
  MIPS_TOOLCHAIN ?= mips-mti-elf
  LDSCRIPT ?= $(LDSCRIPT32)
else
  ifeq ($(ABI), 64)
    MIPS_TOOLCHAIN ?= mips-img-elf
    LDSCRIPT ?= $(LDSCRIPT64)
  else
    ifeq ($(ABI), n32)
      MIPS_TOOLCHAIN ?= mips-img-elf
      LDSCRIPT ?= $(LDSCRIPTN32)
    else
      $(error ABI must one of 32,64,n32)
    endif
  endif
endif

ifeq ($(ROMABLE),1)
  MIPS_HAL_LDFLAGS += -T bootcode.ld
endif

ifdef ELF_ENTRY
  MIPS_HAL_LDFLAGS += -Wl,--entry,$(ELF_ENTRY)
endif

ifndef MIPS_ELF_ROOT
  $(error MIPS_ELF_ROOT must be set to point to toolkit installation root)
endif

ifeq ($(OS),Windows_NT)
  CROSS_COMPILE=$(subst \,/,$(MIPS_ELF_ROOT))/bin/$(MIPS_TOOLCHAIN)-
  SREC2HEX=$(subst \,/,$(MIPS_ELF_ROOT))/share/mips/rules/srec2hex.pl
else
  CROSS_COMPILE=$(MIPS_ELF_ROOT)/bin/$(MIPS_TOOLCHAIN)-
  SREC2HEX=$(MIPS_ELF_ROOT)/share/mips/rules/srec2hex.pl
endif

CC = $(CROSS_COMPILE)gcc
CFLAGS += -mabi=$(ABI) $(ENDIANF)
LD = $(CC)
LDFLAGS += $(MIPS_HAL_LDFLAGS) -mabi=$(ABI) $(ENDIANF) -T $(LDSCRIPT)

OBJDUMP = $(CROSS_COMPILE)objdump
OBJCOPY = $(CROSS_COMPILE)objcopy
READELF = $(CROSS_COMPILE)readelf
NM = $(CROSS_COMPILE)nm
STRIP = $(CROSS_COMPILE)strip

%.rec: %.elf
	$(OBJCOPY) -O srec $^ $@

%.hex: %.rec
	$(SREC2HEX) -EL $^ > $@
