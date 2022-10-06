pragma Style_Checks (off);

with System;

package Interfaces.LPC1114.SYSCON is
  pragma Preelaborate;
  pragma No_Elaboration_Code_All;

  ---------------
  -- Registers --
  ---------------

  subtype SYSMEMREMAP_MAP_Field is Interfaces.LPC1114.UInt2;
  
  -- System Memory Remap Register
  type SYSMEMREMAP_Register is record
    -- MAP
    MAP : SYSMEMREMAP_MAP_Field := 2#10#;
    Reserved_2_31 : Interface.LPC1114.UInt30 := 2#0#;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for SYSMEMREMAP_Register use record
    MAP at 0 range 0..1;
    Reservce_2_31 at 0 range 2..31;
  end record;


  subtype PRESETCTRL_RST_N_Field is Interfaces.LPC1114.Bit;

  -- Peripheral Reset Control Register
  type PRESETCTRL_Register is record
    SSP0_RST_N : PRESETCTRL_RST_N_Field := 0;
    I2C_RST_N : PRESETCTRL_RST_N_Field := 0;
    SSP1_RST_N : PRESETCTRL_RST_N_Field := 0;
    CAN_RST_N : PRESETCTRL_RST_N_Field := 0;
    Reserved_4_31 : Interface.LPC1114.UInt28 := 16#00#;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for PRESETCTRL_Register use record
    SSP0_RST_N at 0 range 0..0;
    I2C_RST_N at 0 range 1..1;
    SSP1_RST_N at 0 range 2..2;
    CAN_RST_N at 0 range 3..3;
    Reserved_4_31 at 0 range 4..31;
  end record;


  subtype SYSPLLCTRL_MSEL_Field is Interfaces.LPC1114.UInt5;
  subtype SYSPLLCTRL_PSEL_Field is Interfaces.LPC1114.UInt2;

  -- System PLL Control Register
  type SYSPLLCTRL_Register is record
    MSEL : SYSPLLCTRL_MSEL_Field := 16#000#;
    PSEL : SYSPLLCTRL_PSEL_Field := 16#00#;
    Reserved_7_31 : Interface.LPC1114.UInt25 := 16#0#;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for SYSPLLCTRL_Register use record
    MSEL at 0 range 0..4;
    PSEL at 0 range 5..6;
    Reserved_7_31 at 0 range 7..31;
  end record;


  subtype SYSPLLSTAT_LOCK_Field is Interfaces.LPC1114.Bit;

  -- System PLL Status Register
  type SYSPLLSTAT_Register is record
    -- READ-ONLY
    LOCK : SYSPLLSTAT_LOCK_Field := 16#0#;
    Reserved_1_31 : Interface.LPC1114.UInt31 := 16#00#;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for SYSPLLSTAT_Register use record
    LOCK at 0 range 0..0;
    Reserved_1_31 at 0 range 1..31;
  end record;


  subtype SYSOSCCTRL_BYPASS_Field is Interfaces.LPC1114.Bit;
  subtype SYSOSCCTRL_FREQRANGE_Field is Interfaces.LPC1114.Bit;

  -- System Oscillator Control Register
  type SYSOSCCTRL_Register is record
    BYPASS : SYSOSCCTRL_BYPASS_Field : 16#0#;
    FREQRANGE : SYSOSCCTRL_FREQRANGE_Field : 16#0#;
    Reserved_2_31 : Interface.LPC1114.UInt30 := 16#00#;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for SYSOSCCTRL_Register use record
    BYPASS at 0 range 0..0;
    FREQRANGE at 0 range 1..1;
    Reserved_2_31 at 0 range 2..31;
  end record;

  subtype WDTOSCCTRL_DIVSEL_Field is Interfaces.LPC1114.UInt5;
  subtype WDTOSSCTRL_FREQSEL_Field is Interfaces.LPC1114.UInt4;

  -- Watchdog Oscillator Control Register
  type SYSOSCCTRL_Register is record
    DIVSEL : WDTOSCCTRL_DIVSEL_Field : 2#0#;
    FREQSEL : WDTOSSCTRL_FREQSEL_Field : 16#00#;
    Reserved_9_31 : Interface.LPC1114.UInt23 := 16#00#;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for SYSOSCCTRL_Register use record
    DIVSEL at 0 range 0..4;
    FREQSEL at 0 range 5..8;
    Reserved_9_31 at 0 range 9..31;
  end record;


  subtype IRCCTRL_TRIM_Field is Interfaces.LPC1114.Byte;

  -- Internal Resonant Crystal Control Register
  type IRCCTRL_Register is record
    TRIM : IRCCTRL_TRIM_Field := 16#10000000#;
    Reserved_8_31 : Interfaces.LPC1114.UInt24 := 16#00#;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for IRCCTRL_Register use record
    TRIM at 0 range 0..7;
    Reserved_8_31 at 0 range 8..31;
  end record;


  subtype SYSRSTSTAT_RST_Field is Interfaces.LPC1114.Bit;

  -- System Reset Status Register
  type SYSRSTSTAT_Register is record
    -- POR Reset Status
    POR : SYSRSTSTAT_RST_Field := 16#0#;
    -- External RESET Pin Status
    EXTRST : SYSRSTSTAT_RST_Field := 16#0#;
    -- Watchdog Reset Status
    WDT : SYSRSTSTAT_RST_Field := 16#0#;
    -- Brown-out Detect Reset Status
    BOD : SYSRSTSTAT_RST_Field := 16#0#;
    -- Software System Reset Status
    SYSRST : SYSRSTSTAT_RST_Field := 16#0#;
    Reserved_5_31 : Interfaces.LPC1114.UInt27 := 16#0#;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for SYSRSTSTAT_Register use record
    POR at 0 range 0..0;
    EXTRST at 0 range 1..1;
    WDT at 0 range 2..2;
    BOD at 0 range 3..3;
    SYSRST at 0 range 4..4;
    Reserved_5_31 at 0 range 5..31;
  end record;


  subtype SYS_CLKSEL_SEL_Field is Interfaces.LPC1114.UInt2;

  -- Generic System Clock Select Register
  type SYS_CLKSEL is record
    SEL : SYS_CLKSEL_SEL_Field := 16#0#;
    Reserved_2_31 : Interfaces.LPC1114.UInt30 := 16#0#;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for SYS_CLKSEL_Register use record
    SEL at 0 range 0..1;
    Reserved_2_31 at 0 range 2..31;
  end record;
  

  -- System PLL Clock Source Select Register
  type SYSPLLCLKSEL_Register is SYS_CLKSEL;


  subtype SYS_ENA_Field is Interfaces.LPC1114.Bit;

  -- Generice Enable Register
  type SYS_CLKUEN is record
    ENA : SYS_ENA_Field := 16#0#;
    Reserved_1_31 : Interfaces.LPC1114.UInt31 := 16#00#;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for SYS_CLKUEN_Register use record
    ENA at 0 range 0..1;
    Reserved_1_31 at 0 range 1..31;
  end record;

  -- System PLL Clock Source Update Enable Register
  type SYSPLLCLKUEN_Register is SYS_CLKUEN;


  -- Main Clock Source Select Register
  type MAINCLKSEL_Register is SYS_CLKSEL;


  -- Main Clock Source Update Enable Register
  type MAINCLKUEN_Register is SYS_CLKUEN;


  subtype SYS_DIV_Field is Interfaces.LPC1114.Byte;

  -- Generic System Clock Divider
  type SYS_CLKDIV is record
    -- SPI0_PCLK clock Divider
    DIV : SYS_DIV_Field := 16#00#;
    Reserved_8_31 : Interfaces.LPC1114.UInt24 := 16#00#;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for SSP0CLKDIV_Register use record
    DIV at 0 range 0..7;
    Reserved_8_31 at 0 range 8..31;
  end record;


  -- System ABH Clock Divider Register
  type SYSAHBCLKDIV_Register is record
    DIV : SYS_DIV_Field := 16#01#;
    Reserved_8_31 : Interfaces.LPC1114.UInt24 := 16#00#;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for SYSAHBCLKDIV_Register use record
    DIV at 0 range 0..7;
    Reserved_8_31 at 0 range 8..31;
  end record;


  -- System ABH Clock Control Register
  type SYSAHBCLKCTRL_Register is record
    -- READ-ONLY -- Enables AHB to multiple components
    SYS : SYS_ENA_Field := 2#1#;
    -- Enable Clock for ROM
    ROM : SYS_ENA_Field := 2#1#;
    -- Enable Clock for RAM
    RAM : SYS_ENA_Field := 2#1#;
    -- Enable clock for Flash Register Interface
    FLASHREG : SYS_ENA_Field := 2#1#;
    -- Enable clock for Flash Array Access
    FLASHARRAY : SYS_ENA_Field := 2#1#;
    -- Enable clock for I2C
    I2C : SYS_ENA_Field := 2#0#;
    -- Enable clock for GPIO
    GPIO : SYS_ENA_Field := 2#1#;
    -- Enable clock for CT16B0
    CT16B0 : SYS_ENA_Field := 2#0#;
    -- Enable clock for CT1b1
    CT16B1 : SYS_ENA_Field := 2#0#;
    -- Enable clock for CT32B0
    CT32B0 : SYS_ENA_Field := 2#0#;
    -- Enable clock for CT32B1
    CT32B1 : SYS_ENA_Field := 2#0#;
    -- Enable clock for SPI0
    SSP0 : SYS_ENA_Field := 2#1#;
    -- Enable clock for UART
    UART : SYS_ENA_Field := 2#0#;
    -- Enable clock for ADC
    ADC : SYS_ENA_Field := 2#0#;
    Reserved_14_14 : Interfaces.LPC1114.Bit := 2#0#;
    -- Enable clock for WDT
    WDT : SYS_ENA_Field := 2#0#;
    -- Enable clock for IOCON
    ICOCON : SYS_ENA_Field := 2#0#;
    -- Enable clock for CAN
    CAN : SYS_ENA_Field := 2#0#;
    -- Enable clocck for SPI1
    SSP1 : SYS_ENA_Field := 2#0#;
    Reserved_19_31 : Interfaces.LPC1114.UInt13 := 16#00#;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for SYSAHBCLKCTRL_Register use record
    SYS at 0 range 0..0;
    ROM at 0 range 1..1;
    RAM at 0 range 2..2;
    FLASHREG at 0 range 3..3;
    FLASHARRAY at 0 range 4..4;
    I2C at 0 range 5..5;
    GPIO at 0 range 6..6;
    CT16B0 at 0 range 7..7;
    CT16B1 at 0 range 8..8;
    CT32B0 at 0 range 9..9;
    CT32B1 at 0 range 10..10;
    SSP0 at 0 range 11..11;
    UART at 0 range 12..12;
    ADC at 0 range 13..13;
    Reserved_14_14 at 0 range 14..14;
    WDT at 0 range 15..15;
    IOCON at 0 range 16..16;
    CAN at 0 range 17..17;
    SSP1 at 0 range 18..18;
    Reserved_19_31 at 0 range 19..31;
  end record;


  -- SPI0 Clock Divide Register
  type SSP0CLKDIV_Register is SYS_CLKDIV;
  
  
  -- UART Clock Divide Register
  type UARTCLKDIV_Register is SYS_CLKDIV;


  -- SPI1 Clock Divide Register
  type SSP1CLKDIV_Register is SYS_CLKDIV;


  -- WDT Clock Source Select Register
  type WDTCLKSEL_Register is SYS_CLKSEL;

  -- WDT Clock Source Update Enable Register
  type WDTCLKUEN_Register is SYS_CLKUEN;

  -- WDT Clock Divide Register
  type WDTCLKDIV_Register is SYS_CLKDIV;


  -- CLKOUT Clock Source Select Register
  type CLKOUTCLKSEL_Register is SYS_CLKSEL

  -- CLKOUT Clock Source Update Enable Register
  type CLKOUTCLKUEN_Register is SYS_CLKUEN;

  -- CLKOUT Clock Source Divider Register
  type CLKOUTCLKDIV_Register is SYS_CLKDIV;


  subtype PIOPORCAP0_CAPPIO0_Field is Interfaces.LPC1114.UInt12; 
  subtype PIOPORCAP0_CAPPIO1_Field is Interfaces.LPC1114.UInt12;
  subtype PIOPORCAP0_CAPPIO2_Field is Interfaces.LPC1114.Byte;

  -- POR Captured PIO Status Register 0  
  -- READ-ONLY
  type PIOPORCAP0_Register is record
    CAPPIO0_n : PIOPORCAP0_CAPPIO0_Field;
    CAPPIO1_n : PIOPORCAP1_CAPPIO1_Field;
    CAPPIO2_n : PIOPORCAP2_CAPPIO1_Field;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for PIOPORCAP0_Register use record
    CAPPIO0_n at 0 range 0..11;
    CAPPIO1_n at 0 range 12..23;
    CAPPIO2_n at 0 range 24..31;
  end record;


  subtype PIOPORCAP1_CAPPIO_Field is Interfaces.LPC1114.Bit;

  -- POR Captured PIO Status Regsiter 1
  -- READ-ONLY
  type PIOPORCAP1_Register is record
    CAPPIO2_8 : PIOPORCAP1_CAPPIO_Field;
    CAPPIO2_9 : PIOPORCAP1_CAPPIO_Field;
    CAPPIO2_10 : PIOPORCAP1_CAPPIO_Field;
    CAPPIO2_11 : PIOPORCAP1_CAPPIO_Field;
    CAPPIO3_0 : PIOPORCAP1_CAPPIO_Field;
    CAPPIO3_1 : PIOPORCAP1_CAPPIO_Field;
    CAPPIO3_2 : PIOPORCAP1_CAPPIO_Field;
    CAPPIO3_3 : PIOPORCAP1_CAPPIO_Field;
    CAPPIO3_4 : PIOPORCAP1_CAPPIO_Field;
    CAPPIO3_5 : PIOPORCAP1_CAPPIO_Field;
    Reserved_10_31 : Interfaces.LPC1114.UInt22;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for PIOPPORCAP1_Register use record
    CAPPIO2_8 at 0 range 0..0;
    CAPPIO2_9 at 0 range 1..1;
    CAPPIO2_10 at 0 range 2..2;
    CAPPIO2_11 at 0 range 3..3;
    CAPPIO3_0 at 0 range 4..4;
    CAPPIO3_1 at 0 range 5..5;
    CAPPIO3_2 at 0 range 6..6;
    CAPPIO3_3 at 0 range 7..7;
    CAPPIO3_4 at 0 range 8..8;
    CAPPIO3_5 at 0 range 9..9;
    Reserved_10_31 at 0 range 10..31;
  end record;


  subtype BODCTRL_BODRSTLEV_Field is Interfaces.LPC1114.UInt2;
  subtype BODCTRL_BODINTVAL_Field is Interfaces.LPC1114.UInt2;
  subtype BODCTRL_BODRSTENA_Field is Interfaces.LPC1114.Bit;

  -- BOD Control Register
  type BODCTRL_Register is record
    BODRSTLEV : BODCTRL_BODRSTLEV_Field := 2#00#;
    BODINTVAL : BODCTRL_BODINTVAL_Field := 2#00#;
    BODRSTENA : BODCTRL_BODRSTENA_Field := 2#0#;
    Reserved_5_31 : Interfaces.LPC1114.UInt27 := 16#00#;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for BODCTRL_Register use record
    BODRSTLEV at 0 range 0..1;
    BODINTVAL at 0 range 2..3;
    BODRSTENA at 0 range 4..4;
    Reserved_5_31 at 0 range 5..31;
  end record;


  subtype SYSTCKCAL_CAL_Field is Interfaces.LPC1114.UInt26;

  -- System Tick Counter Calibration Register
  type SYSTCKCAL_Register is record
    CAL : SYSTCKCAL_CAL_Field := 16#04#;
    Reserved_26_31 : Interfaces.LPC1114.UInt6 := 16#00#;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for SYSTCKCAL_Register use record
    CAL at 0 range 0..25;
    Reserved_26_31 at 0 range 26..31;
  end record;


  subtype NMISRC_IRQNO_Field is Interfaces.LPC1114.UInt5;
  subtype NMISRC_NMIEN_Field is Interfaces.LPC1114.Bit;

  -- NMI Source Selection Register
  type NMISRC_Register is record
    IRQNO : NMISRC_IRQNO_Field := 2#0#;
    Reserved_5_30 : Interfaces.LPC1114.UInt26;
    NMIEN : NMISRC_NMIEN_Field := 2#0#;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for NMISRC_Register use record
    IRQNO at 0 range 0..4;
    Reserved_5_31 at 0 range 5..30;
    NMIEN at 0 range 31..31;
  end record;


  subtype STARTAPRP_APRPIO0_Field is Interfaces.LPC1114.UInt12;
  subtype STARTAPRP_APRPIO1_0_Field is Interfaces.LPC1114.Bit;

  -- Start Logic Edge Control Register 0
  type STARTAPRP0_Register is record
    APRPIO0_n : STARTAPRP_APRPIO0 := 16#0#;
    APRPIO1_0 : STARTAPRP_APRPIO1_0 := 16#0#;
    Reserved_13_31 : Interfaces.LPC1114.UInt19 := 16#0#;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for STARTAPRP0_Register use record
    APRPIO0_n at 0 range 0..11;
    APRPIO1_0 at 0 range 12..12;
    Reserved_13_31 at 0 range 13..31;
  end record;

  
  subtype STARTERP_ERPIO0_Field is Interfaces.LPC1114.UInt12;
  subtype STARTERP_ERPIO1_Field is Interfaces.LPC1114.Bit;

  -- Start Logic Signal Enable Register 0
  type STARTERP0_Register is record
    ERPIO0_n : STARTERP_ERPIO0_Field := 16#0#;
    ERPIO1_0 : STARTERP_ERPIO1_Field := 16#0#;
    -- DO NOT WRITE A 1 TO RESERVED BITS IN THIS REGISTER
    Reserved_13_31 : Interfaces.LPC1114.UInt19 := 16#0#;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for STARTERP0_Register use record
    ERPIO0_n at 0 range 0..11;
    ERPIO1_0 at 0 range 12..12;
    Reserved_13_31 at 0 range 13..31;
  end record;


  subtype STARTRSR_RSRPIO0_Field is Interfaces.LPC1114.UInt12;
  subtype STARTRSR_RSRPIO1_Field is Interfaces.LPC1114.Bit;

  -- Start Logic Reset Register 0
  type STARTRSRP0CLR_Register is record
    RSRPIO0_n : STARTRSR_RSRPIO0_Field;
    RSRPIO1_0 : STARTRSR_RSRPIO1_Field;
    -- DO NOT WRITE A 1 TO RESERVED BITS IN THIS REGISTER
    Reserved_13_31 : Interfaces.LPC1114.UInt19;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for STARTRSRP0CLR_Register use record
    RSRPIO0_n at 0 range 0..11;
    RSRPIO1_0 at 0 range 12..12;
    Reserved_13_31 at 0 range 13..31;
  end record;
  

  subtype STARTSRP_SRPIO0_Field is Interfaces.LPC1114.UInt12;
  subtype STARTSRP_SRPIO1_Field is Interfaces.LPC1114.Bit;

  -- Start Logic Status Register
  -- READ-ONLY
  type STARTSRP0_Register is record
    SRPIO0_n : STARTSRP_SRPIO0_Field;
    SRPIO1_0 : STARTSRP_SRPIO1_Field;
    -- DO NOT WRITE A 1 TO RESERVED BITS IN THIS REGISTER
    Reserved_13_31 : Interfaces.LPC1114.UInt19;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for STARTSRP0_Register use record
    SRPIO0_n at 0 range 0..11;
    SRPIO1_0 at 0 range 12..12;
    Reserved_13_31 at 0 range 13..31;
  end record;


  subtype SYS_PD_Field is Interfaces.LPC1114.Bit;

  type PDSLEEPCFG_Register is record
    -- Always write these bits as 111
    NOTUSED0 : Interfaces.LPC1114.UInt3 := 2#0#;
    BOD_PD : SYS_PD_Field := 2#0#;
    -- Always write these bits as 11
    NOTUSED1 : Interfaces.LPC1114.UInt2 := 2#0#;
    WDTOSC_PD : SYS_PD_Field := 2#0#;
    -- Always write this bit as 1
    NOTUSED2 : Interfaces.LPC1114.Bit := 2#0#;
    -- Always write these bits as 000
    NOTUSED3 : Interfaces.LPC1114.UInt3 := 2#0#;
    -- Always write these bits as 11
    NOTUSED4 : Interfaces.LPC1114.UInt2 := 2#0#;
    Reserved_13_31 : Interfaces.LPC1114.UInt19 := 2#0#;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for PDSLEEPCFG_Register use record
    NOTUSED0 at 0 range 0..2;
    BOD_PD at 0 range 3..3;
    NOTUSED1 at 0 range 4..5;
    WDTOSC_PD at 0 range 6..6;
    NOTUSED2 at 0 range 7..7;
    NOTUSED3 at 0 range 8..10;
    NOTUSED4 at 0 range 11..12;
    Reserved_13_31 at 0 range 13..31;
  end record;

  
  -- Wake-up Configuration Register
  type PDAWAKECFG_Register is record
    IRCOUT_PD : SYS_PD_Field := 2#0#;
    IRC_PD : SYS_PD_Field := 2#0#;
    FLASH_PD : SYS_PD_Field := 2#0#:
    BOD_PD : SYS_PD_Field := 2#0#;
    ADC_PD : SYS_PD_Field := 2#1#;
    SYSOSC_PD : SYS_PD_Field := 2#1#;
    WDTOSC_PD : SYS_PD_Field := 2#1#;
    SYSPLL_PD : SYS_PD_Field := 2#1#;
    -- Always write this bit as 1
    Reserved_8 : Interfaces.LPC1114.Bit := 2#1#;
    -- Always write this bit as 0
    Reserved_9 : Interfaces.LPC1114.Bit := 2#0#;
    -- Always write this bit as 1
    Reserved_10 : Interfaces.LPC1114.Bit := 2#1#;
    -- Always write this bit as 1
    Reserved_11 : Interfaces.LPC1114.Bit := 2#1#;
    -- Always write this bit as 0
    Reserved_12 : Interfaces.LPC1114.Bit := 2#0#;
    -- Always write these bits as 111
    Reserved_13_15 : Interfaces.LPC1114.UInt3 := 2#111#;
    Reserved_16_31 : Interfaces.LPC1114.UInt16;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for PDAWAKECFG_Register use record
    IRCOUT_PD at 0 range 0..0;
    IRC_PD at 0 range 1..1;
    FLASH_PD at 0 range 2..2;
    BOD_PD at 0 range 3..3;
    ADC_PD at 0 range 4..4;
    SYSOSC_PD at 0 range 5..5;
    WDTOSC_PD at 0 range 6..6;
    SYSPLL_PD at 0 range 7..7;
    Reserved_8 at 0 range 8..8;
    Reserved_9 at 0 range 9..9;
    Reserved_10 at 0 range 10..10;
    Reserved_11 at 0 range 11..11;
    Reserved_12 at 0 range 12..12;
    Reserved_13_15 at 0 range 13..15
    Reserved_16_31 at 0 range 16..31;
  end record;


  -- Power-down Configuration Register
  type PDRUNCFG_Register is record
    IRCOUT_PD : SYS_PD_Field := 2#0#;
    IRC_PD : SYS_PD_Field := 2#0#;
    FLASH_PD : SYS_PD_Field := 2#0#:
    BOD_PD : SYS_PD_Field := 2#0#;
    ADC_PD : SYS_PD_Field := 2#1#;
    SYSOSC_PD : SYS_PD_Field := 2#1#;
    WDTOSC_PD : SYS_PD_Field := 2#1#;
    SYSPLL_PD : SYS_PD_Field := 2#1#;
    -- Always write this bit as 1
    Reserved_8 : Interfaces.LPC1114.Bit := 2#1#;
    -- Always write this bit as 0
    Reserved_9 : Interfaces.LPC1114.Bit := 2#0#;
    -- Always write this bit as 1
    Reserved_10 : Interfaces.LPC1114.Bit := 2#1#;
    -- Always write this bit as 1
    Reserved_11 : Interfaces.LPC1114.Bit := 2#1#;
    -- Always write this bit as 0
    Reserved_12 : Interfaces.LPC1114.Bit := 2#0#;
    -- Always write these bits as 111
    Reserved_13_15 : Interfaces.LPC1114.UInt3 := 2#111#;
    Reserved_16_31 : Interfaces.LPC1114.UInt16;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for PDRUNCFG_Register use record
    IRCOUT_PD at 0 range 0..0;
    IRC_PD at 0 range 1..1;
    FLASH_PD at 0 range 2..2;
    BOD_PD at 0 range 3..3;
    ADC_PD at 0 range 4..4;
    SYSOSC_PD at 0 range 5..5;
    WDTOSC_PD at 0 range 6..6;
    SYSPLL_PD at 0 range 7..7;
    Reserved_8 at 0 range 8..8;
    Reserved_9 at 0 range 9..9;
    Reserved_10 at 0 range 10..10;
    Reserved_11 at 0 range 11..11;
    Reserved_12 at 0 range 12..12;
    Reserved_13_15 at 0 range 13..15
    Reserved_16_31 at 0 range 16..31;
  end record;

  
  -- Device ID Register
  -- READ-ONLY
  type DEVICE_ID_Register is record
    DEVICEID : Interfaces.LPC1114.UInt32 := 16#0A40902B#;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;


  -- System Control Block
  type SYSCON is record
    SYSMEMREMAP   : aliased SYSMEMREMAP_Register;
    PRESETCTRL    : aliased PRESETCTRL_Register;
    SYSPLLCTRL    : aliased SYSPLLCTRL_Register;
    SYSPLLSTAT    : aliased SYSPLLSTAT_Register;
    Reserved0     : array (4) of Interfaces.LPC1114.UInt32;
    SYSOSCCTRL    : aliased SYSOSCCTRL_Register;
    WDTOSCCTRL    : aliased WDTOSCCTRL_Register;
    IRCCTRL       : aliased IRCCTRL_Register;
    Reserved1     : Interfaces.LPC1114.UInt32;
    SYSRSTSTAT    : aliased SYSRSTSTAT_Register;
    Reserved2     : array (3) of Interfaces.LPC1114.UInt32;
    SYSPLLCLKSEL  : aliased SYSPLLCLKSEL_Register;
    SYSPLLCLKUEN  : aliased SYSPLLCLKUEN_Register;
    Reserved3     : array (10) of Interfaces.LPC1114.UInt32;
    MAINCLKSEL    : aliased MAINCLKSEL_Register;
    MAINCLKUEN    : aliased MAINCLKUEN_Register;
    SYSAHBCLKDIV  : aliased SYSAHBCLKDIV_Register;
    Reserved4     : Interfaces.LPC1114.UInt32;
    SYSAHBCLKCTRL : aliased SYSAHBCLKCTRL_Register;
    Reserved5     : array (4) of Interfaces.LPC1114.UInt32;
    SSP0CLKDIV    : aliased SSP0CLKDIV_Register;
    UARTCLKDIV    : aliased UARTCLKDIV_Register;
    SSP1CLKDIV    : aliased SSP1CLKDIV_Register;
    Reserved6     : array (12) of Interfaces.LPC1114.UInt32;
    WDTCLKSEL     : aliased WDTCLKSEL_Register;
    WDTCLKUEN     : aliased WDTCLKUEN_Register;
    WDTCLKDIV     : aliased WDTCLKDIV_Register;
    Reserved7     : Interfaces.LPC1114.UInt32;
    CLKOUTCLKSEL  : aliased CLKOUTCLKSEL_Register;
    CLKOUTUEN     : aliased CLKOUTUEN_Register;
    CLKOUTCLKDIV  : aliased CLKOUTCLKDIV_Register;
    Reserved8     : array (5) of Interfaces.LPC1114.UInt32;
    PIOPORCAP0    : aliased PIOPORCAP0_Register;
    PIOPORCAP1    : aliased PIOPORCAP1_Register;
    Reserved9     : array (18) of Interfaces.LPC1114.UInt32;
    BODCTRL       : aliased BODCTRL_Register;
    SYSTCKCAL     : aliased SYSTCKCLA_Register;
    Reserved10    : array (6) of Interfaces.LPC1114.UInt32;
    NMISRC        : aliased NMISRC_Register;
    Reserved11    : array (34) of Interfaces.LPC1114.UInt32;
    STARTAPRP0    : aliased STARTAPRP0_Register;
    STARTERP0     : aliased STARTERP0_Register;
    STARTRSRP0CLR : aliased STARTRSRP0CLR_Register;
    STARTSRP0     : aliased STARTSRP0_Register;
    Reserved12    : array (8) of Interfaces.LPC1114.UInt32;
    PDSLEEPCFG    : aliased PDSLEEPCFG_Register;
    PDAWAKECFG    : aliased PDAWAKECFG_Register;
    PDRUNCFG      : aliased PDRUNCFG_Register;
    Reserved13    : array (111) of Interfaces.LPC1114.UInt32;
    DEVICE_ID     : aliased DEVICE_ID_Register;
  end record
    with Volatile;

  for SYSCON use record
    SYSMEMREMAP   at 16#0# range 0..31;
    PRESETCTRL    at 16#4# range 0..31;
    SYSPLLCTRL    at 16#8# range 0..31;
    SYSPLLSTAT    at 16#C# range 0..31;
    Reserved0     at 16#10# range 0..31;
    SYSOSCCTRL    at 16#20# range 0..31;
    WDTOSCCTRL    at 16#24# range 0..31;
    IRCCTRL       at 16#28# range 0..31;
    Reserved1     at 16#2C# range 0..31;
    SYSRSTSTAT    at 16#30# range 0..31;
    Reserved2     at 16#34# range 0..31;
    SYSPLLCLKSEL  at 16#40# range 0..31;
    SYSPLLCLKUEN  at 16#44# range 0..31;
    Reserved3     at 16#48# range 0..31;
    MAINCLKSEL    at 16#70# range 0..31;
    MAINCLKUEN    at 16#74# range 0..31;
    SYSAHBCLKDIV  at 16#78# range 0..31;
    Reserved4     at 16#7C# range 0..31;
    SYSAHBCLKCTRL at 16#80# range 0..31;
    Reserved5     at 16#84# range 0..31;
    SSP0CLKDIV    at 16#94# range 0..31;
    UARTCLKDIV    at 16#98# range 0..31;
    SSP1CLKDIV    at 16#9C# range 0..31;
    Reserved6     at 16#A0# range 0..31;
    WDTCLKSEL     at 16#D0# range 0..31;
    WDTCLKUEN     at 16#D4# range 0..31;
    WDTCLKDIV     at 16#D8# range 0..31;
    Reserved7     at 16#DC# range 0..31;
    CLKOUTCLKSEL  at 16#E0# range 0..31;
    CLKOUTUEN     at 16#E4# range 0..31;
    CLKOUTCLKDIV  at 16#E8# range 0..31;
    Reserved8     at 16#EC# range 0..31;
    PIOPORCAP0    at 16#100# range 0..31;
    PIOPORCAP1    at 16#104# range 0..31;
    Reserved9     at 16#108# range 0..31;
    BODCTRL       at 16#150# range 0..31;
    SYSTCKCAL     at 16#154# range 0..31;
    Reserved10    at 16#158# range 0..31;
    NMISRC        at 16#174# range 0..31;
    Reserved11    at 16#178# range 0..31;
    STARTAPRP0    at 16#200# range 0..31;
    STARTERP0     at 16#204# range 0..31;
    STARTRSRP0CLR at 16#208# range 0..31;
    STARTSRP0     at 16#20C# range 0..31;
    Reserved12    at 16#210# range 0..31;
    PDSLEEPCFG    at 16#230# range 0..31;
    PDAWAKECFG    at 16#234# range 0..31;
    PDRUNCFG      at 16#238# range 0..31;
    Reserved13    at 16#23C# range 0..31;
    DEVICE_ID     at 16#3F4# range 0..31;
  end record;

  SYSCON_Block : aliased SYSCON
    with Import, Address => SYSCON_Base;

end Interfaces.LPC1114.SYSCON;
