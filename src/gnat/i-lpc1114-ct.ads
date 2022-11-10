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
    MR0 : TMRIR_Interrupt_Field;
    MR1 : TMRIR_Interrupt_Field;
    MR2 : TMRIR_Interrupt_Field;
    MR3 : TMRIR_Interrupt_Field;
    CR0 : TMRIR_Interrupt_Field;
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
    CEn : TMRTCR_CEn_Field;
    CRst : TMRTCR_CRst_Field;
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
    TC : TMRTC_TC_Field;
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
    PR : TMRPR_PR_Field;
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
    PC : TMRPC_PC_Field;
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
    MR0I : TMRMCR_MRI_Field;
    MR0R : TMRMCR_MRR_Field;
    MR0S : TMRMCR_MRS_Field;
    MR1I : TMRMCR_MRI_Field;
    MR1R : TMRMCR_MRR_Field;
    MR1S : TMRMCR_MRS_Field;
    MR2I : TMRMCR_MRI_Field;
    MR2R : TMRMCR_MRR_Field;
    MR2S : TMRMCR_MRS_Field;
    MR3I : TMRMCR_MRI_Field;
    MR3R : TMRMCR_MRR_Field;
    MR3S : TMRMCR_MRS_Field;
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
    MATCH : TMRMR_MATCH_Field;
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
    CAP0RE : TMRCCR_CAP0RE_Field;
    CAP0FE : TMRCCR_CAP0FE_Field;
    CAP0I : TMRCCR_CAP0I_Field;
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
    CAP : TMRCR0_CAP_Field;
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
    EM0 : TMREMR_EM_Field;
    EM1 : TMREMR_EM_Field;
    EM2 : TMREMR_EM_Field;
    EM3 : TMREMR_EM_Field;
    EMC0 : TMREMR_EMC_Field;
    EMC1 : TMREMR_EMC_Field;
    EMC2 : TMREMR_EMC_Field;
    EMC3 : TMREMR_EMC_Field;
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


  subtype TMRCTCR_CTM_Field is Interfaces.LPC1114.UInt2;
  subtype TMRCTCR_CIS_Field is Interfaces.LPC1114.UInt2;

  -- Count Control Register
  type TMRCTCR_Register is record
    CTM : TMRCTCR_CTM_Field;
    CIS : TMRCTCR_CIS_Field;
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
    PWMEN0 : TMRPWMC_PWMEN_Field;
    PWMEN1 : TMRPWMC_PWMEN_Field;
    PWMEN2 : TMRPWMC_PWMEN_Field;
    PWMEN3 : TMRPWMC_PWMEN_Field;
    -- DO NOT WRITE 1s TO THESE BITS
    Reserved_4_31 : Interfaces.LPC1114.UInt28;
  end record
    with Volatile_Full_Access, Size => 32,
      Bit_Order => System.Low_Order_First;

  for TMRPWMC_Register use record
    PWMEN0 at 0 range 0..0;
    PWMEN1 at 0 range 1..1;
    PWMEN2 at 0 range 2..2;
    PWMEN3 at 0 range 3..3;
    Reserved_4_31 at 0 range 4..31;
  end record;

  type Reserved_Space is array (Integer range <>) of Interfaces.LPC1114.UInt32;

  type CT16_Peripheral is record
    IR   : aliased TMRIR_Register;
    TCR  : aliased TMRTCR_Register;
    TC   : aliased TMRTC_Register;
    PR   : aliased TMRPR_Register;
    PC   : aliased TMRPC_Register;
    MCR  : aliased TMRMCR_Register;
    MR0  : aliased TMRMR_Register;
    MR1  : aliased TMRMR_Register;
    MR2  : aliased TMRMR_Register;
    MR3  : aliased TMRMR_Register;
    CCR  : aliased TMRCCR_Register;
    CR0  : aliased TMRCR0_Register;
    Reserved0   : aliased Reserved_Space (0..2);
    EMR  : aliased TMREMR_Register;
    Reserved1   : aliased Reserved_Space (0..11);
    CTCR : aliased TMRCTCR_Register;
    PWMC : aliased TMRPWMC_Register;
  end record
    with Volatile;

  for CT16_Peripheral use record
    IR   at 16#00# range 0..31;
    TCR  at 16#04# range 0..31;
    TC   at 16#08# range 0..31;
    PR   at 16#0C# range 0..31;
    PC   at 16#10# range 0..31;
    MCR  at 16#14# range 0..31;
    MR0  at 16#18# range 0..31;
    MR1  at 16#1C# range 0..31;
    MR2  at 16#20# range 0..31;
    MR3  at 16#24# range 0..31;
    CCR  at 16#28# range 0..31;
    CR0  at 16#2C# range 0..31;
    Reserved0   at 16#30# range 0..95;
    EMR  at 16#3C# range 0..31;
    Reserved1   at 16#40# range 0..383;
    CTCR at 16#70# range 0..31;
    PWMC at 16#74# range 0..31;
  end record;

  type CT32_Peripheral is record
    IR        : aliased TMRIR_Register;
    TCR       : aliased TMRTCR_Register;
    TC        : aliased TMRTC_Register;
    PR        : aliased TMRPR_Register;
    PC        : aliased TMRPC_Register;
    MCR       : aliased TMRMCR_Register;
    MR0       : aliased TMRMR_Register;
    MR1       : aliased TMRMR_Register;
    MR2       : aliased TMRMR_Register;
    MR3       : aliased TMRMR_Register;
    CCR       : aliased TMRCCR_Register;
    CR0       : aliased TMRCR0_Register;
    Reserved0 : aliased Reserved_Space (0..2);
    EMR       : aliased TMREMR_Register;
    Reserved1 : aliased Reserved_Space (0..11);
    CTCR      : aliased TMRCTCR_Register;
    PWMC      : aliased TMRPWMC_Register;
  end record
    with Volatile;

  for CT32_Peripheral use record
    IR          at 16#00# range 0..31;
    TCR         at 16#04# range 0..31;
    TC          at 16#08# range 0..31;
    PR          at 16#0C# range 0..31;
    PC          at 16#10# range 0..31;
    MCR         at 16#14# range 0..31;
    MR0         at 16#18# range 0..31;
    MR1         at 16#1C# range 0..31;
    MR2         at 16#20# range 0..31;
    MR3         at 16#24# range 0..31;
    CCR         at 16#28# range 0..31;
    CR0         at 16#2C# range 0..31;
    Reserved0   at 16#30# range 0..95;
    EMR         at 16#3C# range 0..31;
    Reserved1   at 16#40# range 0..383;
    CTCR        at 16#70# range 0..31;
    PWMC        at 16#74# range 0..31;
  end record;

  CT16B0 : aliased CT16_Peripheral
    with Import, Address => CT16B0_Base;

  CT16B1 : aliased CT16_Peripheral
    with Import, Address => CT16B1_Base;

  CT32B0 : aliased CT32_Peripheral
    with Import, Address => CT32B0_Base;

  CT32B1 : aliased CT32_Peripheral
    with Import, Address => CT32B1_Base;

end Interfaces.LPC1114.CT;
