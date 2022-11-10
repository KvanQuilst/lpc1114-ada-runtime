pragma Style_Checks (off);

package Ada.Interrupts.Names is

  pragma Implementation_Defined;

  ----------------
  -- Interrupts --
  ----------------
  
  Sys_Tick_Interrupt : constant Interrupt_ID := -1;
  PIO0_0_Interrupt : constant Interrupt_ID := 0;
  PIO0_1_Interrupt : constant Interrupt_ID := 1;
  PIO0_2_Interrupt : constant Interrupt_ID := 2;
  PIO0_3_Interrupt : constant Interrupt_ID := 3;
  PIO0_4_Interrupt : constant Interrupt_ID := 4;
  PIO0_5_Interrupt : constant Interrupt_ID := 5;
  PIO0_6_Interrupt : constant Interrupt_ID := 6;
  PIO0_7_Interrupt : constant Interrupt_ID := 7;
  PIO0_8_Interrupt : constant Interrupt_ID := 8;
  PIO0_9_Interrupt : constant Interrupt_ID := 9;
  PIO0_10_Interrupt : constant Interrupt_ID := 10;
  PIO0_11_Interrupt : constant Interrupt_ID := 11;
  PIO1_0_Interrupt : constant Interrupt_ID := 12;
  C_CAN_Interrupt : constant Interrupt_ID := 13;
  SPI0_Interrupt : constant Interrupt_ID := 14;
  I2C_Interrupt : constant Interrupt_ID := 15;
  CT16B0_Interrupt : constant Interrupt_ID := 16;
  CT16B1_Interrupt : constant Interrupt_ID := 17;
  CT32B0_Interrupt : constant Interrupt_ID := 18;
  CT32B1_Interrupt : constant Interrupt_ID := 19;
  SPI1_Interrupt : constant Interrupt_ID := 20;
  UART_Interrupt : constant Interrupt_ID := 21;
  ADC_Interrupt : constant Interrupt_ID := 24;
  WDT_Interrupt : constant Interrupt_ID := 25;
  BOD_Interrupt : constant Interrupt_ID := 26;
  PIO_3_Interrupt : constant Interrupt_ID := 28;
  PIO_1_Interrupt : constant Interrupt_ID := 30;
  PIO_0_Interrupt : constant Interrupt_ID := 31;


end Ada.Interrupts.Names;
