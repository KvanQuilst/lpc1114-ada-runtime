pragma Style_Checks (off);

with System;

package Interfaces.LPC1114.WDT is
  pragma Preelaborate;
  pragma No_Elaboration_Code_All;

  ---------------
  -- Registers --
  ---------------

  subtype WDMOD_WDEN_Field is Intefaces.LPC1114.Bit;
  subtype WDMOD_WDRESET_Field is Intefaces.LPC1114.Bit;
  subtype WDMOD_WDTOF_Field is Intefaces.LPC1114.Bit;
  subtype WDMOD_WDINT_Field is Intefaces.LPC1114.Bit;

  -- Watchdog Mode Register
  type WDMOD_Register is record
    WDEN : WDMOD_WDEN_Field := 0;
    WDRESET : WDMOD_WDEN_Field := 0;
    WDTOF : WDMOD_WDEN_Field := 0;
    WDINT : WDMOD_WDINT_Field := 0;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_4_7 : Interfaces.LPC1114.UInt4;
    Reserced_8_31 : Interfaces.LPC1114.UInt24;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for WDMOD_Register use record
    WDEN at 0 range 0..0;
    WDRESET at 0 range 1..1;
    WDTOF at 0 range 2..2;
    WDINT at 0 range 3..3;
    Reserved_4_7 at 0 range 4..7;
    Reserved_8_31 at 0 range 8..31;
  end record;


  subtype WDTC_Count_Field is Interfaces.LPC1114.UInt24;

  -- Watchdog Timer Constant Register
  type WDTC_Register is record
    Count : WDTC_Count_Field := 16#000000FF#;
    Reserved_24_31 : Interfaces.LPC1114.Byte;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for WDTC_Register use record
    Count at 0 range 0..23;
    Reserved_24_31 at 0 range 24..31;
  end record;


  subtype WDFEED_Feed_Field is Interfaces.LPC1114.Byte;

  -- Watchdog Feed Register
  type WDFEED_Register is record
    -- Feed value should be 0xAA followed 0x55
    Feed : WDFEED_Feed_Field;
    Reserved_8_31 : Interfaces.LPC1114.UInt24;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for WDFEED_Register use record
    Feed at 0 range 0..7;
    Reserved_8_31 at 0 range 8..31;
  end record;


  subtype WDTC_Count_Field is Interfaces.LPC1114.UInt24;

  -- Watchdog Timer Value Register
  type WDTC_Register is record
    Count : WDTC_Count_Field := 16#000000FF#;
    Reserved_24_31 : Interfaces.LPC1114.Byte;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for WDTC_Register use record
    Count at 0 range 0..23;
    Reserved_24_31 at 0 range 24..31;
  end record;


  type WDT is record
    WDMOD  : aliased WDMOD_Register;
    WDTC   : aliased WDTC_Register;
    WDFEED : aliased WDFEED_Register;
    WDTV   : aliased WDTV_Register;
  end record
    with Volatile;

  for WDT use record
    WDMOD  at 16#0# range 0..31;
    WDTC   at 16#4# range 0..31;
    WDFEED at 16#8# range 0..31;
    WDTV   at 16#C# range 0..31;
  end record;

  WDT_Block : aliased WDT
    with Import, Address => WDT_Base;

end Interfaces.LPC1114.WDT;
