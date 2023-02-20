--
-- blink.adb
--
-- This simple program blinks an LED attached to pin PIO0_9
-- in the morse code pattern for "Hello World". This program
-- serves to be an example of how to use and interract with 
-- the runtime library.
--
pragma Style_Checks (off);

with Ada.Real_Time; use Ada.Real_Time;

pragma Warnings (Off);
with System;      use System;
pragma Warnings (On);
with Machine_Code; use Machine_Code;

with Interfaces.LPC1114.GPIO; use Interfaces.LPC1114.GPIO;
--with Interrupt;

procedure Blink is

  Scale : constant Time_Span := Milliseconds (150);
  Dot    : constant Time_Span := Scale;
  Dash   : constant Time_Span := 3 * Scale;
  InDot  : constant Time_Span := Scale;
  InChar : constant Time_Span := 2 * Scale;
  InWord : constant Time_Span := 6 * Scale;

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

begin

  -- Set pin PIO1_9 to output
  GPIO1.DIR.IO9 := 2#1#;
  
  loop
    for I in Hello_World'Range loop

      case Hello_World (I) is
        when 0 =>
          GPIO1.DATA (2**9).DATA := GPIO_DATA_Field'Last;
          delay until Clock + Dot;
          GPIO1.DATA (2**9).DATA:= 0;
          delay until Clock + InDot;
        when 1 =>
          GPIO1.DATA (2**9).DATA := GPIO_DATA_Field'Last;
          delay until Clock + Dash;
          GPIO1.DATA (2**9).DATA:= 0;
          delay until Clock + InDot;
        when 2 =>
          delay until Clock + InChar;
        when 3 =>
          delay until Clock + InWord;
      end case;
    end loop;
  end loop;

end Blink;
