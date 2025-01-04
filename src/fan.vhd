
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity fan_motor is
    Port ( clk, sw2, sw1, sw0: in  STD_LOGIC;
           pwm1, pwm2: out  STD_LOGIC);
end fan_motor;

architecture Behavioral of fan_motor is
signal count: integer range 0 to 50000;
signal speed: integer;

begin
process(clk, sw0, sw1, sw2, speed)
  begin
  if (sw1='0' and sw0='0') then
	speed <= 0;
  elsif (sw1='0' and sw0='1') then
	speed <= 27000;
  elsif (sw1='1' and sw0='0') then
	speed <= 33000;
  else
	speed <= 0;
  end if;
  
  if(rising_edge(clk)) then
    count <= count+1;
    if(count = 49999) then
      count <= 0;
    end if;
	if(count < speed) then
	  if(sw2 = '1') then
		pwm2 <= '0';
		pwm1 <= '1';
	  else
		pwm1 <= '0';
		pwm2 <= '1';
	  end if;
	else
	  pwm1 <= '0';
	  pwm2 <= '0';
	end if;
  end if;
  
end process;
end Behavioral;