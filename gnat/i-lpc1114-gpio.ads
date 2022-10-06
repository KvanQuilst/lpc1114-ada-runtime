pragma Style_Checks (off);

with System;

package Interfaces.LPC1114.GPIO is
  pragma Preelaborate;
  pragma No_Elaboration_Code_All;

  ---------------
  -- Registers --
  ---------------

  subtype GPIO_DATA_Field   is Interfaces.LPC1114.UInt12;
  subtype GPIO_IO_Field     is Interfaces.LPC1114.UInt12;
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
    Reserved_12_31 : Interfaces.LPC1114.UInt20;
  end record;


  type GPIODIR_Register is record
    IO : GPIO_IO_Field := 16#00#;
    Reserved_12_31 : Interfaces.LPC1114.UInt20;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for GPIODIR_Register use record
    IO at 0 range 0..11;
    Reserved_12_31 : Interfaces.LPC1114.UInt20;
  end record;


  type GPIOIS_Register is record
    ISENSE : GPIO_ISENSE_Field := 16#00#;
    Reserved_12_31 : Interfaces.LPC1114.UInt20;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for GPIOIS_Register use record
    ISENSE at 0 range 0..11;
    Reserved_12_31 : Interfaces.LPC1114.UInt20;
  end record;


  type GPIOIBE_Register is record
    IBE : GPIO_IBE_Field := 16#00#;
    Reserved_12_31 : Interfaces.LPC1114.UInt20;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for GPIOIBE_Register use record
    IBE at 0 range 0..11;
    Reserved_12_31 : Interfaces.LPC1114.UInt20;
  end record;


  type GPIOIEV_Register is record
    IEV : GPIO_IEV_Field := 16#00#;
    Reserved_12_31 : Interfaces.LPC1114.UInt20;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for GPIOIEV_Register use record
    IEV at 0 range 0..11;
    Reserved_12_31 : Interfaces.LPC1114.UInt20;
  end record;


  type GPIOIE_Register is record
    MASK : GPIO_MASK_Field := 16#00#;
    Reserved_12_31 : Interfaces.LPC1114.UInt20;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for GPIOIE_Register use record
    MASK at 0 range 0..11;
    Reserved_12_31 : Interfaces.LPC1114.UInt20;
  end record;


  -- READ ONLY --
  type GPIORIS_Register is record
    RAWST : GPIO_RAWST_Field := 16#00#;
    Reserved_12_31 : Interfaces.LPC1114.UInt20;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for GPIORIS_Register use record
    RAWST at 0 range 0..11;
    Reserved_12_31 : Interfaces.LPC1114.UInt20;
  end record;


  -- READ ONLY --
  type GPIOMIS_Register is record
    MASK : GPIO_MASK_Field := 16#00#;
    Reserved_12_31 : Interfaces.LPC1114.UInt20;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for GPIOMIS_Register use record
    MASK at 0 range 0..11;
    Reserved_12_31 : Interfaces.LPC1114.UInt20;
  end record;


  -- WRITE ONLY --
  type GPIOIC_Register is record
    CLR : GPIO_CLR_Field := 16#00#;
    Reserved_12_31 : Interfaces.LPC1114.UInt20;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for GPIOIC_Register use record
    CLR at 0 range 0..11;
    Reserved_12_31 : Interfaces.LPC1114.UInt20;
  end record;


  type GPIO0 is record
    GPIO0DATA : Array 2#100000000000# of GPIODATA;
    Reserved  : Array 4096 of Interfaces.LPC1114.UInt32;
    GPIO0DIR  : aliased GPIODIR_Register;
    GPIO0IS   : aliased GPIOIS_Register;
    GPIO0IBE  : aliased GPIOIBE_Register;
    GPIO0IEV  : aliased GPIOIEV_Register;
    GPIO0IE   : aliased GPIOIE_Register;
    GPIO0RIS  : aliased GPIORIS_Register;
    GPIO0MIS  : aliased GPIOMIS_Register;
    GPIO0IC   : aliased GPIOIC_Register;
  end record
    with Volatile;

  for GPIO0 use record
    GPIO0DATA at 16#0000# range 0..31;
    Reserved  at 16#4000# range 0..31;
    GPIO0DIR  at 16#8000# range 0..31;
    GPIO0IS   at 16#8004# range 0..31;
    GPIO0IBE  at 16#8008# range 0..31;
    GPIO0IEV  at 16#800C# range 0..31;
    GPIO0IE   at 16#8010# range 0..31;
    GPIO0RIS  at 16#8014# range 0..31;
    GPIO0MIS  at 16#8018# range 0..31;
    GPIO0IC   at 16#801C# range 0..31;
  end record;


  type GPIO1 is record
    GPIO1DATA : Array 2#100000000000# of GPIODATA;
    Reserved  : Array 4096 of Interfaces.LPC1114.UInt32;
    GPIO1DIR  : aliased GPIODIR_Register;
    GPIO1IS   : aliased GPIOIS_Register;
    GPIO1IBE  : aliased GPIOIBE_Register;
    GPIO1IEV  : aliased GPIOIEV_Register;
    GPIO1IE   : aliased GPIOIE_Register;
    GPIO1RIS  : aliased GPIORIS_Register;
    GPIO1MIS  : aliased GPIOMIS_Register;
    GPIO1IC   : aliased GPIOIC_Register;
  end record
    with Volatile;

  for GPIO1 use record
    GPIO1DATA at 16#0000# range 0..31;
    Reserved  at 16#4000# range 0..31;
    GPIO1DIR  at 16#8000# range 0..31;
    GPIO1IS   at 16#8004# range 0..31;
    GPIO1IBE  at 16#8008# range 0..31;
    GPIO1IEV  at 16#800C# range 0..31;
    GPIO1IE   at 16#8010# range 0..31;
    GPIO1RIS  at 16#8014# range 0..31;
    GPIO1MIS  at 16#8018# range 0..31;
    GPIO1IC   at 16#801C# range 0..31;
  end record;


  type GPIO2 is record
    GPIO2DATA : Array 2#100000000000# of GPIODATA;
    Reserved  : Array 4096 of Interfaces.LPC1114.UInt32;
    GPIO2DIR  : aliased GPIODIR_Register;
    GPIO2IS   : aliased GPIOIS_Register;
    GPIO2IBE  : aliased GPIOIBE_Register;
    GPIO2IEV  : aliased GPIOIEV_Register;
    GPIO2IE   : aliased GPIOIE_Register;
    GPIO2RIS  : aliased GPIORIS_Register;
    GPIO2MIS  : aliased GPIOMIS_Register;
    GPIO2IC   : aliased GPIOIC_Register;
  end record
    with Volatile;

  for GPIO2 use record
    GPIO2DATA at 16#0000# range 0..31;
    Reserved  at 16#4000# range 0..31;
    GPIO2DIR  at 16#8000# range 0..31;
    GPIO2IS   at 16#8004# range 0..31;
    GPIO2IBE  at 16#8008# range 0..31;
    GPIO2IEV  at 16#800C# range 0..31;
    GPIO2IE   at 16#8010# range 0..31;
    GPIO2RIS  at 16#8014# range 0..31;
    GPIO2MIS  at 16#8018# range 0..31;
    GPIO2IC   at 16#801C# range 0..31;
  end record;


  type GPIO3 is record
    GPIO3DATA : Array 2#100000000000# of GPIODATA;
    Reserved  : Array 4096 of Interfaces.LPC1114.UInt32;
    GPIO3DIR  : aliased GPIODIR_Register;
    GPIO3IS   : aliased GPIOIS_Register;
    GPIO3IBE  : aliased GPIOIBE_Register;
    GPIO3IEV  : aliased GPIOIEV_Register;
    GPIO3IE   : aliased GPIOIE_Register;
    GPIO3RIS  : aliased GPIORIS_Register;
    GPIO3MIS  : aliased GPIOMIS_Register;
    GPIO3IC   : aliased GPIOIC_Register;
  end record
    with Volatile;

  for GPIO3 use record
    GPIO3DATA at 16#0000# range 0..31;
    Reserved  at 16#4000# range 0..31;
    GPIO3DIR  at 16#8000# range 0..31;
    GPIO3IS   at 16#8004# range 0..31;
    GPIO3IBE  at 16#8008# range 0..31;
    GPIO3IEV  at 16#800C# range 0..31;
    GPIO3IE   at 16#8010# range 0..31;
    GPIO3RIS  at 16#8014# range 0..31;
    GPIO3MIS  at 16#8018# range 0..31;
    GPIO3IC   at 16#801C# range 0..31;
  end record;


  GPIO0_Block : aliased GPIO0
    with Import, Address => GPIO0_Base;

  GPIO1_Block : aliased GPIO1
    with Import, Address => GPIO1_Base;

  GPIO2_Block : aliased GPIO2
    with Import, Address => GPIO2_Base;

  GPIO3_Block : aliased GPIO3
    with Import, Address => GPIO3_Base;


end Interfaces.LPC1114.GPIO;
