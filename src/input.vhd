library ieee;
use ieee.std_logic_1164.all;

entity input is
  port (
		resetN, A, B, clk: in Std_Logic;         -- A = on/off, B = wheel speed 
		C : in std_logic_vector (2 downto 0);  --C=fan speed
		T_i : in std_logic_vector (1 downto 0); -- T_i = track
		a0, b0 : out  Std_Logic; 
 		c0 : out std_logic_vector (2 downto 0);  
		t_o_i : out std_logic_vector (1 downto 0);
		rst_o: out Std_Logic;
		clk_divided : out Std_Logic-- clk_divider=clk4Hz
        	);
end entity input;

architecture arc_input_unit of input is
  component clk_divider is
	port (clk, rst    : in  std_logic;
		  clk_divided : out std_logic );
end component clk_divider;
	begin
		 a0<=A;
		 b0<=B;
         c0<=C;
		 t_o_i<=T_i;
		--clk_divided<=clk;
		rst_o<=resetN;

c_l_k:clk_divider port map
  (clk => clk,
   rst  => resetN,
   clk_divided => clk_divided);
    
				
end architecture arc_input_unit;
