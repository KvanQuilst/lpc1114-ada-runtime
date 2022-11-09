pragma Style_Checks (off);

with System;

package Interfaces.LPC1114.UART is
  pragma Preelaborate;
  pragma No_Elaboration_Code_All;

  subtype U0RBRTHR_RBR_Field is Interfaces.LPC1114.Byte;
  subtype U0RBRTHR_THR_Field is Interfaces.LPC1114.Byte;

  -- UART Receiver Buffer and Transmit Holding Register
  -- Read := 0, Write := 1
  type U0RBRTHR_Register (RW : Interfaces.LPC1114.Bit := 0) is record
    Reserved_8_31 : Interfaces.LPC1114.UInt24;
    case RW is
      when 0 =>
        RBR : U0RBRTHR_RBR_Field;
      when 1 =>
        THR : U0RBRTHR_THR_Field;
    end case;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First,
      Unchecked_Union;

  for U0RBRTHR_Register use record
    RBR at 0 range 0..7;
    THR at 0 range 0..7;
    Reserved_8_31 at 0 range 8..31;
  end record;


  subtype U0DLL_DLLSB_Field is Interfaces.LPC1114.Byte;

  -- UART Divisor Latch LSB Register
  type U0DLL_Register is record
    DLLSB : U0DLL_DLLSB_Field;
    Reserved_8_31 : Interfaces.LPC1114.UInt24;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for U0DLL_Register use record
    DLLSB at 0 range 0..7;
    Reserved_8_31 at 0 range 8..31;
  end record;


  subtype U0DLM_DLMSB_Field is Interfaces.LPC1114.Byte;

  -- UART Divisor Latch MSB Register
  type U0DLM_Register is record
    DLMSB : U0DLM_DLMSB_Field;
    Reserved_8_31 : Interfaces.LPC1114.UInt24;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for U0DLM_Register use record
    DLMSB at 0 range 0..7;
    Reserved_8_31 at 0 range 8..31;
  end record;


  subtype U0IER_RBRIE_Field is Interfaces.LPC1114.Bit;
  subtype U0IER_THREIE_Field is Interfaces.LPC1114.Bit;
  subtype U0IER_RXLIE_Field is Interfaces.LPC1114.Bit;
  subtype U0IER_ABEOINTEN_Field is Interfaces.LPC1114.Bit;
  subtype U0IER_ABTOINTEN_Field is Interfaces.LPC1114.Bit;
  
  -- UART Interrupt Enable Register
  type U0IER_Register is record
    RBRIE : U0IER_RBRIE_Field;
    THREIE : U0IER_THREIE_Field;
    RXLIE : U0IER_RXLIE_Field;
    Reserved_3 : Interfaces.LPC1114.Bit;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_4_6 : Interfaces.LPC1114.UInt3;
    Reserved_7 : Interfaces.LPC1114.Bit;
    ABEOINTEN : U0IER_ABEOINTEN_Field;
    ABTOINTEN : U0IER_ABTOINTEN_Field;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_10_31 : Interfaces.LPC1114.UInt22;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for U0IER_Register use record
    RBRIE at 0 range 0..0;
    THREIE at 0 range 1..1;
    RXLIE at 0 range 2..2;
    Reserved_3 at 0 range 3..3;
    Reserved_4_6 at 0 range 4..6;
    Reserved_7 at 0 range 7..7;
    ABEOINTEN at 0 range 8..8;
    ABTOINTEN at 0 range 9..9;
    Reserved_10_31 at 0 range 10..31;
  end record;


  subtype U0IIR_INTSTATUS_Field is Interfaces.LPC1114.Bit;
  subtype U0IIR_INTID_Field is Interfaces.LPC1114.UInt3;
  subtype U0IIR_FIFOENABLE_Field is Interfaces.LPC1114.UInt2;
  subtype U0IIR_ABEOINT_Field is Interfaces.LPC1114.Bit;
  subtype U0IIR_ABTOINT_Field is Interfaces.LPC1114.Bit;

  subtype U0FCR_FIFOEN_Field is Interfaces.LPC1114.Bit;
  subtype U0FCR_RXFIFORES_Field is Interfaces.LPC1114.Bit;
  subtype U0FCR_TXFIFORES_Field is Interfaces.LPC1114.Bit;
  subtype U0FCR_RXTL_Field is Interfaces.LPC1114.UInt2;

  -- UART Interrupt Identification and FIFO Control Register
  -- IIR := 0, FCR := 1
  type U0IIRFCR_Register (REG : Interfaces.LPC1114.Bit := 0) is record
    Reserved_4_5 : Interfaces.LPC1114.UInt2;
    case REG is
      when 0 =>
        INTSTATUS : U0IIR_INTSTATUS_Field;
        INTID : U0IIR_INTID_Field;
        -- DO NOT WRITE 1s TO THESE BITS
        FIFOENABLE : U0IIR_FIFOENABLE_Field;
        ABEOINT : U0IIR_ABEOINT_Field;
        ABTOINT : U0IIR_ABTOINT_Field;
        -- DO NOT WRITE 1s TO THESE BITS
        Reserved_10_31 : Interfaces.LPC1114.UInt22;
      when 1 =>
        FIFOEN : U0FCR_FIFOEN_Field;
        RXFIFORES : U0FCR_RXFIFORES_Field;
        TXFIFORES : U0FCR_TXFIFORES_Field;
        Reserved_3 : Interfaces.LPC1114.Bit;
        -- DO NOT WRITE 1s TO THESE BITS
        RXTL : U0FCR_RXTL_Field;
        Reserved_8_31 : Interfaces.LPC1114.UInt24;
    end case;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First,
      Unchecked_Union;

  for U0IIRFCR_Register use record
    INTSTATUS at 0 range 0..0;
    INTID at 0 range 1..3;
    Reserved_4_5 at 0 range 4..5;
    FIFOENABLE at 0 range 6..7;
    ABEOINT at 0 range 8..8;
    ABTOINT at 0 range 9..9;
    Reserved_10_31 at 0 range 10..31;

    FIFOEN at 0 range 0..0;
    RXFIFORES at 0 range 1..1;
    TXFIFORES at 0 range 2..2;
    Reserved_3 at 0 range 3..3;
    RXTL at 0 range 6..7;
    Reserved_8_31 at 0 range 8..31;
  end record;


  subtype U0LCR_WLS_Field is Interfaces.LPC1114.UInt2;
  subtype U0LCR_SBS_Field is Interfaces.LPC1114.Bit;
  subtype U0LCR_PE_Field is Interfaces.LPC1114.Bit;
  subtype U0LCR_PS_Field is Interfaces.LPC1114.UInt2;
  subtype U0LCR_BC_Field is Interfaces.LPC1114.Bit;
  subtype U0LCR_DLAB_Field is Interfaces.LPC1114.Bit;

  -- UART Line Control Regsiter
  type U0LCR_Register is record
    WLS : U0LCR_WLS_Field;
    SBS : U0LCR_SBS_Field;
    PE : U0LCR_PE_Field;
    PS : U0LCR_PS_Field;
    BC : U0LCR_BC_Field;
    DLAB : U0LCR_DLAB_Field;
    Reserved_8_31 : Interfaces.LPC1114.UInt24;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for U0LCR_Register use record
    WLS at 0 range 0..1;
    SBS at 0 range 2..2;
    PE at 0 range 3..3;
    PS at 0 range 4..5;
    BC at 0 range 6..6;
    DLAB at 0 range 7..7;
    Reserved_8_31 at 0 range 8..31;
  end record;


  subtype U0MCR_DTRC_Field is Interfaces.LPC1114.Bit;
  subtype U0MCR_RTSC_Field is Interfaces.LPC1114.Bit;
  subtype U0MCR_LMS_Field is Interfaces.LPC1114.Bit;
  subtype U0MCR_RTSEN_Field is Interfaces.LPC1114.Bit;
  subtype U0MCR_CTSEN_Field is Interfaces.LPC1114.Bit;

  -- UART Modem Control Regsiter
  type U0MCR_Register is record
    DTRC : U0MCR_DTRC_Field;
    RTSC : U0MCR_RTSC_Field;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_2_3 : Interfaces.LPC1114.UInt2;
    LMS : U0MCR_LMS_Field;
    -- DO NOT WRITE 1s TO THIS BIT
    Reserved_5 : Interfaces.LPC1114.Bit;
    RTSEN : U0MCR_RTSEN_Field;
    CTSEN : U0MCR_CTSEN_Field;
    Reserved_8_31 : Interfaces.LPC1114.UInt24;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for U0MCR_Register use record
    DTRC at 0 range 0..0;
    RTSC at 0 range 1..1;
    Reserved_2_3 at 0 range 2..3;
    LMS at 0 range 4..4;
    Reserved_5 at 0 range 5..5;
    RTSEN at 0 range 6..6;
    CTSEN at 0 range 7..7;
    Reserved_8_31 at 0 range 8..31;
  end record;


  subtype U0LSR_RDR_Field is Interfaces.LPC1114.Bit;
  subtype U0LSR_OE_Field is Interfaces.LPC1114.Bit;
  subtype U0LSR_PE_Field is Interfaces.LPC1114.Bit;
  subtype U0LSR_FE_Field is Interfaces.LPC1114.Bit;
  subtype U0LSR_BI_Field is Interfaces.LPC1114.Bit;
  subtype U0LSR_THRE_Field is Interfaces.LPC1114.Bit;
  subtype U0LSR_TEMT_Field is Interfaces.LPC1114.Bit;
  subtype U0LSR_RXFE_Field is Interfaces.LPC1114.Bit;

  -- UART Line Status Regsiter
  type U0LSR_Register is record
    RDR : U0LSR_RDR_Field;
    OE : U0LSR_OE_Field;
    PE : U0LSR_PE_Field;
    FE : U0LSR_FE_Field;
    BI : U0LSR_BI_Field;
    THRE : U0LSR_THRE_Field;
    TEMT : U0LSR_TEMT_Field;
    RXFE : U0LSR_RXFE_Field;
    Reserved_8_31 : Interfaces.LPC1114.UInt24;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for U0LSR_Register use record
    RDR at 0 range 0..0;
    OE at 0 range 1..1;
    PE at 0 range 2..2;
    FE at 0 range 3..3;
    BI at 0 range 4..4;
    THRE at 0 range 5..5;
    TEMT at 0 range 6..6;
    RXFE at 0 range 7..7;
    Reserved_8_31 at 0 range 8..31;
  end record;


  subtype U0MSR_DCTS_Field is Interfaces.LPC1114.Bit;
  subtype U0MSR_DDSR_Field is Interfaces.LPC1114.Bit;
  subtype U0MSR_TERI_Field is Interfaces.LPC1114.Bit;
  subtype U0MSR_DDCD_Field is Interfaces.LPC1114.Bit;
  subtype U0MSR_CTS_Field is Interfaces.LPC1114.Bit;
  subtype U0MSR_DSR_Field is Interfaces.LPC1114.Bit;
  subtype U0MSR_RI_Field is Interfaces.LPC1114.Bit;
  subtype U0MSR_DCD_Field is Interfaces.LPC1114.Bit;

  -- UART Modem Status Register
  type U0MSR_Register is record
    DCTS : U0MSR_DCTS_Field;
    DDSR : U0MSR_DDSR_Field;
    TERI : U0MSR_TERI_Field;
    DDCD : U0MSR_DDCD_Field;
    CTS : U0MSR_CTS_Field;
    DSR : U0MSR_DSR_Field;
    RI : U0MSR_RI_Field;
    DCD : U0MSR_DCD_Field;
    Reserved_8_31 : Interfaces.LPC1114.UInt24;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for U0MSR_Register use record
    DCTS at 0 range 0..0;
    DDSR at 0 range 1..1;
    TERI at 0 range 2..2;
    DDCD at 0 range 3..3;
    CTS at 0 range 4..4;
    DSR at 0 range 5..5;
    RI at 0 range 6..6;
    DCD at 0 range 7..7;
    Reserved_8_31 at 0 range 8..31;
  end record;


  subtype U0SCR_Pad_Field is Interfaces.LPC1114.Byte;

  -- UART Scratch Pad RegsiterA
  type U0SCR_Register is record
    Pad : U0SCR_Pad_Field;
    Reserved_8_31 : Interfaces.LPC1114.UInt24;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for U0SCR_Register use record
    Pad at 0 range 0..7;
    Reserved_8_31 at 0 range 8..31;
  end record;


  subtype U0ACR_START_Field is Interfaces.LPC1114.Bit;
  subtype U0ACR_MODE_Field is Interfaces.LPC1114.Bit;
  subtype U0ACR_AUTORESTART_Field is Interfaces.LPC1114.Bit;
  subtype U0ACR_ABEOINTCLR_Field is Interfaces.LPC1114.Bit;
  subtype U0ACR_ABTOINTCLR_Field is Interfaces.LPC1114.Bit;

  -- UART Auto-baud Control Register
  type U0ACR_Register is record
    START : U0ACR_START_Field;
    MODE : U0ACR_MODE_Field;
    AUTORESTART : U0ACR_AUTORESTART_Field;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_3_7 : Interfaces.LPC1114.UInt5;
    ABEOINTCLR : U0ACR_ABEOINTCLR_Field;
    ABTOINTCLR : U0ACR_ABTOINTCLR_Field;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_10_31 : Interfaces.LPC1114.UInt22;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for U0ACR_Register use record
    START at 0 range 0..0;
    MODE at 0 range 1..1;
    AUTORESTART at 0 range 2..2;
    Reserved_3_7 at 0 range 3..7;
    ABEOINTCLR at 0 range 8..8;
    ABTOINTCLR at 0 range 9..9;
    Reserved_10_31 at 0 range 10..31;
  end record;


  subtype U0FDR_DIVADDVAL_Field is Interfaces.LPC1114.UInt4;
  subtype U0FDR_MULVAL_Field is Interfaces.LPC1114.UInt4;

  -- UART Fractional Divider Register
  type U0FDR_Register is record
    DIVADDVAL : U0FDR_DIVADDVAL_Field;
    MULVAL : U0FDR_MULVAL_Field;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_8_31 : Interfaces.LPC1114.UInt24;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for U0FDR_Register use record
    DIVADDVAL at 0 range 0..3;
    MULVAL at 0 range 4..7;
    Reserved_8_31 at 0 range 8..31;
  end record;


  subtype U0TER_TXEN_Field is Interfaces.LPC1114.Bit;

  -- UART Transmit Enable Regsiter
  type U0TER_Register is record
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_0_6 : Interfaces.LPC1114.UInt7;
    TXEN : U0TER_TXEN_Field;
    Reserved_8_31 : Interfaces.LPC1114.UInt24;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for U0TER_Register use record
    Reserved_0_6 at 0 range 0..6;
    TXEN at 0 range 7..7;
    Reserved_8_31 at 0 range 8..31;
  end record;

  subtype U0RS485CTRL_NMMEN_Field is Interfaces.LPC1114.Bit;
  subtype U0RS485CTRL_RXDIS_Field is Interfaces.LPC1114.Bit;
  subtype U0RS485CTRL_AADEN_Field is Interfaces.LPC1114.Bit;
  subtype U0RS485CTRL_SEL_Field is Interfaces.LPC1114.Bit;
  subtype U0RS485CTRL_DCTRL_Field is Interfaces.LPC1114.Bit;
  subtype U0RS485CTRL_OINV_Field is Interfaces.LPC1114.Bit;

  -- UART RS485 Control Register
  type U0RS485CTRL_Register is record
    NMMEN : U0RS485CTRL_NMMEN_Field;
    RXDIS : U0RS485CTRL_RXDIS_Field;
    AADEN : U0RS485CTRL_AADEN_Field;
    SEL : U0RS485CTRL_SEL_Field;
    DCTRL : U0RS485CTRL_DCTRL_Field;
    OINV : U0RS485CTRL_OINV_Field;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_6_31 : Interfaces.LPC1114.UInt26;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for U0RS485CTRL_Register use record
    NMMEN at 0 range 0..0;
    RXDIS at 0 range 1..1;
    AADEN at 0 range 2..2;
    SEL at 0 range 3..3;
    DCTRL at 0 range 4..4;
    OINV at 0 range 5..5;
    Reserved_6_31 at 0 range 6..31;
  end record;


  subtype U0RS485ADRMATCH_ADRMATCH_Field is Interfaces.LPC1114.Byte;

  -- UART RS485 Address Match Register
  type U0RS485ADRMATCH_Register is record
    ADRMATCH : U0RS485ADRMATCH_ADRMATCH_Field;
    Reserved_8_31 : Interfaces.LPC1114.UInt24;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for U0RS485ADRMATCH_Register use record
    ADRMATCH at 0 range 0..7;
    Reserved_8_31 at 0 range 8..31;
  end record;


  subtype U0RS485DLY_DLY_Field is Interfaces.LPC1114.Byte;

  -- UART RS485 Delay Value Register
  type U0RS485DLY_Register is record
    DLY : U0RS485DLY_DLY_Field;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_8_31 : Interfaces.LPC1114.UInt24;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for U0RS485DLY_Register use record
    DLY at 0 range 0..7;
    Reserved_8_31 at 0 range 8..31;
  end record;


  type Reserved_Space is array (Integer range <>) of Interfaces.LPC1114.UInt32;

  type UART_Peripheral (DLAB : Interfaces.LPC1114.Bit := 0) is record
    U0IIR_FCR       : aliased U0IIRFCR_Register;
    U0LCR           : aliased U0LCR_Register;
    U0MCR           : aliased U0MCR_Register;
    U0LSR           : aliased U0LSR_Register;
    U0MSR           : aliased U0MSR_Register;
    U0SCR           : aliased U0SCR_Register;
    U0ACR           : aliased U0ACR_Register;
    Reserved0       : aliased Reserved_Space (0..0);
    U0FDR           : aliased U0FDR_Register;
    Reserved1       : aliased Reserved_Space (0..0);
    U0TER           : aliased U0TER_Register;
    Reserved2       : aliased Reserved_Space (0..5);
    U0RS485CTRL     : aliased U0RS485CTRL_Register;
    U0RS485ADRMATCH : aliased U0RS485ADRMATCH_Register;
    U0RS485DLY      : aliased U0RS485DLY_Register;
    case DLAB is
      when 0 =>
        U0RBR_THR       : aliased U0RBRTHR_Register;
        U0IER           : aliased U0IER_Register;
      when 1 =>
        U0DLL           : aliased U0DLL_Register;
        U0DLM           : aliased U0DLM_Register;
    end case;
  end record
    with Volatile;

  for UART_Peripheral use record
    U0RBR_THR       at 16#00# range 0..31;
    U0DLL           at 16#00# range 0..31;
    U0DLM           at 16#04# range 0..31;
    U0IER           at 16#04# range 0..31;
    U0IIR_FCR       at 16#08# range 0..31;
    U0LCR           at 16#0C# range 0..31;
    U0MCR           at 16#10# range 0..31;
    U0LSR           at 16#14# range 0..31;
    U0MSR           at 16#18# range 0..31;
    U0SCR           at 16#1C# range 0..31;
    U0ACR           at 16#20# range 0..31;
    Reserved0       at 16#24# range 0..31;
    U0FDR           at 16#28# range 0..31;
    Reserved1       at 16#2C# range 0..31;
    U0TER           at 16#30# range 0..31;
    Reserved2       at 16#34# range 0..191;
    U0RS485CTRL     at 16#4C# range 0..31;
    U0RS485ADRMATCH at 16#50# range 0..31;
    U0RS485DLY      at 16#54# range 0..31;
  end record;

  UART : aliased UART_Peripheral
    with Import, Address => UART_Base;

end Interfaces.LPC1114.UART;
