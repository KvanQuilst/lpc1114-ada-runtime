pragma Style_Checks (off);

with System;

package Interfaces.LPC1114.SYST is
  pragma Preelaborate;
  pragma No_Elaborate_Code_All;

  ---------------
  -- Registers --
  ---------------

  subtype SYST_CSR_ENABLE_Field is Interfaces.LPC1114.Bit;
  subtype SYST_CSR_TICKINT_Field is Interfaces.LPC1114.Bit;
  subtype SYST_CSR_CLKSOURCE_Field is Interfaces.LPC1114.Bit;
  subtype SYST_CSR_COUNTFLAG_Field is Interfaces.LPC1114.Bit;

  -- SysTick Timer Control and Status Register
  type SYST_CSR_Register is record
    ENABLE : SYST_CSR_ENABLE_Field := 0;
    TICKINT : SYST_CSR_TICKINT_Field := 0;
    CLKSOURCE : SYST_CSR_CLKSOURCE_Field := 0;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_3_15 : Interfaces.LPC1114.UInt13;
    COUNTFLAG : SYST_CSR_COUNTFLAG_Field := 0;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_17_31 : Interfaces.LPC1114.UInt15;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for SYST_CSR_Register use record
    ENABLE at 0 range 0..0;
    TICKINT at 0 range 1..1;
    CLKSOURCE at 0 range 2..2;
    Reserved_3_15 at 0 range 3..15;
    COUNTFLAG at 0 range 16..16;
    Reserved_17_31 at 0 range 17..31;
  end record;


  subtype SYST_RVR_RELOAD_Field is Interfaces.LPC1114.UInt24;

  -- System Timer Reload Value Register
  type SYST_RVR_Register is record
    RELOAD : SYST_RVR_RELOAD_Field := 0;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_24_31 : Interfaces.LPC1114.Byte;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for SYS_RVR_Register use record
    RELOAD at 0 range 0..23;
    Reserved_24_31 at 0 range 24..31;
  end record;


  subtype SYST_CVR_CURRENT_Field is Interfaces.LPC1114.UInt24;

  -- System Timer Reload Value Register
  type SYST_CVR_Register is record
    CURRENT : SYST_CVR_CURRENT_Field := 0;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_24_31 : Interfaces.LPC1114.Byte;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for SYS_CVR_Register use record
    CURRENT at 0 range 0..23;
    Reserved_24_31 at 0 range 24..31;
  end record;


  subtype SYST_CALIB_TENMS_Field is Interfaces.LCP1114.UInt24;
  subtype SYST_CALIB_SKEW_Field is Interfaces.LPC1114.Bit;
  subtype SYST_CALIB_NOREF_Field is Interfaces.LPC1114.Bit;

  -- System Timer Calibration Value Register
  type SYST_CALIB_Register is record
    TENMS : SYST_CALIB_TENMS_Field := 16#4#;
    Reserved_24_29 : Interfaces.LPC1114.UInt6;
    SKEW : SYST_CALIB_SKEW_Field := 0;
    NOREF : SYST_CALIB_NOREF_Field := 0;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for SYST_CALIB_Register use record
    TENMS at 0 range 0..23;
    Reserved_24_29 at 0 range 24..29;
    SKEW at 0 range 30..30;
    NOREF at 0 range 31..31;
  end record;


  type SYST is record
    SYST_CSR   : aliased SYST_CSR_Register;
    SYST_RVR   : aliased SYST_RVR_Register;
    SYST_CVR   : aliased SYST_CVR_Register;
    SYST_CALIB : aliased SYST_CALIB_Register;
  end record
    with Volatile;

  for SYST use record
    SYST_CSR   at 16#00# range 0..31;
    SYST_RVR   at 16#04# range 0..31;
    SYST_RVR   at 16#08# range 0..31;
    SYST_CALIB at 16#0C# range 0..31;
  end record;

  
  SYST_Block : aliased SYST
    with Import, Address => SYST_Base;

end Interfaces.LPC1114.SYST;
