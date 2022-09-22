pragma Restrictions (No_Elaboration_Code);
pragma Style_Checks (Off);

with System.BB.Board_Parameters;
with System.BB.MCU_Parameters;

package System.BB.Parameters is
  pragma Preelaborate (System.BB.Parameters);

  Clock_Frequency : constant := Board_Parameters.Clock_Frequency;

  Ticks_Per_Second : constant := Clock_Frequency;

  Has_FPU : constant Boolean := MCU_Parameters.Has_FPU;

  Has_VTOR : constant Boolean := False;

  Has_OS_Extensions : constant Boolean := True;

  Is_ARMv6m : constant Boolean := True;

  ----------------
  -- Interrupts --
  ----------------
  
  subtype Interrupt_Range is Integer
    range -1 .. MCU_Parameters.Number_Of_Interrupts;

  Trap_Vectors : constant := 17;
  -- Name               Num
  -- 
  -- Reset_Vector             1
  -- NMI_Vector               2
  -- HardFault_Vector         3
  -- SVCall_Vector            11
  -- PendSV_Vector            14
  -- SysTick_Vector           15
  -- Interupt_Request_Vector  16
  
  Context_Buffer_Capacity : constant := 10;

  ------------
  -- Stacks --
  ------------
  
  Interrupt_Stack_Size : constant := 64;

  Interrupt_Sec_Stack_Size : constant := 0;

  ----------
  -- CPUS --
  ----------

  Max_Number_Of_CPUs : constant := 1;

  Multiprocessor : constant Boolean := Max_Number_Of_CPUs /= 1;

end System.BB.Parameters;
