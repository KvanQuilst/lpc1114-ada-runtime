MEMORY
{
  flash (rx) : ORIGIN = 0x00000000, LENGTH = 32K
  sram (rwx) : ORIGIN = 0x10000000, LENGTH = 4K
}

REGION_ALIAS("sram_tx", sram)
REGION_ALIAS("sram_ro", sram)
REGION_ALIAS("sram_bs", sram)
REGION_ALIAS("sram_da", sram)
