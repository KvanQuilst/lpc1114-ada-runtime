MEMORY {
  flash (rx) : org = 0x00000000, len = 32k
  sram (rwx) : org = 0x10000000, len = 4k
}

ENTRY(__vectors);

SECTIONS {
  
  .text : {
    KEEP (*(.vectors))
    *(.text .text.* .gnu.linkonce.t*)
    *(.gnu.warning)
  } > flash

  .ARM.extab  : { *(.ARM.extab* .gnu.linkonce.armextab.*) } > flash
  . = ALIGN(0x4);
  PROVIDE_HIDDEN (__exidx_start = .);
  .ARM.exidx  : { *(.ARM.exidx* .gnu.linkonce.armexidx.*) } > flash
  PROVIDE_HIDDEN (__exidx_end = .);

  .rodata : {
    *(.lit)
    *(.rodata .rodata.* .gnu.linkonce.r*)
    . = ALIGN(0x4);
  } > flash

  .data : {
    . = 0x00000000;
    *(.data .data.* .gnu.linkonce.d*)
    . = ALIGN(4);
  } > sram AT > flash

  .bss (NOLOAD): {
    . = ALIGN(0x8);
    *(.bss .bss.*)
    *(COMMON)
    . = ALIGN(0x8);
  } > sram

  /* DWARF debug sections.
     Symbols in the DWARF debugging sections are relative to the beginning
     of the section so we begin them at 0.  */
  /* DWARF 1 */
  .debug          0 : { *(.debug) }
  .line           0 : { *(.line) }
  /* GNU DWARF 1 extensions */
  .debug_srcinfo  0 : { *(.debug_srcinfo) }
  .debug_sfnames  0 : { *(.debug_sfnames) }
  /* DWARF 1.1 and DWARF 2 */
  .debug_aranges  0 : { *(.debug_aranges) }
  .debug_pubnames 0 : { *(.debug_pubnames) }
  /* DWARF 2 */
  .debug_info     0 : { *(.debug_info .gnu.linkonce.wi.*) }
  .debug_abbrev   0 : { *(.debug_abbrev) }
  .debug_line     0 : { *(.debug_line) }
  .debug_frame    0 : { *(.debug_frame) }
  .debug_str      0 : { *(.debug_str) }
  .debug_loc      0 : { *(.debug_loc) }
  .debug_macinfo  0 : { *(.debug_macinfo) }
  /* DWARF 3 */
  .debug_pubtypes 0 : { *(.debug_pubtypes) }
  .debug_ranges   0 : { *(.debug_ranges) }
  .gnu.attributes 0 : { KEEP (*(.gnu.attributes)) }
  /DISCARD/ : { *(.note.GNU-stack) *(.gnu_debuglink) *(.gnu.lto_*) }

	__DATA_LMA = LOADADDR(.data);
	__DATA_VMA = ADDR(.data);
	__DATA_END = ADDR(.data) + SIZEOF(.data);
	__BSS_VMA = ADDR(.bss);
	__BSS_END = ADDR(.bss) + SIZEOF(.bss);
}


PROVIDE(__INITIAL_SP = ORIGIN(sram) + LENGTH(sram));
PROVIDE(__VECTOR_CHECKSUM = 0 - __INITIAL_SP - (__reset + 1) - 0
                          - 0);
