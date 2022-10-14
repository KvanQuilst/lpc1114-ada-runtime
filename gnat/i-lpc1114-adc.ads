pragma Style_Checks (off);

with System;

package Interfaces.LPC1114.ADC is
  pragma Preelaborate;
  pragma No_Elaboration_Code_All;

  ---------------
  -- Registers --
  ---------------

  subtype AD0CR_SEL_Field is Interfaces.LPC1114.Byte;
  subtype AD0CR_CLKDIV_Field is Interfaces.LPC1114.Byte;
  subtype AD0CR_BURST_Field is Interfaces.LPC1114.Bit;
  subtype AD0CR_CLKS_Field is Interfaces.LPC1114.UInt3;
  subtype AD0CR_START_Field is Interfaces.LPC1114.UInt3;
  subtype AD0CR_EDGE_Field is Interfaces.LPC1114.Bit;

  -- A/D Control Register
  type AD0CR_Register is record
    SEL : AD0CR_SEL_Field := 16#00#;
    CLKDIV : AD0CR_CLKDIV_Field := 0;
    BURST : AD0CR_BURST_Field := 0;
    CLKS : AD0CR_CLKS_Field := 2#000#;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_20_23 : Interfaces.LPC1114.UInt4;
    START : AD0CR_START_Field := 0;
    EDGE : AD0CR_EDGE_Field := 0;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_28_31 : Interfaces.LPC1114.UInt4;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for AD0CR_Register use record
    SEL at 0 range 0..7;
    CLKDIV at 0 range 8..15;
    BURST at 0 range 16..16;
    CLKS at 0 range 17..19;
    Reserved_20_23 at 0 range 20..23;
    START at 0 range 24..26;
    EDGE at 0 range 27..27;
    Reserved_28_31 at 0 range 28..31;
  end record;

  
  subtype AD0DR_V_VREF_Field is Interfaces.LPC1114.UInt10;
  subtype AD0DR_CHN_Field is Interfaces.LPC1114.UInt3;
  subtype AD0DR_OVERRUN_Field is Interfaces.LPC1114.Bit;
  subtype AD0DR_DONE_Field is Interfaces.LPC1114.Bit;

  -- A/D Data Register
  type AD0DR_Register is record
    Reserved_0_5 : Interfaces.LPC1114.UInt6 := 0;
    V_VREF : AD0DR_V_VREF_Field;
    Reserved_16_23 : Interfaces.LPC1114.Byte := 0;
    CHN : AD0DR_CHN_Field;
    Reserved_27_29 : Interfaces.LPC1114.UInt3 := 0;
    OVERRUN : AD0DR_OVERRUN_Field := 0;
    DONE : AD0DR_DONE_Field := 0;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for AD0DR_Register use record
    Reserved_0_5 at 0 range 0..5;
    V_VREF at 0 range 6..15;
    Reserved_16_23 at 0 range 16..23;
    CHN at 0 range 24..26;
    Reserved_27_29 at 0 range 27..29;
    OVERRUN at 0 range 30..30;
    DONE at 0 range 31..31;
  end record;


  subtype AD0INTEN_ADINTEN_Field is Interfaces.LPC1114.Byte;
  subtype AD0INTEN_ADGINTEN_Field is Interfaces.LPC1114.Bit;

  -- A/D Interrupts Enable Register
  type AD0INTEN_Register is record
    ADINTEN : AD0INTEN_ADINTEN_Field := 16#00#;
    ADGINTEN : AD0INTEN_ADGINTEN_Field := 2#1#;
    Reserved_9_31 : Interfaces.LPC1114.UInt23 := 0;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for AD0INTEN_Register use record
    ADINTEN at 0 range 0..7;
    ADGINTEN at 0 range 8..8;
    Reserved_9_31 at 0 range 9..31;
  end record;


  subtype AD0STAT_DONE is Interfaces.LPC1114.Byte;
  subtype AD0STAT_OVERRUN is Interfaces.LPC1114.Byte;
  subtype AD0STAT_ADINT is Interfaces.LPC1114.Bit;

  -- A/D Status Register
  type AD0STAT_Register is record
    DONE : AD0STAT_DONE := 0;
    OVERRUN : AD0STAT_OVERRUN := 0;
    ADINT : AD0STAT_ADINT := 0;
    Reserved_17_31 : Interfaces.LPC1114.UInt15 := 0;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for AD0STAT_Register use record
    DONE at 0 range 0..7;
    OVERRUN at 0 range 8..15;
    ADINT at 0 range 16..16;
    Reserved_17_31 at 0 range 17..31;
  end record;


  type ADC is record
    AD0CR    : aliased AD0CR_Register;
    AD0GDR   : aliased AD0DR_Register;
    Reserved : Interfaces.LPC1114.UInt32;
    AD0INTEN : aliased AD0INTEN_Register;
    AD0DR0   : aliased AD0DR_Register;
    AD0DR1   : aliased AD0DR_Register;
    AD0DR2   : aliased AD0DR_Register;
    AD0DR3   : aliased AD0DR_Register;
    AD0DR4   : aliased AD0DR_Register;
    AD0DR5   : aliased AD0DR_Register;
    AD0DR6   : aliased AD0DR_Register;
    AD0DR7   : aliased AD0DR_Register;
    AD0STAT  : aliased AD0STAT_Register;
  end record
    with Volatile;

  for ADC use record
    AD0CR    at 16#00# range 0..31;
    AD0GDR   at 16#04# range 0..31;
    Reserved at 16#08# range 0..31;
    AD0INTEN at 16#0C# range 0..31;
    AD0DR0   at 16#10# range 0..31;
    AD0DR1   at 16#14# range 0..31;
    AD0DR2   at 16#18# range 0..31;
    AD0DR3   at 16#1C# range 0..31;
    AD0DR4   at 16#20# range 0..31;
    AD0DR5   at 16#24# range 0..31;
    AD0DR6   at 16#28# range 0..31;
    AD0DR7   at 16#2C# range 0..31;
    AD0STAT  at 16#30# range 0..31;
  end record;


  ADC_Block : aliased ADC
    with Import, Address => ADC_Base;


end Interfaces.LPC1114.ADC;
