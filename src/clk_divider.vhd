library ieee;
use ieee.std_logic_1164.all;

entity clk_divider is
	port (clk, rst    : in  std_logic ;
		  clk_divided : out std_logic );
end entity clk_divider;

architecture arc_clk_div of clk_divider is
	constant DIV_BY : integer := 2500000;
	constant IS_SWITCHED : std_logic := '0';
	signal cnt : integer range 0 to DIV_BY;
  begin
	sync : process (clk, rst)
		begin
			if rst = IS_SWITCHED then
				cnt <= 0;
			elsif clk'event AND clk='1' then
				if cnt = DIV_BY then
					cnt <= 0;
				else
					cnt <= cnt + 1;
				end if;
			end if;
	end process;

	comb : process (cnt)
		begin
			if cnt < DIV_BY/2 then
				clk_divided <= '0';
			else
				clk_divided <= '1';
			end if;
	end process;
end architecture arc_clk_div;
