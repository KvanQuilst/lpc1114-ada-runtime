/****************************************************************************
 *                                                                          *
 *                         GNAT COMPILER COMPONENTS                         *
 *                                                                          *
 *                                  A R M                                   *
 *                                                                          *
 *                            Linker Script File                            *
 *                                                                          *
 *                      Copyright (C) 2022 Dylan Eskew                      *
 *                                                                          *
 * GNAT is free software;  you can  redistribute it  and/or modify it under *
 * terms of the  GNU General Public License as published  by the Free Soft- *
 * ware  Foundation;  either version 2,  or (at your option) any later ver- *
 * sion.  GNAT is distributed in the hope that it will be useful, but WITH- *
 * OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY *
 * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License *
 * for  more details.  You should have  received  a copy of the GNU General *
 * Public License  distributed with GNAT;  see file COPYING.  If not, write *
 * to  the  Free Software Foundation,  51  Franklin  Street,  Fifth  Floor, *
 * Boston, MA 02110-1301, USA.                                              *
 *                                                                          *
 * As a  special  exception,  if you  link  this file  with other  files to *
 * produce an executable,  this file does not by itself cause the resulting *
 * executable to be covered by the GNU General Public License. This except- *
 * ion does not  however invalidate  any other reasons  why the  executable *
 * file might be covered by the  GNU Public License.                        *
 *                                                                          *
 ****************************************************************************/

/* This is an ARM specific version of this file */

/* This script replaces ld's default linker script, providing the
   appropiate memory map and output format. */

MEMORY {
	flash (rx) : org = 0x00000000, len = 32k
	sram (rwx) : org = 0x10000000, len = 4k
}

ENTRY(vector);

SECTIONS {
	
	.text : {
		. = 0x00000000;
		*(.vector);
		. = ALIGN(4);
		*(.text);
		.= ALIGN(4);
	} > flash

	.rodata : {
		*(.rodata);
		. = ALIGN(4);
	} > flash

	.data : {
		. = 0x00000000;
		*(.data);
		. = ALIGN(4);
	} > sram AT > flash

	.bss : {
		*(.bss);
		. = ALIGN(4);
	} > sram

	__DATA_LMA = LOADADDR(.data);
	__DATA_VMA = ADDR(.data);
	__DATA_END = ADDR(.data) + SIZEOF(.data);
	__BSS_VMA = ADDR(.bss);
	__BSS_END = ADDR(.bss) + SIZEOF(.bss);

}

PROVIDE(__INITIAL_SP = ORIGIN(sram) + LENGTH(sram));
PROVIDE(__VECTOR_CHECKSUM = 0 - __INITIAL_SP - (__reset + 1) - (__irq + 1)
													- (Hardfault + 1));
