pragma Style_Checks (off);

with System;

package Interfaces.LPC1114.WDT is
  pragma Preelaborate;
  pragma No_Elaboration_Code_All;

  ---------------
  -- Registers --
  ---------------

  subtype WDMOD_WDEN_Field is Interfaces.LPC1114.Bit;
  subtype WDMOD_WDRESET_Field is Interfaces.LPC1114.Bit;
  subtype WDMOD_WDTOF_Field is Interfaces.LPC1114.Bit;
  subtype WDMOD_WDINT_Field is Interfaces.LPC1114.Bit;

  -- Watchdog Mode Register
  type WDMOD_Register is record
    WDEN : WDMOD_WDEN_Field;
    WDRESET : WDMOD_WDEN_Field;
    WDTOF : WDMOD_WDEN_Field;
    WDINT : WDMOD_WDINT_Field;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_4_7 : Interfaces.LPC1114.UInt4;
    Reserved_8_31 : Interfaces.LPC1114.UInt24;
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
    Count : WDTC_Count_Field;
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


  subtype WDTV_Count_Field is Interfaces.LPC1114.UInt24;

  -- Watchdog Timer Value Register
  type WDTV_Register is record
    Count : WDTV_Count_Field;
    Reserved_24_31 : Interfaces.LPC1114.Byte;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for WDTV_Register use record
    Count at 0 range 0..23;
    Reserved_24_31 at 0 range 24..31;
  end record;


  type WDT_Peripheral is record
    MODR : aliased WDMOD_Register;
    TC   : aliased WDTC_Register;
    FEED : aliased WDFEED_Register;
    TV   : aliased WDTV_Register;
  end record
    with Volatile;

  for WDT_Peripheral use record
    MODR at 16#0# range 0..31;
    TC   at 16#4# range 0..31;
    FEED at 16#8# range 0..31;
    TV   at 16#C# range 0..31;
  end record;

  WDT : aliased WDT_Peripheral
    with Import, Address => WDT_Base;

end Interfaces.LPC1114.WDT;
