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
    SEL : AD0CR_SEL_Field;
    CLKDIV : AD0CR_CLKDIV_Field;
    BURST : AD0CR_BURST_Field;
    CLKS : AD0CR_CLKS_Field;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_20_23 : Interfaces.LPC1114.UInt4;
    START : AD0CR_START_Field;
    EDGE : AD0CR_EDGE_Field;
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
    Reserved_0_5 : Interfaces.LPC1114.UInt6;
    V_VREF : AD0DR_V_VREF_Field;
    Reserved_16_23 : Interfaces.LPC1114.Byte;
    CHN : AD0DR_CHN_Field;
    Reserved_27_29 : Interfaces.LPC1114.UInt3;
    OVERRUN : AD0DR_OVERRUN_Field;
    DONE : AD0DR_DONE_Field;
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
    ADINTEN : AD0INTEN_ADINTEN_Field;
    ADGINTEN : AD0INTEN_ADGINTEN_Field;
    Reserved_9_31 : Interfaces.LPC1114.UInt23;
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
    DONE : AD0STAT_DONE;
    OVERRUN : AD0STAT_OVERRUN;
    ADINT : AD0STAT_ADINT;
    Reserved_17_31 : Interfaces.LPC1114.UInt15;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for AD0STAT_Register use record
    DONE at 0 range 0..7;
    OVERRUN at 0 range 8..15;
    ADINT at 0 range 16..16;
    Reserved_17_31 at 0 range 17..31;
  end record;


  type ADC_Peripheral is record
    CR    : aliased AD0CR_Register;
    GDR   : aliased AD0DR_Register;
    Reserved : Interfaces.LPC1114.UInt32;
    INTEN : aliased AD0INTEN_Register;
    DR0   : aliased AD0DR_Register;
    DR1   : aliased AD0DR_Register;
    DR2   : aliased AD0DR_Register;
    DR3   : aliased AD0DR_Register;
    DR4   : aliased AD0DR_Register;
    DR5   : aliased AD0DR_Register;
    DR6   : aliased AD0DR_Register;
    DR7   : aliased AD0DR_Register;
    STAT  : aliased AD0STAT_Register;
  end record
    with Volatile;

  for ADC_Peripheral use record
    CR    at 16#00# range 0..31;
    GDR   at 16#04# range 0..31;
    Reserved at 16#08# range 0..31;
    INTEN at 16#0C# range 0..31;
    DR0   at 16#10# range 0..31;
    DR1   at 16#14# range 0..31;
    DR2   at 16#18# range 0..31;
    DR3   at 16#1C# range 0..31;
    DR4   at 16#20# range 0..31;
    DR5   at 16#24# range 0..31;
    DR6   at 16#28# range 0..31;
    DR7   at 16#2C# range 0..31;
    STAT  at 16#30# range 0..31;
  end record;

  ADC : aliased ADC_Peripheral
    with Import, Address => ADC_Base;

end Interfaces.LPC1114.ADC;
