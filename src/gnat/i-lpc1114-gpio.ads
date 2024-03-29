pragma Style_Checks (off);

with System;

package Interfaces.LPC1114.GPIO is
  pragma Preelaborate;
  pragma No_Elaboration_Code_All;

  ---------------
  -- Registers --
  ---------------

  subtype GPIO_DATA_Field   is Interfaces.LPC1114.UInt12;
  subtype GPIO_IO_Field     is Interfaces.LPC1114.Bit;
  subtype GPIO_ISENSE_Field is Interfaces.LPC1114.UInt12;
  subtype GPIO_IBE_Field    is Interfaces.LPC1114.UInt12;
  subtype GPIO_IEV_Field    is Interfaces.LPC1114.UInt12;
  subtype GPIO_MASK_Field   is Interfaces.LPC1114.UInt12;
  subtype GPIO_RAWST_Field  is Interfaces.LPC1114.UInt12;
  subtype GPIO_CLR_Field    is Interfaces.LPC1114.UInt12;

  type GPIODATA_Register is record
    DATA : GPIO_DATA_Field;
    Reserved_12_31 : Interfaces.LPC1114.UInt20;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for GPIODATA_Register use record
    DATA at 0 range 0..11;
    Reserved_12_31 at 0 range 12..31;
  end record;


  type GPIODIR_Register is record
    IO0 : GPIO_IO_Field;
    IO1 : GPIO_IO_Field;
    IO2 : GPIO_IO_Field;
    IO3 : GPIO_IO_Field;
    IO4 : GPIO_IO_Field;
    IO5 : GPIO_IO_Field;
    IO6 : GPIO_IO_Field;
    IO7 : GPIO_IO_Field;
    IO8 : GPIO_IO_Field;
    IO9 : GPIO_IO_Field;
    IO10 : GPIO_IO_Field;
    IO11 : GPIO_IO_Field;
    Reserved_12_31 : Interfaces.LPC1114.UInt20;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for GPIODIR_Register use record
    IO0 at 0 range 0..0;
    IO1 at 0 range 1..1;
    IO2 at 0 range 2..2;
    IO3 at 0 range 3..3;
    IO4 at 0 range 4..4;
    IO5 at 0 range 5..5;
    IO6 at 0 range 6..6;
    IO7 at 0 range 7..7;
    IO8 at 0 range 8..8;
    IO9 at 0 range 9..9;
    IO10 at 0 range 10..10;
    IO11 at 0 range 11..11;
    Reserved_12_31 at 0 range 12..31;
  end record;


  type GPIOIS_Register is record
    ISENSE : GPIO_ISENSE_Field;
    Reserved_12_31 : Interfaces.LPC1114.UInt20;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for GPIOIS_Register use record
    ISENSE at 0 range 0..11;
    Reserved_12_31 at 0 range 12..31;
  end record;


  type GPIOIBE_Register is record
    IBE : GPIO_IBE_Field;
    Reserved_12_31 : Interfaces.LPC1114.UInt20;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for GPIOIBE_Register use record
    IBE at 0 range 0..11;
    Reserved_12_31 at 0 range 12..31;
  end record;


  type GPIOIEV_Register is record
    IEV : GPIO_IEV_Field;
    Reserved_12_31 : Interfaces.LPC1114.UInt20;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for GPIOIEV_Register use record
    IEV at 0 range 0..11;
    Reserved_12_31 at 0 range 12..31;
  end record;


  type GPIOIE_Register is record
    MASK : GPIO_MASK_Field;
    Reserved_12_31 : Interfaces.LPC1114.UInt20;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for GPIOIE_Register use record
    MASK at 0 range 0..11;
    Reserved_12_31 at 0 range 12..31;
  end record;


  -- READ ONLY --
  type GPIORIS_Register is record
    RAWST : GPIO_RAWST_Field;
    Reserved_12_31 : Interfaces.LPC1114.UInt20;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for GPIORIS_Register use record
    RAWST at 0 range 0..11;
    Reserved_12_31 at 0 range 12..31;
  end record;


  -- READ ONLY --
  type GPIOMIS_Register is record
    MASK : GPIO_MASK_Field;
    Reserved_12_31 : Interfaces.LPC1114.UInt20;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for GPIOMIS_Register use record
    MASK at 0 range 0..11;
    Reserved_12_31 at 0 range 12..31;
  end record;


  -- WRITE ONLY --
  type GPIOIC_Register is record
    CLR : GPIO_CLR_Field;
    Reserved_12_31 : Interfaces.LPC1114.UInt20;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for GPIOIC_Register use record
    CLR at 0 range 0..11;
    Reserved_12_31 at 0 range 12..31;
  end record;

  type GPIODATA_Array is array (Integer range <>) of GPIODATA_Register;
  type Reserved_Space is array (Integer range <>) of Interfaces.LPC1114.UInt32;

  type GPIO_Peripheral is record
    DATA : aliased GPIODATA_Array (0..16#0FFF#);
    Reserved  : aliased Reserved_Space (0..16#0FFF#);
    DIR  : aliased GPIODIR_Register;
    ISR  : aliased GPIOIS_Register;
    IBE  : aliased GPIOIBE_Register;
    IEV  : aliased GPIOIEV_Register;
    IE   : aliased GPIOIE_Register;
    RIS  : aliased GPIORIS_Register;
    MIS  : aliased GPIOMIS_Register;
    IC   : aliased GPIOIC_Register;
  end record
    with Volatile;

  for GPIO_Peripheral use record
    DATA at 16#0000# range 0..16#2000_0#-1;
    Reserved  at 16#4000# range 0..16#2000_0#-1;
    DIR  at 16#8000# range 0..31;
    ISR  at 16#8004# range 0..31;
    IBE  at 16#8008# range 0..31;
    IEV  at 16#800C# range 0..31;
    IE   at 16#8010# range 0..31;
    RIS  at 16#8014# range 0..31;
    MIS  at 16#8018# range 0..31;
    IC   at 16#801C# range 0..31;
  end record;

  GPIO0 : aliased GPIO_Peripheral
    with Import, Address => GPIO0_Base;

  GPIO1 : aliased GPIO_Peripheral
    with Import, Address => GPIO1_Base;

  GPIO2 : aliased GPIO_Peripheral
    with Import, Address => GPIO2_Base;

  GPIO3 : aliased GPIO_Peripheral
    with Import, Address => GPIO3_Base;


end Interfaces.LPC1114.GPIO;
