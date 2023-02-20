with Ada.Interrupts.Names;
with Machine_Code; use Machine_Code;

package body Interrupt is
  protected PIO is
    procedure Interrupt;
    pragma Attach_Handler (Interrupt, Ada.Interrupts.Names.PIO0_7_Interrupt);
  end PIO;

  protected body PIO is
    procedure Interrupt is
    begin
      Asm ("nop");
    end Interrupt;
  end PIO;

  procedure Interrupt_Init is
  begin
    Asm ("nop");
  end Interrupt_Init;
end Interrupt;
