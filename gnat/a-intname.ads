package Ada.Interrupts.Names is

  pragma Implementation_Defined;

  ----------------
  -- Interrupts --
  ----------------

  -- CAN Bus Interrupt (CAN not supported on LPC1114)
  C_CAN : constant Interrupt_ID := 13;

  -- SPI0 Interrupt
  SPI0 : constant Interrupt_ID := 14;

  -- I2C Bus Interrupt
  I2C : constant Interrupt_ID := 15;

  -- 16-bit Counter Block 0
  CT16B0 : constant Interrupt_ID := 16;

  -- 16-bit Counter Block 1
  CT16B1 : constant Interrupt_ID := 17;

  -- 32-bit Counter Block 0
  CT32B0 : constant Interrupt_ID := 18;
  
  -- 32-bit Counter Block 1
  CT32B1 : constant Interrupt_ID := 19;

  -- SPI1 Interrupt
  SPI1 : constant Interrupt_ID := 20;

  -- UART Interrupt
  UART : constant Interrupt_ID := 21;

  -- ADC Interrupt
  ADC : constant Interrupt_ID := 24;

  -- WDT Gloval Interrupt
  WDT : constant Interrupt_ID := 25;

  -- Brown-out Detect Interrupt
  BOD : constant Interrupt_ID := 26;

  -- GPIO Port 3 Interrupt
  PIO_3 : constant Interrupt_ID := 28;

  -- GPIO Port 2 Interrupt
  PIO_2 : constant Interrupt_ID := 29;

  -- GPIO Port 1 Interrupt
  PIO_1 : constant Interrupt_ID := 30;

  -- GPIO Port 0 Interrupt
  PIO_0 : constant Interrupt_ID := 31;


end Ada.Interrupts.Names;
