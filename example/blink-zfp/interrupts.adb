pragma Warnings (Off);
with Interfaces.LPC1114.GPIO; use Interfaces.LPC1114.GPIO;
pragma Warnings (On);

package body Interrupts is

  procedure Hardfault is
    GPIO : GPIO0;
  begin
    GPIO.GPIO_DIR.IO7 := 2#1#;
    GPIO.GPIO_DATA (2**7).DATA := GPIO_DATA_Field'Last;
  end Hardfault;

end Interrupts;
