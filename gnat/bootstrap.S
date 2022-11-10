  .syntax unified
  .cpu cortex-m0
  .thumb
  
  .text
  .section .vectors,"a"
  .globl __vectors0
  .align 8
__vectors0:
	.word __stack_end		   	/* stack top address */
	.word	__reset						/* reset function pointer */
	.word 0		    					/* NMI */
	.word __hardfault       /* Hardfault */
	.word 0, 0, 0						/* Reserved */
	.word __VECTOR_CHECKSUM
	.word 0, 0, 0						/* Reserved */
	.word 0							    /* SVCall */
	.word 0, 0							/* Reserved */
	.word 0							    /* PendSV */
	.word SysTick_Handler		/* System Tick */

	.word CCAN_IrqHandler		/* 13 C_CAN */
	.word SPI0_IrqHandler		/* 14 Synchronous Serial Port 0 */
	.word I2C_IrqHandler		/* 15 I2C */
	.word CT16B0_IrqHandler /* 16 16bit Counter/Timer 0 */
	.word CT16B1_IrqHandler /* 17 16bit Counter/Timer 1 */
	.word CT32B0_IrqHandler /* 18 32bit Counter/Timer 0 */
	.word CT32B1_IrqHandler /* 19 32bit Counter/Timer 1 */
	.word SPI1_IrqHandler		/* 20 Synchornous Serial Port 1 */
	.word UART_IrqHandler		/* 21 UART */
	.word IrqHandlerNotUsed /* 22 Reserved */
	.word IrqHandlerNotUsed /* 23 Reserved */
	.word ADC_IrqHandler		/* 24 ADC Controller */
	.word	WDT_IrqHandler		/* 25 Watchdog Timer */
	.word BOD_IrqHandler		/* 26 Brown-Out Detect */
  .word IrqHandlerNotUsed /* 27 Reserved */
	.word PIO3_IrqHandler		/* 28 Parallel IO Controller 3 */
	.word PIO2_IrqHandler		/* 29 Parallel IO Controller 2 */
	.word PIO1_IrqHandler		/* 30 Parallel IO Controller 1 */
	.word PIO0_IrqHandler		/* 31 Parallel IO Controller 0 */


  .text
  .thumb_func
  .globl __reset
__reset:
  /* Copy .data from flash to sram */
  ldr   r0, =__DATA_LMA
  ldr   r1, =__DATA_VMA
  ldr   r2, =__DATA_END
  b .L5
.L4:
  ldr   r3, [r0]
  str   r3, [r1]
  adds  r0, #4
  adds	r1, #4
.L5:
  cmp	  r1, r2
  bne	  .L4

  /* Clear .bss */
  ldr   r0, =__bss_start
  ldr   r2, =__bss_end
  eors  r3, r3
  b     .L7
.L6:
  str   r3, [r0]
  adds  r0, #4
.L7:
  cmp   r0, r2
  bne   .L6

  bl    main
  .align 2
.L3:
  .word __DATA_LMA
  .word __DATA_VMA
  .word __DATA_END


  .thumb_func
hang: b .


  .thumb_func
  .global __hardfault
__hardfault: 
  ldr   r0, =interrupts__hardfault
  tst   r0, r0
  beq   .L1
  blx   r0
.L1:
  b     hang
  .align 2

 /* Weak Symbols */
  .weak interrupts__hardfault
	.weak SysTick_Handler		/* System Tick */

	.weak CCAN_IrqHandler		/* 13 C_CAN */
	.weak SPI0_IrqHandler		/* 14 Synchronous Serial Port 0 */
	.weak I2C_IrqHandler		/* 15 I2C */
	.weak CT16B0_IrqHandler /* 16 16bit Counter/Timer 0 */
	.weak CT16B1_IrqHandler /* 17 16bit Counter/Timer 1 */
	.weak CT32B0_IrqHandler /* 18 32bit Counter/Timer 0 */
	.weak CT32B1_IrqHandler /* 19 32bit Counter/Timer 1 */
	.weak SPI1_IrqHandler		/* 20 Synchornous Serial Port 1 */
	.weak UART_IrqHandler		/* 21 UART */
	.weak IrqHandlerNotUsed /* 22 Reserved */
	.weak IrqHandlerNotUsed /* 23 Reserved */
	.weak ADC_IrqHandler		/* 24 ADC Controller */
	.weak	WDT_IrqHandler		/* 25 Watchdog Timer */
	.weak BOD_IrqHandler		/* 26 Brown-Out Detect */
  .weak IrqHandlerNotUsed /* 27 Reserved */
	.weak PIO3_IrqHandler		/* 28 Parallel IO Controller 3 */
	.weak PIO2_IrqHandler		/* 29 Parallel IO Controller 2 */
	.weak PIO1_IrqHandler		/* 30 Parallel IO Controller 1 */
	.weak PIO0_IrqHandler		/* 31 Parallel IO Controller 0 */
