/* Linker script to configure memory regions. */
MEMORY
{
  FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 0x40000   /* 256k */
  FLASH2 (rx) : ORIGIN = 0x200001e0, LENGTH = 0x4000
}

ENTRY(__start)

SECTIONS
{
	.far_away_section :
	{
	  *(.text.bar)
	} > FLASH2

	.text :
	{
		*(.text*)

	} > FLASH

}
