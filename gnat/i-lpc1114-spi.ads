pragma Style_Checks (off);

with System;

package Interfaces.LPC1114.SPI is
  pragma Preelaborate;
  pragma No_Elaboration_Code_All;

  ---------------
  -- Registers --
  ---------------

  subtype SSPCR0_DSS_Field is Interfaces.LPC1114.UInt4;
  subtype SSPCR0_FRF_Field is Interfaces.LPC1114.UInt2;
  subtype SSPCR0_CPOL_Field is Interfaces.LPC1114.Bit;
  subtype SSPCR0_CPHA_Field is Interfaces.LPC1114.Bit;
  subtype SSPCR0_SCR_Field is Interfaces.LPC1114.Byte;

  -- SPI/SSP Control Register 0
  type SSPCR0_Register is record
    DSS : SSPCR0_DSS_Field := 2#0000#;
    FRF : SSPCR0_FRF_Field := 2#00#;
    CPOL : SSPCR0_CPOL_Field := 2#0#;
    CPHA : SSPCR0_CPHA_Field := 2#0#;
    SCR : SSPCR0_SCR_Field := 16#00#;
    Reserved_16_31 : Interfaces.LPC1114.UInt16;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for SSPCRO_Register use record
    DSS at 0 range 0..3;
    FRF at 0 range 4..5;
    CPOL at 0 range 6..6;
    CPHA at 0 range 7..7;
    SCR at 0 range 8..15;
    Reserved_16_31 at 0 range 16..31;
  end record;


  subtype SSPCR1_LBM_Field is Interfaces.LPC1114.Bit;
  subtype SSPCR1_SSE_Field is Interfaces.LPC1114.Bit;
  subtype SSPCR1_MS_Field is Interfaces.LPC1114.Bit;
  subtype SSPCR1_SOD_Field is Interfaces.LPC1114.Bit;

  -- SPI/SSP Control Register 1
  type SSPCR1_Register is record
    LBM : SSPCR1_LBM_Field := 0;
    SSE : SSPCR1_SSE_Field := 0;
    MS : SSPCR1_MS_Field := 0;
    SOD : SSPCR1_SOD_Field := 0;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_4_31 : Interfaces.LPC1114.UInt28;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for SSPCR1_Register use record
    LBM at 0 range 0..0;
    SSE at 0 range 1..1;
    MS at 0 range 2..2;
    SOD at 0 range 3..3;
    Reserved_4_31 at 0 range 4..31;
  end record;


  subtype SSPDR_DATA_Field is Interfaces.LPC1114.UInt16;

  -- SPI/SSP Data Register
  type SSPDR_Register is record
    DATA : SSPDR_DATA_Field := 16#0000#;
    Reserved_16_31 : Interfaces.LPC1114.UInt16;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for SSPDR_Register use record
    DATA at 0 range 0..15;
    Reserved_16_31 at 0 range 16..31;
  end record;


  subtype SSPSR_TFE_Field is Interfaces.LPC1114.Bit;
  subtype SSPSR_TNF_Field is Interfaces.LPC1114.Bit;
  subtype SSPSR_RNE_Field is Interfaces.LPC1114.Bit;
  subtype SSPSR_RFF_Field is Interfaces.LPC1114.Bit;
  subtype SSPSR_BSY_Field is Interfaces.LPC1114.Bit;

  -- SPI/SSP Status Register
  type SSPSR_Register is record
    TFE : SSPSR_TFE_Field := 1;
    TNF : SSPSR_TNF_Field := 1;
    RNE : SSPSR_RNE_Field := 0;
    RFF : SSPSR_RFF_Field := 0;
    BSY : SSPSR_BSY_Field := 0;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_5_31 : Interfaces.LPC1114.UInt27;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for SSPSR_Register use record
    TFE at 0 range 0..0;
    TNF at 0 range 1..1;
    RNE at 0 range 2..2;
    RFF at 0 range 3..3;
    BSY at 0 range 4..4;
    Reserved_5_31 at 0 range 5..31;
  end record;


  subtype SSPCPSR_CPSDVSR_Field is Interfaces.LPC1114.Byte;

  -- SPI/SSP Clock Prescale Register
  type SSPCPSR_Register is record
    CPSDVSR : SSPCPSR_SSPCPSDVSR_Field := 0;
    Reserved_8_31 : Interfaces.LPC1114.UInt24;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for SSPCPSP_Register use record
    CPSDVSR at 0 range 0..7;
    Reserved_8_31 at 0 range 8..31;
  end record;


  subtype SSPIMSC_RORIM_Field is Interfaces.LPC1114.Bit;
  subtype SSPIMSC_RTIM_Field is Interfaces.LPC1114.Bit;
  subtype SSPIMSC_RXIM_Field is Interfaces.LPC1114.Bit;
  subtype SSPIMSC_TXIM_Field is Interfaces.LPC1114.Bit;

  -- SPI/SSP Interrupt Mask Set/Clear Register
  type SSPIMSC_Register is record
    RORIM : SSPIMSC_RORIM_Field := 0;
    RTIM : SSPIMSC_RTIM_Field := 0;
    RXIM : SSPIMSC_RXIM_Field := 0;
    TXIM : SSPIMSC_TXIM_Field := 0;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_4_31 : Interfaces.LPC1114.UInt28;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for SSPLIMSC_Register use record
    RORIM at 0 range 0..0;
    RTIM at 0 range 1..1;
    RXIM at 0 range 2..2;
    TXIM at 0 range 3..3;
    Reserved_4_31 at 0 range 4..31;
  end record;


  subtype SSPRIS_RORRIS_Field is Interfaces.LPC1114.Bit;
  subtype SSPRIS_RTRIS_Field is Interfaces.LPC1114.Bit;
  subtype SSPRIS_RXRIS_Field is Interfaces.LPC1114.Bit;
  subtype SSPRIS_TXRIS_Field is Interfaces.LPC1114.Bit;

  -- SPI/SSP Raw Interrupt Status Regsiter
  type SSPRIS_Register is record
    RORRIS : SSPRIS_RORRIS_Field := 0;
    RTRIS : SSPRIS_RTRIS_Field := 0;
    RXRIS : SSPRIS_RXRIS_Field := 0;
    TXRIS : SSPRIS_TXRIS_Field := 0;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_4_31 : Interfaces.LPC1114.UInt28;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for SSPRIS_Register use record
    RORRIS at 0 range 0..0;
    RTRIS at 0 range 1..1;
    RXRIS at 0 range 2..2;
    TXRIS at 0 range 3..3;
    Reserved_4_31 at 0 range 4..31;
  end record;


  subtype SSPMIS_RORMIS_Field is Interfaces.LPC1114.Bit;
  subtype SSPMIS_RTMIS_Field is Interfaces.LPC1114.Bit;
  subtype SSPMIS_RXMIS_Field is Interfaces.LPC1114.Bit;
  subtype SSPMIS_TXMIS_Field is Interfaces.LPC1114.Bit;

  -- SPI/SSP Maksed Interrupt Status Register
  type SSPMIS_Register is record
    RORMIS : SSPMIS_RORMIS_Field := 0;
    RTMIS : SSPMIS_RTMIS_Field := 0;
    RXMIS : SSPMIS_RXMIS_Field := 0;
    TXMIS : SSPMIS_TXMIS_Field := 0;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_4_31 : Interfaces.LPC1114.UInt28;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for SSPMIS_Register use record
    RORMIS at 0 range 0..0;
    RTMIS at 0 range 1..1;
    RXMIS at 0 range 2..2;
    TXMIS at 0 range 3..3;
    Reserved_4_31 at 0 range 4..31;
  end record;


  subtype SSPICR_RORIC_Field is Interfaces.LPC1114.Bit;
  subtype SSPICR_RTIC_Field is Interfaces.LPC1114.Bit;

  type SSPICR_Register is record
    RORIC : SSPICR_RORIC_Field;
    RTIC : SSPICR_RTIC_Field;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_2_31 : Interfaces.LPC1114.UInt30;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for SSPICR_Register use record
    RORIC at 0 range 0..0;
    RTIC at 0 range 1..1;
    Reserved_2_31 at 0 range 2..31;
  end record;


  type SPI0 is record
    SSP0CR0  : aliased SSPCR0_Register;
    SSP0CR1  : aliased SSPCR1_Register;
    SSP0DR   : aliased SSPDR_Register;
    SSP0SR   : aliased SSPSR_Register;
    SSP0CPSR : aliased SSPCPSR_Register;
    SSP0IMSC : aliased SSPIMSC_Register;
    SSP0RIS  : aliased SSPRIS_Register;
    SSP0MIS  : aliased SSPMIS_Register;
    SSP0ICR  : aliased SSPICR_Register;
  end record
    with Volatile;

  for SPI0 use record
    SSP0CR0  at 16#00# range 0..31;
    SSP0CR1  at 16#04# range 0..31;
    SSP0DR   at 16#08# range 0..31;
    SSP0SR   at 16#0C# range 0..31;
    SSP0CPSR at 16#10# range 0..31;
    SSP0IMSC at 16#14# range 0..31;
    SSP0RIS  at 16#18# range 0..31;
    SSP0MIS  at 16#1C# range 0..31;
    SSP0ICR  at 16#20# range 0..31;
  end record;

  type SPI1 is record
    SSP1CR0  : aliased SSPCR0_Register;
    SSP1CR1  : aliased SSPCR1_Register;
    SSP1DR   : aliased SSPDR_Register;
    SSP1SR   : aliased SSPSR_Register;
    SSP1CPSR : aliased SSPCPSR_Register;
    SSP1IMSC : aliased SSPIMSC_Register;
    SSP1RIS  : aliased SSPRIS_Register;
    SSP1MIS  : aliased SSPMIS_Register;
    SSP1ICR  : aliased SSPICR_Register;
  end record
    with Volatile;

  for SPI1 use record
    SSP1CR0  at 16#00# range 0..31;
    SSP1CR1  at 16#04# range 0..31;
    SSP1DR   at 16#08# range 0..31;
    SSP1SR   at 16#0C# range 0..31;
    SSP1CPSR at 16#10# range 0..31;
    SSP1IMSC at 16#14# range 0..31;
    SSP1RIS  at 16#18# range 0..31;
    SSP1MIS  at 16#1C# range 0..31;
    SSP1ICR  at 16#20# range 0..31;
  end record;


  SPI0_Block : aliased SPI0
    with Import, Address => SPI0_Base;

  SPI1_Block : aliased SPI1
    with Import, Address => SPI1_Base;

end Interfaces.LPC1114.SPI;
