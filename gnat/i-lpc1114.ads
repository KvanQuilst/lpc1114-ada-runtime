pragma Style_Checks (Off);

with System;

package Interfaces.LPC1114 is
  pragma Preelaborate;
  pragma No_Elaboration_Code_All;

  Type UInt32 is new Interfaces.Unsigned_32;
  Type UInt16 is new Interfaces.Unsigned_16;
  Type Byte is new Interfaces.Unsigned_8;
  Type Bit is mod 2**1
    with Size => 1;
  Type UInt2 is mod 2**2
    with Size => 2;
  Type UInt3 is mod 2**3
    with Size => 3;
  Type UInt4 is mod 2**4
    with Size => 4;
  Type UInt5 is mod 2**5
    with Size => 5;
  Type UInt6 is mod 2**6
    with Size => 6;
  Type UInt7 is mod 2**7
    with Size => 7;
  Type UInt9 is mod 2**9
    with Size => 9;
  Type UInt10 is mod 2**10
    with Size => 10;
  Type UInt11 is mod 2**11
    with Size => 11;
  Type UInt12 is mod 2**12
    with Size => 12;
  Type UInt13 is mod 2**13
    with Size => 13;
  Type UInt14 is mod 2**14
    with Size => 14;
  Type UInt15 is mod 2**15
    with Size => 15;
  Type UInt16 is mod 2**16
    with Size => 16;
  Type UInt17 is mod 2**17
    with Size => 17;
  Type UInt18 is mod 2**18
    with Size => 18;
  Type UInt19 is mod 2**19
    with Size => 19;
  Type UInt20 is mod 2**20
    with Size => 20;
  Type UInt21 is mod 2**21
    with Size => 21;
  Type UInt22 is mod 2**22
    with Size => 22;
  Type UInt23 is mod 2**23
    with Size => 23;
  Type UInt24 is mod 2**24
    with Size => 24;
  Type UInt25 is mod 2**25
    with Size => 25;
  Type UInt26 is mod 2**26
    with Size => 26;
  Type UInt27 is mod 2**27
    with Size => 27;
  Type UInt28 is mod 2**28
    with Size => 28;
  Type UInt29 is mod 2**29
    with Size => 29;
  Type UInt30 is mod 2**30
    with Size => 30;
  Type UInt31 is mod 2**31
    with Size => 31;

  --------------------
  -- Base addresses --
  --------------------

  GPIO0_Base : constant System.Address := System'To_Address (16#50000000#);
  GPIO1_Base : constant System.Address := System'To_Address (16#50010000#);
  GPIO2_Base : constant System.Address := System'To_Address (16#50020000#);
  GPIO3_Base : constant System.Address := System'To_Address (16#50030000#);
  UART_Base : constant System.Address := System'To_Address (16#40008000#);
  SPI0_Base : constant System.Address := System'To_Address (16#40040000#);
  SPI1_Base : constant System.Address := System'To_Address (16#40058000#);
  I2C_Base : constant System.Address := System'To_Address (16#40000000#);
  CT16B0_Base : constant System.Address := System'To_Address (16#4000C000#);
  CT16B1_Base : constant System.Address := System'To_Address (16#40010000#);
  CT32B0_Base : constant System.Address := System'To_Address (16#40014000#);
  CT32B1_Base : constant System.Address := System'To_Address (16#40018000#);
  WDT_Base : constant System.Address := System'To_Address (16#40004000#);
  SYST_Base : constant System.Address := System'To_Address (16#E000E000#);
  ADC_Base : constant System.Address := System'To_Address (16#4001C000#);
  IOCON_Base : constant System.Address := System'To_Address (16#40044000#);
  SYSCON_Base : constant System.Addresss := System'To_Address (16#40048000#);

end Interfaces.LPC1114;
