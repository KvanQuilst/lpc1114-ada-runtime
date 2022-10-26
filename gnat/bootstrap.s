  .section .vectors,"a"
  .global .vectors
__vectors:
	b.w		__INITIAL_SP			/* stack top address */
	.word	__reset						/* reset function pointer */
	.word hang							/* NMI */
	.word hang							/* Hardfault */
	.word 0, 0, 0						/* Reserved */
	.word __VECTOR_CHECKSUM
	.word 0, 0, 0						/* Reserved */
	.word hang							/* SVCall */
	.word 0, 0							/* Reserved */
	.word hang							/* PendSV */
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


  .section .text
  .global __reset
__reset:
  ldr   r0, .L3+0  //LMA
  ldr   r1, .L3+4  //VMA
  ldr   r2, .L3+8  //END
  b .L5
.L4:
  ldr   r3, [r0]
  str   r3, [r1]
  add   r0, #4
  add 	r0, #4
.L5:
  cmp	  r1, r2
  bne	  .L4
  ldr	  r0, .L3 + 12
  ldr   r2, .L3 + 16
  eor   r3, r3
  b     .L7
.L6:
  str   r3, [r0]
  add   r0, #4
.L7:
  cmp   r0, r2
  bne   .L6
  bl    main
  .align 2
.L3:
  .word __DATA_LMA  //0
  .word __DATA_VMA  //4
  .word __DATA_END  //8
  .word __BSS_VMA   //12
  .word __BSS_END   //16
