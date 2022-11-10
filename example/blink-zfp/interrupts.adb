pragma Warnings (Off);
with System; use System;
pragma Warnings (On);
with Interfaces.LPC1114.GPIO; use Interfaces.LPC1114.GPIO;

package body Interrupts is

  procedure Hardfault is
  begin
    -- Set pin PIO0_7 to output
    GPIO0.DIR.IO7 := 2#1#;
    -- Set pin PIO0_7 to HIGH 
    GPIO0.DATA (2**7).DATA := GPIO_DATA_Field'Last;
  end Hardfault;

end Interrupts;
