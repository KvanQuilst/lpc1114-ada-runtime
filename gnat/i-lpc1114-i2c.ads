pragma Style_Checks (off);

with System;

package Interfaces.LPC1114.I2C is
  pragma Preelaborate;
  pragma No_Elaboration_Code_All;

  ---------------
  -- Registers --
  ---------------

  subtype I2C0CONSET_AA_Field is Interfaces.LPC1114.Bit;
  subtype I2C0CONSET_SI_Field is Interfaces.LPC1114.Bit;
  subtype I2C0CONSET_STO_Field is Interfaces.LPC1114.Bit;
  subtype I2C0CONSET_STA_Field is Interfaces.LPC1114.Bit;
  subtype I2C0CONSET_I2EN_Field is Interfaces.LPC1114.Bit;

  -- I2C Control Set Register
  type I2C0CONSET_Register is record
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_0_1 : Interfaces.LPC1114.UInt2;
    AA : I2C0CONSET_AA_Field := 0;
    SI : I2C0CONSET_SI_Field := 0;
    STO : I2C0CONSET_STO_Field := 0;
    STA : I2C0CONSET_STA_Field := 0;
    I2EN : I2C0CONSET_I2EN_Field := 0;
    Reserved_7_31 : Interfaces.LPC1114.UInt25;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for I2C0CONSET_Register use record
    Reserved_0_1 at 0 range 0..1;
    AA at 0 range 2..2;
    SI at 0 range 3..3;
    STO at 0 range 4..4;
    STA at 0 range 5..5;
    I2EN at 0 range 6..6;
    Reserved_7_31 at 0 range 7..31;
  end record;


  subtype I2C0STAT_Status_Field is Interfaces.LPC1114.UInt5;

  -- I2C Status Register
  type I2C0STAT_Register is record
    Reserved_0_2 : Interfaces.LPC1114.UInt3 := 0;
    Status : I2C0STAT_Status_Field := 16#1F#;
    Reserved_8_31 : Interfaces.LPC1114.UInt24;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for I2C0STAT_Register use record
    Reserved_0_2 at 0 range 0..2;
    Status at 0 range 3..7;
    Reserved_8_31 at 0 range 8..31;
  end record;


  subtype I2C0DAT_Data_Field is Interfaces.LPC1114.Byte;

  -- I2C Data Register
  type I2C0DAT_Register is record
    Data : I2C0DAT_Data_Field := 0;
    Reserved_8_31 : Interfaces.LPC1114.UInt24;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for I2C0DAT_Register use record
    Data at 0 range 0..7;
    Reserved_8_31 at 0 range 8..31;
  end record;


  subtype I2C0ADR_GC_Field is Interfaces.LPC1114.Bit;
  subtype I2C0ADR_Address_Field is Interfaces.LPC1114.UInt7;

  -- I2C Slave Address Register
  type I2C0ADR_Register is record
    GC : I2C0ADR_GC_Field := 0;
    Address : I2C0ADR_Address_Field := 16#00#;
    Reserved_8_31 : Interfaces.LPC1114.UInt24;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for I2C0ADR_Register use record
    GC at 0 range 0..0;
    Address at 0 range 1..7;
    Reserved_8_31 at 0 range 8..31;
  end record;


  subtype I2C0SCLH_SCLH_Field is Interfaces.LPC1114.UInt16;

  -- I2C SCL HIGH Duty Cycle Register
  type I2C0SCLH_Register is record
    SCLH : I2C0SCLH_SCLH_Field := 16#0004#;
    Reserved_16_31 : Interfaces.LPC1114.UInt16;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for I2C0SCLH_Register use record
    SCLH at 0 range 0..15;
    Reserved_16_31 at 0 range 16..31;
  end record;


  subtype I2C0SCLL_SCLL_Field is Interfaces.LPC1114.UInt16;

  -- I2C SCL HIGH Duty Cycle Register
  type I2C0SCLL_Register is record
    SCLL : I2C0SCLL_SCLL_Field := 16#0004#;
    Reserved_16_31 : Interfaces.LPC1114.UInt16;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for I2C0SCLL_Register use record
    SCLL at 0 range 0..15;
    Reserved_16_31 at 0 range 16..31;
  end record;


  subtype I2C0CONCLR_AAC_Field is Interfaces.LPC1114.Bit;
  subtype I2C0CONCLR_SIC_Field is Interfaces.LPC1114.Bit;
  subtype I2C0CONCLR_STAC_Field is Interfaces.LPC1114.Bit;
  subtype I2C0CONCLR_I2ENC_Field is Interfaces.LPC1114.Bit;

  -- I2C Control Clear Register
  type I2C0CONCLR_Register is record
    -- DO NOT WRITE 1 TO THIS BIT
    Reserved_0_1 : Interfaces.LPC1114.UInt2;
    AAC : I2C0CONCLR_AAC_Field := 0;
    SIC : I2C0CONCLR_SIC_Field := 0;
    -- DO NOT WRITE 1 TO THIS BIT
    Reserved_4 : Interfaces.LPC1114.Bit;
    STAC : I2C0CONCLR_STAC_Field := 0;
    I2ENC : I2C0CONCLR_I2ENC_Field := 0;
    -- DO NOT WRITE 1 TO THIS BIT
    Reserved_7 : Interfaces.LPC1114.Bit;
    Reserved_8_31 : Interfaces.LPC1114.UInt24;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for I2C0CONCLR_Register use record
    Reserved_0_1 at 0 range 0..1;
    AAC at 0 range 2..2;
    SIC at 0 range 3..3;
    Reserved_4 at 0 range 4..4;
    STAC at 0 range 5..5;
    I2ENC at 0 range 6..6;
    Reserved_7 at 0 range 7..7;
    Reserved_8_31 at 0 range 8..31;
  end record;


  subtype I2C0MMCTRL_MM_ENA_Field is Interfaces.LPC1114.Bit;
  subtype I2C0MMCTRL_ENA_SCL_Field is Interfaces.LPC1114.Bit;
  subtype I2C0MMCTRL_MATCH_ALL_Field is Interfaces.LPC1114.Bit;

  -- I2C Monitor Mode Control Register
  type I2C0MMCTRL_Register is record
    MM_ENA : I2C0MMCTRL_MM_ENA_Field := 0;
    ENA_SCL : I2C0MMCTRL_ENA_SCL_Field := 0;
    MATCH_ALL : I2C0MMCTRL_MATCH_ALL_Field := 0;
    Reserved_3_31 : Interfaces.LPC1114.UInt29;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for I2C0MMCTRL_Register use record
    MM_ENA at 0 range 0..0;
    ENA_SCL at 0 range 1..1;
    MATCH_ALL at 0 range 2..2;
    Reserved_3_31 at 0 range 3..31;
  end record;


  subtype I2C0DATA_BUFFER_Data_Field is Interfaces.LPC1114.Byte;

  -- I2C Data Buffer Register
  type I2C0DATA_BUFFER_Register is record
    Data : I2C0DATA_BUFFER_Data_Field := 0;
    Reserved_8_31 : Interfaces.LPC1114.UInt24 := 0;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for I2C0DATA_BUFFER_Register use record
    Data at 0 range 0..7;
    Reserved_8_31 at 0 range 8..31;
  end record;


  subtype I2C0MASK_MASK_Field is Interfaces.LPC1114.UInt7;

  -- I2C Mask Register
  type I2C0MASK_Register is record
    -- DO NOT WRITE 1 TO THIS BIT
    Reserved_0 : Interfaces.LPC1114.Bit := 0;
    MASK : I2C0MASK_MASK_Field := 16#00#;
    Reserved_8_31 : Interfaces.LPC1114.UInt24 := 4;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for I2C0MASK_Register use record
    Reserved_0 at 0 range 0..0;
    MASK at 0 range 1..7;
    Reserved_8_31 at 0 range 8..31;
  end record;


  type I2C is record
    I2C0CONSET      : aliased I2C0CONSET_Register;
    I2C0STAT        : aliased I2C0STAT_Register;
    I2C0DAT         : aliased I2C0DAT_Register;
    I2C0ADR0        : aliased I2C0ADR_Register;
    I2C0SCLH        : aliased I2C0SCLH_Register;
    I2C0SCLL        : aliased I2C0SCLL_Register;
    I2C0CONCLR      : aliased I2C0CONCLR_Register;
    I2C0MMCTRL      : aliased I2C0MMCTRL_Register;
    I2C0ADR1        : aliased I2C0ADR_Register;
    I2C0ADR2        : aliased I2C0ADR_Register;
    I2C0ADR3        : aliased I2C0ADR_Register;
    I2C0DATA_BUFFER : aliased I2C0DATA_BUFFER_Register;
    I2C0MASK0       : aliased I2C0MASK_Register;
    I2C0MASK1       : aliased I2C0MASK_Register;
    I2C0MASK2       : aliased I2C0MASK_Register;
    I2C0MASK3       : aliased I2C0MASK_Register;
  end record
    with Volatile;

  for I2C use record
    I2C0CONSET      at 16#00# range 0..31;
    I2C0STAT        at 16#04# range 0..31;
    I2C0DAT         at 16#08# range 0..31;
    I2C0ADR0        at 16#0C# range 0..31;
    I2C0SCLH        at 16#10# range 0..31;
    I2C0SCLL        at 16#14# range 0..31;
    I2C0CONCLR      at 16#18# range 0..31;
    I2C0MMCTRL      at 16#1C# range 0..31;
    I2C0ADR1        at 16#20# range 0..31;
    I2C0ADR2        at 16#24# range 0..31;
    I2C0ADR3        at 16#28# range 0..31;
    I2C0DATA_BUFFER at 16#2C# range 0..31;
    I2C0MASK0       at 16#30# range 0..31;
    I2C0MASK1       at 16#34# range 0..31;
    I2C0MASK2       at 16#38# range 0..31;
    I2C0MASK3       at 16#3C# range 0..31;
  end record;

  I2C_Block : aliased I2C
    with Import, Address => I2C_Base;

end Interfaces.LPC1114.I2C;
