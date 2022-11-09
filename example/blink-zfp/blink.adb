pragma Style_Checks (off);

pragma Warnings (Off);
with System;      use System;
with System.Machine_Code; use System.Machine_Code;
with Interfaces;  use Interfaces;
with Interfaces.LPC1114.GPIO; use Interfaces.LPC1114.GPIO;
pragma Warnings (On);

procedure Blink is

  Scale  : constant := 2500;
  Dot    : constant := 25 * Scale;
  Dash   : constant := 75 * Scale;
  InDot  : constant := 25 * Scale;
  InChar : constant := 50 * Scale;
  InWord : constant := 150 * Scale;

  type Morse is mod 4;
  type Char_Arr is array (Natural range <>) of Morse;
  Hello_World : constant Char_Arr := (
    0,0,0,0,2,  -- H
    0,2,        -- E
    0,1,0,0,2,  -- L
    0,1,0,0,2,  -- L
    1,1,1,      -- O
    3,          -- 
    0,1,1,2,    -- W
    1,1,1,2,    -- O
    0,1,0,2,    -- R
    0,1,0,0,2,  -- L
    1,0,0,      -- D
    3           --
    );

  procedure Wait (Time : Integer) is
  begin
    for I in 0 .. Time loop
      Asm ("nop");
    end loop;
  end Wait;

begin

  -- Set pins PIO0_7 and PIO1_9 to output
  GPIO0.DIR.IO7 := 2#1#;
  GPIO1.DIR.IO9 := 2#1#;
  
  loop
    for I in Hello_World'Range loop
      case Hello_World (I) is
        when 0 =>
          GPIO1.DATA (2**9).DATA := GPIO_DATA_Field'Last;
          GPIO0.DATA (2**7).DATA := 0;
          Wait (Dot);          
          GPIO1.DATA (2**9).DATA:= 0;
          GPIO0.DATA (2**7).DATA := GPIO_DATA_Field'Last;
          Wait (InDot);
        when 1 =>
          GPIO1.DATA (2**9).DATA := GPIO_DATA_Field'Last;
          GPIO0.DATA (2**7).DATA := 0;
          Wait (Dash);
          GPIO1.DATA (2**9).DATA:= 0;
          GPIO0.DATA (2**7).DATA := GPIO_DATA_Field'Last;
          Wait (InDot);
        when 2 =>
          Wait (InChar);
        when 3 =>
          Wait (InWord);
      end case;
    end loop;
  end loop;

end Blink;
