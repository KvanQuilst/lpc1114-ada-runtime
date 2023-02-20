  .syntax unified
  .cpu cortex-m0
  .thumb

  .text
  .globl __vectors
  .p2align 9

__vectors: /* Cortex-M Core Interrupts */
  .word   __INITIAL_SP         /* stack top address */
  .word   fault                /* 1 Reset */
  .word   fault                /* 2 NMI */
  .word   fault                /* 3 HardFault */
  .word   fault                /* 4 Reserved */
  .word   fault                /* 5 Reserved */
  .word   fault                /* 6 Reserved */
  .word   fault                /* 7 Reserved */
  .word   fault                /* 8 Reserved */
  .word   fault                /* 9 Reserved */
  .word   fault                /* 10 Reserved */
  .word   __gnat_sv_call_trap  /* 11 SVCall */
  .word   fault                /* 12 Reserved */
  .word   fault                /* 13 Reserved */
  .word   __gnat_pend_sv_trap  /* 14 PendSV */
  .word   __gnat_sys_tick_trap /* 15  SysTick */

  .word   __gnat_irq_trap      /* 16 IRQ0 PIO0_0 */
  .word   __gnat_irq_trap      /* 17 IRQ1 PIO0_1 */
  .word   __gnat_irq_trap      /* 18 IRQ2 PIO0_2 */
  .word   __gnat_irq_trap      /* 19 IRQ3 PIO0_3 */
  .word   __gnat_irq_trap      /* 20 IRQ4 PIO0_4 */
  .word   __gnat_irq_trap      /* 21 IRQ5 PIO0_5 */
  .word   __gnat_irq_trap      /* 22 IRQ6 PIO0_6 */
  .word   __gnat_irq_trap      /* 23 IRQ7 PIO0_7 */
  .word   __gnat_irq_trap      /* 24 IRQ8 PIO0_8 */
  .word   __gnat_irq_trap      /* 25 IRQ9 PIO0_9 */
  .word   __gnat_irq_trap      /* 26 IRQ10 PIO0_10 */
  .word   __gnat_irq_trap      /* 27 IRQ11 PIO0_11 */
  .word   __gnat_irq_trap      /* 28 IRQ12 PIO1_0 */
  .word   __gnat_irq_trap      /* 29 IRQ13 C_CAN */
  .word   __gnat_irq_trap      /* 30 IRQ14 SPI/SSP1 */
  .word   __gnat_irq_trap      /* 31 IRQ15 I2C */
  .word   __gnat_irq_trap      /* 32 IRQ16 CT16B0 */
  .word   __gnat_irq_trap      /* 33 IRQ17 CT16B1 */
  .word   __gnat_irq_trap      /* 34 IRQ18 CT32B0 */
  .word   __gnat_irq_trap      /* 35 IRQ19 CT32B1 */
  .word   __gnat_irq_trap      /* 36 IRQ20 SPI/SSP0 */
  .word   __gnat_irq_trap      /* 37 IRQ21 UART */
  .word   __gnat_irq_trap      /* 38 IRQ22 Reserved */
  .word   __gnat_irq_trap      /* 39 IRQ23 Reserved */
  .word   __gnat_irq_trap      /* 40 IRQ24 ADC */
  .word   __gnat_irq_trap      /* 41 IRQ25 WDT */
  .word   __gnat_irq_trap      /* 42 IRQ26 BOD */
  .word   __gnat_irq_trap      /* 43 IRQ27 Reserved*/
  .word   __gnat_irq_trap      /* 44 IRQ28 PIO_3 */
  .word   __gnat_irq_trap      /* 45 IRQ29 PIO_2 */
  .word   __gnat_irq_trap      /* 46 IRQ30 PIO_1 */
  .word   __gnat_irq_trap      /* 47 IRQ31 PIO_0 */

  .text

  .thumb_func
.weak __gnat_irq_trap
.type __gnat_irq_trap, %function
__gnat_irq_trap:
0:  b 0b
  .size __gnat_irq_trap, . -__gnat_irq_trap

  .thumb_func
.weak __gnat_sv_call_trap
.type __gnat_sv_call_trap, %function
__gnat_sv_call_trap:
0:  b 0b
  .size __gnat_sv_call_trap, . - __gnat_sv_call_trap

  .thumb_func
.weak __gnat_pend_sv_trap
.type __gnat_pend_sv_trap, %function
__gnat_pend_sv_trap:
0:  b 0b
  .size __gnat_pend_sv_trap, . - __gnat_sv_call_trap

  .thumb_func
.weak __gnat_sys_tick_trap
.type __gnat_sys_tick_trap, %function
__gnat_sys_tick_trap:
0:  b 0b
  .size __gnat_sys_tick_trap, . - __gnat_sys_tick_trap

  .thumb_func
fault: b fault

