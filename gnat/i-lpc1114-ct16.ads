pragma Style_Checks (off);

with System;

package Interfaces.LPC1114.CT is
  pragma Preelaborate;
  pragma No_Elaboration_Code_All;

  ---------------
  -- Registers --
  ---------------
  
  subtype TMRIR_Interrupt_Field is Interfaces.LPC1114.Bit;

  -- Interrupt Register
  type TMRIR_Register is record
    MR0 : TMRIR_Interrupt_Field := 0;
    MR1 : TMRIR_Interrupt_Field := 0;
    MR2 : TMRIR_Interrupt_Field := 0;
    MR3 : TMRIR_Interrupt_Field := 0;
    CR0 : TMRIR_Interrupt_Field := 0;
    Reserved_5_31 : Interfaces.LPC1114.UInt27;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for TMRIR_Register use record
    MR0 at 0 range 0..0;
    MR1 at 0 range 1..1;
    MR2 at 0 range 2..2;
    MR3 at 0 range 3..3;
    CR0 at 0 range 4..4;
    Reserved_5_31 at 0 range 5..31;
  end record;


  subtype TMRTCR_CEn_Field is Interfaces.LPC1114.Bit;
  subtype TMRTCR_CRst_Field is Interfaces.LPC1114.Bit;

  -- Timer Control Register
  type TMRTCR_Register is record
    CEn : TMRTCR_CEn_Field := 0;
    CRst : TMRTCR_CRst_Field := 0;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_2_31 : Interfaces.LPC1114.UInt30;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for TMRTCR_Register use record
    CEn at 0 range 0..0;
    CRst at 0 range 1..1;
    Reserved_2_31 at 0 range 2..31;
  end record;


  subtype TMRTC_TC_Field is Interfaces.LPC1114.UInt16;

  -- Timer Counter
  type TMRTC_Register is record
    TC : TMRTC_TC_Field := 0;
    Reserved_16_31 : Interfaces.LPC1114.UInt16;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for TMRTC_Register use record
    TC at 0 range 0..15;
    Reserved_16_31 at 0 range 16..31;
  end record;


  subtype TMRPR_PR_Field is Interfaces.LPC1114.UInt16;

  -- Prescale Register
  type TMRPR_Register is record
    PR : TMRPR_PR_Field := 0;
    Reserved_16_31 : Interfaces.LPC1114.UInt16;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for TMRPR_Register use record
    PR at 0 range 0..15;
    Reserved_16_31 at 0 range 16..31;
  end record;


  subtype TMRPC_PC_Field is Interfaces.LPC1114.UInt16;

  -- Prescale Counter Register
  type TMRPC_Register is record
    PC : TMRPC_PC_Field := 0;
    Reserved_16_31 : Interfaces.LPC1114.UInt16;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for TMRPC_Register use record
    PC at 0 range 0..15;
    Reserved_16_31 at 0 range 16..31;
  end record;


  subtype TMRMCR_MRI_Field is Interfaces.LPC1114.Bit;
  subtype TMRMCR_MRR_Field is Interfaces.LPC1114.Bit;
  subtype TMRMCR_MRS_Field is Interfaces.LPC1114.Bit;

  -- Match Control Register
  type TMRMCR_Register is record
    MR0I : TMRMCR_MRI_Field := 0;
    MR0R : TMRMCR_MRR_Field := 0;
    MR0S : TMRMCR_MRS_Field := 0;
    MR1I : TMRMCR_MRI_Field := 0;
    MR1R : TMRMCR_MRR_Field := 0;
    MR1S : TMRMCR_MRS_Field := 0;
    MR2I : TMRMCR_MRI_Field := 0;
    MR2R : TMRMCR_MRR_Field := 0;
    MR2S : TMRMCR_MRS_Field := 0;
    MR3I : TMRMCR_MRI_Field := 0;
    MR3R : TMRMCR_MRR_Field := 0;
    MR3S : TMRMCR_MRS_Field := 0;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_12_31 : Interfaces.LPC1114.UInt20;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for TMRMCR_Register use record
    MR0I at 0 range 0..0;
    MR0R at 0 range 1..1;
    MR0S at 0 range 2..2;
    MR1I at 0 range 3..3;
    MR1R at 0 range 4..4;
    MR1S at 0 range 5..5;
    MR2I at 0 range 6..6;
    MR2R at 0 range 7..7;
    MR2S at 0 range 8..8;
    MR3I at 0 range 9..9;
    MR3R at 0 range 10..10;
    MR3S at 0 range 11..11;
    Reserved_12_31 at 0 range 12..31;
  end record;


  subtype TMRMR_MATCH_Field is Interfaces.LPC1114.UInt16;

  -- Match Registers
  type TMRMR_Register is record
    MATCH : TMRMR_MATCH_Field := 0;
    Reserved_16_31 : Interfaces.LPC1114.UInt16;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for TMRMR_Register use record
    MATCH at 0 range 0..15;
    Reserved_16_31 at 0 range 16..31;
  end record;


  subtype TMRCCR_CAP0RE_Field is Interfaces.LPC1114.Bit;
  subtype TMRCCR_CAP0FE_Field is Interfaces.LPC1114.Bit;
  subtype TMRCCR_CAP0I_Field is Interfaces.LPC1114.Bit;

  -- Capture Control Register
  type TMRCCR_Register is record
    CAP0RE : TMRCCR_CAP0RE_Field : 0;
    CAP0FE : TMRCCR_CAP0FE_Field : 0;
    CAP0I : TMRCCR_CAP0I_Field : 0;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_3_31 : Interfaces.LPC1114.UInt29;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for TMRCCR_Register use record
    CAP0RE at 0 range 0..0;
    CAP0FE at 0 range 1..1;
    CAP0I at 0 range 2..2;
    Reserved_3_31 at 0 range 3..31;
  end record;


  subtype TMRCR0_CAP_Field is Interfaces.LPC1114.UInt16;

  -- Capture Register
  type TMRCR0_Register is record
    CAP : TMRCR0_CAP_Field := 0;
    Reserved_16_31 : Interfaces.LPC1114.UInt16;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for TMRCR0_Register use record
    CAP at 0 range 0..15;
    Reserved_16_31 at 0 range 16..31;
  end record;


  subtype TMREMR_EM_Field is Interfaces.LPC1114.Bit;
  subtype TMREMR_EMC_Field is Interfaces.LPC1114.UInt2;

  -- Extern Match Register
  type TMREMR_Register is record
    EM0 : TMREMR_EM_Field := 0;
    EM1 : TMREMR_EM_Field := 0;
    EM2 : TMREMR_EM_Field := 0;
    EM3 : TMREMR_EM_Field := 0;
    EMC0 : TMREMR_EMC_Field := 2#00#;
    EMC1 : TMREMR_EMC_Field := 2#00#;
    EMC2 : TMREMR_EMC_Field := 2#00#;
    EMC3 : TMREMR_EMC_Field := 2#00#;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_12_31 : Interfaces.LPC1114.UInt20;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for TMREMR_Register use record
    EM0 at 0 range 0..0;
    EM1 at 0 range 1..1;
    EM2 at 0 range 2..2;
    EM3 at 0 range 3..3;
    EMC0 at 0 range 4..5;
    EMC1 at 0 range 6..7;
    EMC2 at 0 range 8..9;
    EMC3 at 0 range 10..11;
    Reserved_12_31 at 0 range 12..31;
  end record;


  subtype TMRCTCR_CTM_Field is Intefaces.LPC1114.UInt2;
  subtype TMRCTCR_CIS_Field is Intefaces.LPC1114.UInt2;

  -- Count Control Register
  type TMRCTCR_Register is record
    CTM : TMRCTCR_CTM_Field := 2#00#;
    CIS : TMRCTCR_CIS_Field := 2#00#;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_4_31 : Interfaces.LPC1114.UInt28;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for TMRCTCR_Register use record
    CTM at 0 range 0..1;
    CIS at 0 range 2..3;
    Reserved_4_31 at 0 range 4..31;
  end record;


  subtype TMRPWMC_PWMEN_Field is Interfaces.LPC1114.Bit;

  -- PWM Control Register
  type TMRPWMC_Register is record
    PWMEN0 : TMRPWMC_PWMEN_Field : 0;
    PWMEN1 : TMRPWMC_PWMEN_Field : 0;
    PWMEN2 : TMRPWMC_PWMEN_Field : 0;
    PWMEN3 : TMRPWMC_PWMEN_Field : 0;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_4_31 : Interfaces.LPC1114.UInt28;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;


  type CT16B0 is record
    TMR16B0IR   : aliased TMRIR_Register;
    TMR16B0TCR  : aliased TMRTCR_Register;
    TMR16B0TC   : aliased TMRTC_Register;
    TMR16B0PR   : aliased TMRPR_Register;
    TMR16B0PC   : aliased TMRPC_Register;
    TMR16B0MCR  : aliased TMRMCR_Register;
    TMR16B0MR0  : aliased TMRMR_Register;
    TMR16B0MR1  : aliased TMRMR_Register;
    TMR16B0MR2  : aliased TMRMR_Register;
    TMR16B0MR3  : aliased TMRMR_Register;
    TMR16B0CCR  : aliased TMRCCR_Register;
    TMR16B0CR0  : aliased TMRCR0_Register;
    Reserved0   : Array 3 of Interfaces.LPC1114.UInt32;
    TMR16B0EMR  : aliased TMREMR_Register;
    Reserved1   : Array 12 of Interfaces.LPC1114.UInt32;
    TMR16B0CTCR : aliased TMRCTCR_Register;
    TMR16B0PWMC : aliased TMRPWMC_Register;
  end record
    with Volatile;

  for CT16B0 use record
    TMR16B0IR   at 16#00# range 0..31;
    TMR16B0TCR  at 16#04# range 0..31;
    TMR16B0TC   at 16#08# range 0..31;
    TMR16B0PR   at 16#0C# range 0..31;
    TMR16B0PC   at 16#10# range 0..31;
    TMR16B0MCR  at 16#14# range 0..31;
    TMR16B0MR0  at 16#18# range 0..31;
    TMR16B0MR1  at 16#1C# range 0..31;
    TMR16B0MR2  at 16#20# range 0..31;
    TMR16B0MR3  at 16#24# range 0..31;
    TMR16B0CCR  at 16#28# range 0..31;
    TMR16B0CR0  at 16#2C# range 0..31;
    Reserved0   at 16#30# range 0..31;
    TMR16B0EMR  at 16#3C# range 0..31;
    Reserved1   at 16#40# range 0..31;
    TMR16B0CTCR at 16#70# range 0..31;
    TMR16B0PWMC at 16#74# range 0..31;
  end record;

  type CT16B1 is record
    TMR16B1IR   : aliased TMRIR_Register;
    TMR16B1TCR  : aliased TMRTCR_Register;
    TMR16B1TC   : aliased TMRTC_Register;
    TMR16B1PR   : aliased TMRPR_Register;
    TMR16B1PC   : aliased TMRPC_Register;
    TMR16B1MCR  : aliased TMRMCR_Register;
    TMR16B1MR0  : aliased TMRMR_Register;
    TMR16B1MR1  : aliased TMRMR_Register;
    TMR16B1MR2  : aliased TMRMR_Register;
    TMR16B1MR3  : aliased TMRMR_Register;
    TMR16B1CCR  : aliased TMRCCR_Register;
    TMR16B1CR0  : aliased TMRCR0_Register;
    Reserved0   : Array 3 of Interfaces.LPC1114.UInt32;
    TMR16B1EMR  : aliased TMREMR_Register;
    Reserved1   : Array 12 of Interfaces.LPC1114.UInt32;
    TMR16B1CTCR : aliased TMRCTCR_Register;
    TMR16B1PWMC : aliased TMRPWMC_Register;
  end record
    with Volatile;

  for CT16B1 use record
    TMR16B1IR   at 16#00# range 0..31;
    TMR16B1TCR  at 16#04# range 0..31;
    TMR16B1TC   at 16#08# range 0..31;
    TMR16B1PR   at 16#0C# range 0..31;
    TMR16B1PC   at 16#10# range 0..31;
    TMR16B1MCR  at 16#14# range 0..31;
    TMR16B1MR0  at 16#18# range 0..31;
    TMR16B1MR1  at 16#1C# range 0..31;
    TMR16B1MR2  at 16#20# range 0..31;
    TMR16B1MR3  at 16#24# range 0..31;
    TMR16B1CCR  at 16#28# range 0..31;
    TMR16B1CR0  at 16#2C# range 0..31;
    Reserved0   at 16#30# range 0..31;
    TMR16B1EMR  at 16#3C# range 0..31;
    Reserved1   at 16#40# range 0..31;
    TMR16B1CTCR at 16#70# range 0..31;
    TMR16B1PWMC at 16#74# range 0..31;
  end record;


  type CT32B0 is record
    TMR32B0IR   : aliased TMRIR_Register;
    TMR32B0TCR  : aliased TMRTCR_Register;
    TMR32B0TC   : aliased TMRTC_Register;
    TMR32B0PR   : aliased TMRPR_Register;
    TMR32B0PC   : aliased TMRPC_Register;
    TMR32B0MCR  : aliased TMRMCR_Register;
    TMR32B0MR0  : aliased TMRMR_Register;
    TMR32B0MR1  : aliased TMRMR_Register;
    TMR32B0MR2  : aliased TMRMR_Register;
    TMR32B0MR3  : aliased TMRMR_Register;
    TMR32B0CCR  : aliased TMRCCR_Register;
    TMR32B0CR0  : aliased TMRCR0_Register;
    Reserved0   : Array 3 of Interfaces.LPC1114.UInt32;
    TMR32B0EMR  : aliased TMREMR_Register;
    Reserved1   : Array 12 of Interfaces.LPC1114.UInt32;
    TMR32B0CTCR : aliased TMRCTCR_Register;
    TMR32B0PWMC : aliased TMRPWMC_Register;
  end record
    with Volatile;

  for CT32B0 use record
    TMR32B0IR   at 16#00# range 0..31;
    TMR32B0TCR  at 16#04# range 0..31;
    TMR32B0TC   at 16#08# range 0..31;
    TMR32B0PR   at 16#0C# range 0..31;
    TMR32B0PC   at 16#10# range 0..31;
    TMR32B0MCR  at 16#14# range 0..31;
    TMR32B0MR0  at 16#18# range 0..31;
    TMR32B0MR1  at 16#1C# range 0..31;
    TMR32B0MR2  at 16#20# range 0..31;
    TMR32B0MR3  at 16#24# range 0..31;
    TMR32B0CCR  at 16#28# range 0..31;
    TMR32B0CR0  at 16#2C# range 0..31;
    Reserved0   at 16#30# range 0..31;
    TMR32B0EMR  at 16#3C# range 0..31;
    Reserved1   at 16#40# range 0..31;
    TMR32B0CTCR at 16#70# range 0..31;
    TMR32B0PWMC at 16#74# range 0..31;
  end record;

  type CT32B1 is record
    TMR32B1IR   : aliased TMRIR_Register;
    TMR32B1TCR  : aliased TMRTCR_Register;
    TMR32B1TC   : aliased TMRTC_Register;
    TMR32B1PR   : aliased TMRPR_Register;
    TMR32B1PC   : aliased TMRPC_Register;
    TMR32B1MCR  : aliased TMRMCR_Register;
    TMR32B1MR0  : aliased TMRMR_Register;
    TMR32B1MR1  : aliased TMRMR_Register;
    TMR32B1MR2  : aliased TMRMR_Register;
    TMR32B1MR3  : aliased TMRMR_Register;
    TMR32B1CCR  : aliased TMRCCR_Register;
    TMR32B1CR0  : aliased TMRCR0_Register;
    Reserved0   : Array 3 of Interfaces.LPC1114.UInt32;
    TMR32B1EMR  : aliased TMREMR_Register;
    Reserved1   : Array 12 of Interfaces.LPC1114.UInt32;
    TMR32B1CTCR : aliased TMRCTCR_Register;
    TMR32B1PWMC : aliased TMRPWMC_Register;
  end record
    with Volatile;

  for CT32B1 use record
    TMR32B1IR   at 16#00# range 0..31;
    TMR32B1TCR  at 16#04# range 0..31;
    TMR32B1TC   at 16#08# range 0..31;
    TMR32B1PR   at 16#0C# range 0..31;
    TMR32B1PC   at 16#10# range 0..31;
    TMR32B1MCR  at 16#14# range 0..31;
    TMR32B1MR0  at 16#18# range 0..31;
    TMR32B1MR1  at 16#1C# range 0..31;
    TMR32B1MR2  at 16#20# range 0..31;
    TMR32B1MR3  at 16#24# range 0..31;
    TMR32B1CCR  at 16#28# range 0..31;
    TMR32B1CR0  at 16#2C# range 0..31;
    Reserved0   at 16#30# range 0..31;
    TMR32B1EMR  at 16#3C# range 0..31;
    Reserved1   at 16#40# range 0..31;
    TMR32B1CTCR at 16#70# range 0..31;
    TMR32B1PWMC at 16#74# range 0..31;
  end record;


  CT16B0_Block : aliased CT16B0
    with Import, Address => CT16B0_Base;

  CT16B1_Block : aliased CT16B1
    with Import, Address => CT16B1_Base;

  CT32B0_Block : aliased CT32B0
    with Import, Address => CT32B0_Base;

  CT32B1_Block : aliasesd CT32B1
    with Import, Address => CT32B1_Base;

end Interfaces.LPC1114.CT;
