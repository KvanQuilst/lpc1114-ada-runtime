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
    DSS : SSPCR0_DSS_Field;
    FRF : SSPCR0_FRF_Field;
    CPOL : SSPCR0_CPOL_Field;
    CPHA : SSPCR0_CPHA_Field;
    SCR : SSPCR0_SCR_Field;
    Reserved_16_31 : Interfaces.LPC1114.UInt16;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for SSPCR0_Register use record
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
    LBM : SSPCR1_LBM_Field;
    SSE : SSPCR1_SSE_Field;
    MS : SSPCR1_MS_Field;
    SOD : SSPCR1_SOD_Field;
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
    DATA : SSPDR_DATA_Field;
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
    TFE : SSPSR_TFE_Field;
    TNF : SSPSR_TNF_Field;
    RNE : SSPSR_RNE_Field;
    RFF : SSPSR_RFF_Field;
    BSY : SSPSR_BSY_Field;
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
    CPSDVSR : SSPCPSR_CPSDVSR_Field;
    Reserved_8_31 : Interfaces.LPC1114.UInt24;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for SSPCPSR_Register use record
    CPSDVSR at 0 range 0..7;
    Reserved_8_31 at 0 range 8..31;
  end record;


  subtype SSPIMSC_RORIM_Field is Interfaces.LPC1114.Bit;
  subtype SSPIMSC_RTIM_Field is Interfaces.LPC1114.Bit;
  subtype SSPIMSC_RXIM_Field is Interfaces.LPC1114.Bit;
  subtype SSPIMSC_TXIM_Field is Interfaces.LPC1114.Bit;

  -- SPI/SSP Interrupt Mask Set/Clear Register
  type SSPIMSC_Register is record
    RORIM : SSPIMSC_RORIM_Field;
    RTIM : SSPIMSC_RTIM_Field;
    RXIM : SSPIMSC_RXIM_Field;
    TXIM : SSPIMSC_TXIM_Field;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_4_31 : Interfaces.LPC1114.UInt28;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for SSPIMSC_Register use record
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
    RORRIS : SSPRIS_RORRIS_Field;
    RTRIS : SSPRIS_RTRIS_Field;
    RXRIS : SSPRIS_RXRIS_Field;
    TXRIS : SSPRIS_TXRIS_Field;
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
    RORMIS : SSPMIS_RORMIS_Field;
    RTMIS : SSPMIS_RTMIS_Field;
    RXMIS : SSPMIS_RXMIS_Field;
    TXMIS : SSPMIS_TXMIS_Field;
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


  type SPI_Peripheral is record
    CR0  : aliased SSPCR0_Register;
    CR1  : aliased SSPCR1_Register;
    DR   : aliased SSPDR_Register;
    SR   : aliased SSPSR_Register;
    CPSR : aliased SSPCPSR_Register;
    IMSC : aliased SSPIMSC_Register;
    RIS  : aliased SSPRIS_Register;
    MIS  : aliased SSPMIS_Register;
    ICR  : aliased SSPICR_Register;
  end record
    with Volatile;

  for SPI_Peripheral use record
    CR0  at 16#00# range 0..31;
    CR1  at 16#04# range 0..31;
    DR   at 16#08# range 0..31;
    SR   at 16#0C# range 0..31;
    CPSR at 16#10# range 0..31;
    IMSC at 16#14# range 0..31;
    RIS  at 16#18# range 0..31;
    MIS  at 16#1C# range 0..31;
    ICR  at 16#20# range 0..31;
  end record;


  SPI0 : aliased SPI_Peripheral
    with Import, Address => SPI0_Base;

  SPI1 : aliased SPI_Peripheral
    with Import, Address => SPI1_Base;

end Interfaces.LPC1114.SPI;
