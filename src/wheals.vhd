library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity wheals is

port(Directions: in bit_vector (1 downto 0); -- 00 for forward, 11 reverse, 01 left, 10 right
	FR,BR,FL,BL: out std_logic_vector (1 downto 0);	-- 00/11 stop, 01 forward, 10 reverse
	clk,rst: in std_logic);
end entity wheals;

architecture contoll_arc of wheals is
 --signal clk_divided: std_logic;
 --component clk_divider is
--	port (clk, rst    : in  std_logic;
--		  clk_divided : out std_logic );
--		  end component;
	begin	
	--c_l_k:clk_divider port map
  --(clk => clk,rst=>rst,
     --clk_divided => clk_divided);
		process(clk,rst)
			begin
			if (rst ='0') then --rising_edge(clk)
			case Directions is
				when  "00" =>
						FR <= "01";
						BR <= "01";
						FL <= "01";
						BL <= "01";
				when  "11" =>  
						FR <= "00";
						BR <= "00";
						FL <= "00";
						BL <= "00";	
				when "10" =>
						FR <= "10";
						BR <= "10";
						FL <= "01";
						BL <= "01";		
				when  "01" =>
						FR <= "10";
						BR <= "10";
						FL <= "10";
						BL <= "10";
				end case;
				elsif (rst ='1') then
						FR <= "00";
						BR <= "00";
						FL <= "00";
						BL <= "00";	
				end if;
				
		end process;
 end architecture contoll_arc;
 
 
 
 
 
 
