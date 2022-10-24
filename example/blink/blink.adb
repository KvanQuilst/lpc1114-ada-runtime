pragma Style_Checks (off);

pragma Warnings (Off);
with System;      use System;
with Interfaces;  use Interfaces;
with Interfaces.LPC1114.GPIO; use Interfaces.LPC1114.GPIO;
--with LPC1114;     use LPC1114;
pragma Warnings (On);

procedure Blink is

  Scale : constant := 5000;
  Dot : constant := 25 * Scale;
  Dash : constant := 75 * Scale;
  InDot : constant := 25 * Scale;
  InChar : constant := 50 * Scale;
  InWord : constant := 150 * Scale;

  type Morse is mod 4;
  type Char_Arr is array (Integer range <>) of Morse;
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

  GPIO : GPIO1;

  procedure Wait (Time : Integer) is
  begin
    for I in 0 .. Time loop
      null;
    end loop;
  end Wait;

begin

  -- Turn PIO1_9 on
  GPIO.GPIO_DIR.IO9 := 2#1#;

  loop
    for I in Hello_World'Range loop
      case Hello_World (I) is
        when 0 =>
          GPIO.GPIO_DATA (2**9) .DATA := GPIO_DATA_Field'Last;
          Wait (Dot);          
          GPIO.GPIO_DATA (2**9) .DATA:= 0;
          Wait (InDot);
        when 1 =>
          GPIO.GPIO_DATA (2**9) .DATA := GPIO_DATA_Field'Last;
          Wait (Dash);
          GPIO.GPIO_DATA (2**9) .DATA:= 0;
          Wait (InDot);
        when 2 =>
          Wait (InChar);
        when 3 =>
          Wait (InWord);
      end case;
    end loop;
  end loop;

end Blink;
