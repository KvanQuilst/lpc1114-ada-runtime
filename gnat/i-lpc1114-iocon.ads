pragma Style_Checks (off);

with System;

package Interfaces.LPC1114.IOCON is
  pragma Preelaborate;
  pragma No_Elaboration_Code_All;

  ---------------
  -- Registers --
  ---------------

  subtype PIO_FUNC_Field is Interfaces.LPC1114.UInt3;
  subtype PIO_MODE_Field is Interfaces.LPC1114.UInt2;
  subtype PIO_I2CMODE_Field is Interfaces.LPC1114.UInt2;
  subtype PIO_HYS_Field  is Interfaces.LPC1114.Bit;
  subtype PIO_OD_Field   is Interfaces.LPC1114.Bit;
  subtype PIO_ADMODE_Field is Interfaces.LPC1114.Bit;

  -- Generalized PIO Register
  type IO_PIO is record
    FUNC : PIO_FUNC_Field;
    MODE : PIO_MODE_Field;
    HYS  : PIO_HYS_Field;
    Reserved_6_9 : Interfaces.LPC1114.UInt4;
    OD   : PIO_OD_Field;
    Reserved_11_31 : Interfaces.LPC1114.UInt21;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for IO_PIO use record
    FUNC at 0 range 0..2;
    MODE at 0 range 3..4;
    HYS  at 0 range 5..5;
    Reserved_6_9 at 0 range 6..9;
    OD   at 0 range 10..10;
    Reserved_11_31 at 0 range 11..31;
  end record;

  -- Generalized I2C PIO Register
  type IO_I2CPIO is record
    FUNC : PIO_FUNC_Field;
    Reserved_3_7 : Interfaces.LPC1114.UInt5;
    I2CMODE : PIO_I2CMODE_Field;
    Reserved_10_31 : Interfaces.LPC1114.UInt22;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for IO_I2CPIO use record
    FUNC at 0 range 0..2;
    Reserved_3_7 at 0 range 3..7;
    I2CMODE at 0 range 8..9;
    Reserved_10_31 at 0 range 10..31;
  end record;

  -- Generalized AD PIO Register
  type IO_ADPIO is record
    FUNC : PIO_FUNC_Field;
    MODE : PIO_MODE_Field;
    HYS  : PIO_HYS_Field;
    Reserved_6 : Interfaces.LPC1114.Bit;
    ADMODE : PIO_ADMODE_Field;
    Reserved_8_9 : Interfaces.LPC1114.UInt2;
    OD   : PIO_OD_Field;
    Reserved_11_31 : Interfaces.LPC1114.UInt21;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for IO_ADPIO use record
    FUNC at 0 range 0..2;
    MODE at 0 range 3..4;
    HYS  at 0 range 5..5;
    Reserved_6 at 0 range 6..6;
    ADMODE at 0 range 7..7;
    Reserved_8_9 at 0 range 8..9;
    OD   at 0 range 10..10;
    Reserved_11_31 at 0 range 11..31;
  end record;


  subtype LOC_Field is Interfaces.LPC1114.UInt2;

  -- Generalized IO Location Register
  type IO_LOC is record
   LOC : LOC_Field; 
   Reserved_2_31 : Interfaces.LPC1114.UInt30;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for IO_LOC use record
    LOC at 0 range 0..1;
    Reserved_2_31 at 0 range 2..31;
  end record;


  type IOCON_RESET_PIO0_0_Register is new IO_PIO;
  type IOCON_PIO0_1_Register is new IO_PIO;
  type IOCON_PIO0_2_Register is new IO_PIO;
  type IOCON_PIO0_3_Register is new IO_PIO;
  type IOCON_PIO0_4_Register is new IO_I2CPIO;
  type IOCON_PIO0_5_Register is new IO_I2CPIO;
  type IOCON_PIO0_6_Register is new IO_PIO;
  type IOCON_PIO0_7_Register is new IO_PIO;
  type IOCON_PIO0_8_Register is new IO_PIO;
  type IOCON_PIO0_9_Register is new IO_PIO;
  type IOCON_SWCLK_PIO0_10_Register is new IO_PIO;
  type IOCON_R_PIO0_11_Register is new IO_ADPIO;

  type IOCON_R_PIO1_0_Register is new IO_ADPIO;
  type IOCON_R_PIO1_1_Register is new IO_ADPIO;
  type IOCON_R_PIO1_2_Register is new IO_ADPIO;
  type IOCON_SWDIO_PIO1_3_Register is new IO_ADPIO;
  type IOCON_PIO1_4_Register is new IO_ADPIO;
  type IOCON_PIO1_5_Register is new IO_PIO;
  type IOCON_PIO1_6_Register is new IO_PIO;
  type IOCON_PIO1_7_Register is new IO_PIO;
  type IOCON_PIO1_8_Register is new IO_PIO;
  type IOCON_PIO1_9_Register is new IO_PIO;
  type IOCON_PIO1_10_Register is new IO_ADPIO;
  type IOCON_PIO1_11_Register is new IO_ADPIO;

  type IOCON_PIO2_0_Register is new IO_PIO;
  type IOCON_PIO2_1_Register is new IO_PIO;
  type IOCON_PIO2_2_Register is new IO_PIO;
  type IOCON_PIO2_3_Register is new IO_PIO;
  type IOCON_PIO2_4_Register is new IO_PIO;
  type IOCON_PIO2_5_Register is new IO_PIO;
  type IOCON_PIO2_6_Register is new IO_PIO;
  type IOCON_PIO2_7_Register is new IO_PIO;
  type IOCON_PIO2_8_Register is new IO_PIO;
  type IOCON_PIO2_9_Register is new IO_PIO;
  type IOCON_PIO2_10_Register is new IO_PIO;
  type IOCON_PIO2_11_Register is new IO_PIO;

  type IOCON_PIO3_0_Register is new IO_PIO;
  type IOCON_PIO3_1_Register is new IO_PIO;
  type IOCON_PIO3_2_Register is new IO_PIO;
  type IOCON_PIO3_3_Register is new IO_PIO;
  type IOCON_PIO3_4_Register is new IO_PIO;
  type IOCON_PIO3_5_Register is new IO_PIO;

  type IOCON_SCK_LOC_Register is new IO_LOC;
  type IOCON_DSR_LOC_Register is new IO_LOC;
  type IOCON_DCD_LOC_Register is new IO_LOC;
  type IOCON_RI_LOC_Register is new IO_LOC;


  type IOCON_Peripheral is record
    PIO2_6        : aliased IOCON_PIO2_6_Register;
    Reserved0     : Interfaces.LPC1114.UInt32;
    PIO2_0        : aliased IOCON_PIO2_0_Register; 
    RESET_PIO0_0  : aliased IOCON_RESET_PIO0_0_Register;
    PIO0_1        : aliased IOCON_PIO0_1_Register;
    PIO1_8        : aliased IOCON_PIO1_8_Register;
    Reserved1     : Interfaces.LPC1114.UInt32;
    PIO0_2        : aliased IOCON_PIO0_2_Register;
    PIO2_7        : aliased IOCON_PIO2_7_Register;
    PIO2_8        : aliased IOCON_PIO2_8_Register; 
    PIO2_1        : aliased IOCON_PIO2_1_Register; 
    PIO0_3        : aliased IOCON_PIO0_3_Register; 
    PIO0_4        : aliased IOCON_PIO0_4_Register; 
    PIO0_5        : aliased IOCON_PIO0_5_Register; 
    PIO1_9        : aliased IOCON_PIO1_9_Register; 
    PIO3_4        : aliased IOCON_PIO3_4_Register; 
    PIO2_4        : aliased IOCON_PIO2_4_Register; 
    PIO2_5        : aliased IOCON_PIO2_5_Register; 
    PIO3_5        : aliased IOCON_PIO3_5_Register; 
    PIO0_6        : aliased IOCON_PIO0_6_Register; 
    PIO0_7        : aliased IOCON_PIO0_7_Register; 
    PIO2_9        : aliased IOCON_PIO2_9_Register; 
    PIO2_10       : aliased IOCON_PIO2_10_Register; 
    PIO2_2        : aliased IOCON_PIO2_2_Register; 
    PIO0_8        : aliased IOCON_PIO0_8_Register; 
    PIO0_9        : aliased IOCON_PIO0_9_Register; 
    SWCLK_PIO0_10 : aliased IOCON_SWCLK_PIO0_10_Register;
    PIO1_10       : aliased IOCON_PIO1_10_Register;
    PIO2_11       : aliased IOCON_PIO2_11_Register;
    R_PIO0_11     : aliased IOCON_R_PIO0_11_Register;
    R_PIO1_0      : aliased IOCON_R_PIO1_0_Register;
    R_PIO1_1      : aliased IOCON_R_PIO1_1_Register;
    R_PIO1_2      : aliased IOCON_R_PIO1_2_Register;
    PIO3_0        : aliased IOCON_PIO3_0_Register;
    PIO3_1        : aliased IOCON_PIO3_1_Register;
    PIO2_3        : aliased IOCON_PIO2_3_Register;
    SWDIO_PIO1_3  : aliased IOCON_SWDIO_PIO1_3_Register;
    PIO1_4        : aliased IOCON_PIO1_4_Register;
    PIO1_11       : aliased IOCON_PIO1_11_Register;
    PIO3_2        : aliased IOCON_PIO3_2_Register;
    PIO1_5        : aliased IOCON_PIO1_5_Register;
    PIO1_6        : aliased IOCON_PIO1_6_Register;
    PIO1_7        : aliased IOCON_PIO1_7_Register;
    PIO3_3        : aliased IOCON_PIO3_3_Register;
    SCK_LOC       : aliased IOCON_SCK_LOC_Register;
    DSR_LOC       : aliased IOCON_DSR_LOC_Register;
    DCD_LOC       : aliased IOCON_DCD_LOC_Register;
    RI_LOC        : aliased IOCON_RI_LOC_Register;
  end record
    with Volatile;

  for IOCON_Peripheral use record
    PIO2_6        at 16#00# range 0..31;
    Reserved0     at 16#04# range 0..31;
    PIO2_0        at 16#08# range 0..31;
    RESET_PIO0_0  at 16#0C# range 0..31;
    PIO0_1        at 16#10# range 0..31;
    PIO1_8        at 16#14# range 0..31;
    Reserved1     at 16#18# range 0..31;
    PIO0_2        at 16#1C# range 0..31;
    PIO2_7        at 16#20# range 0..31;
    PIO2_8        at 16#24# range 0..31;
    PIO2_1        at 16#28# range 0..31;
    PIO0_3        at 16#2C# range 0..31;
    PIO0_4        at 16#30# range 0..31;
    PIO0_5        at 16#34# range 0..31;
    PIO1_9        at 16#38# range 0..31;
    PIO3_4        at 16#3C# range 0..31;
    PIO2_4        at 16#40# range 0..31;
    PIO2_5        at 16#44# range 0..31;
    PIO3_5        at 16#48# range 0..31;
    PIO0_6        at 16#4C# range 0..31;
    PIO0_7        at 16#50# range 0..31;
    PIO2_9        at 16#54# range 0..31;
    PIO2_10       at 16#58# range 0..31; 
    PIO2_2        at 16#5C# range 0..31;
    PIO0_8        at 16#60# range 0..31;
    PIO0_9        at 16#64# range 0..31;
    SWCLK_PIO0_10 at 16#68# range 0..31;
    PIO1_10       at 16#6C# range 0..31;
    PIO2_11       at 16#70# range 0..31;
    R_PIO0_11     at 16#74# range 0..31;
    R_PIO1_0      at 16#78# range 0..31;
    R_PIO1_1      at 16#7C# range 0..31;
    R_PIO1_2      at 16#80# range 0..31;
    PIO3_0        at 16#84# range 0..31;
    PIO3_1        at 16#88# range 0..31;
    PIO2_3        at 16#8C# range 0..31;
    SWDIO_PIO1_3  at 16#90# range 0..31;
    PIO1_4        at 16#94# range 0..31;
    PIO1_11       at 16#98# range 0..31;
    PIO3_2        at 16#9C# range 0..31;
    PIO1_5        at 16#A0# range 0..31;
    PIO1_6        at 16#A4# range 0..31;
    PIO1_7        at 16#A8# range 0..31;
    PIO3_3        at 16#AC# range 0..31;
    SCK_LOC       at 16#B0# range 0..31;
    DSR_LOC       at 16#B4# range 0..31;
    DCD_LOC       at 16#B8# range 0..31;
    RI_LOC        at 16#BC# range 0..31;
  end record;           

  IOCON : aliased IOCON_Peripheral
    with Import, Address => IOCON_Base;

end Interfaces.LPC1114.IOCON;
