library ieee;
use ieee.std_logic_1164.all;

entity track is
  port (
    resetN, A, B, clk: in Std_Logic;          -- A = on/off, B = wheel speed
		T : in std_logic_vector (1 downto 0); -- T = track
		a0, b0 : out  Std_Logic;               
		t_o : out std_logic_vector (1 downto 0);
                clk_divided: out std_logic;
                rst_o: out Std_Logic);
end entity track;

architecture arc_track of track is
	signal counter : integer range 0 to 8; 
	begin
		a0<=A;
	    b0<=B;

clk_divided<=clk;
rst_o<=resetN;

		process (clk, resetN)
			begin
				if resetN = '0' then
					counter <= 0;
				elsif rising_edge(clk) then
					if counter < 8 then
						counter <= counter + 1;
					else
						counter <= 0;
					end if;
				end if;
		end process;

		process (A, T, counter)
			begin
			  if (A='0') then
			    t_o<="11"; -- stop
			    
				elsif (A = '1') then
					if (T = "00") OR  (counter = 0)then -- stop
						t_o<="11"; -- stop	
					
					elsif (T = "01") then  -- circle
						t_o<="10"; -- Turn left	
					
					elsif (T = "10") then  -- square
						if (counter < 6 ) then 
							t_o<="00"; -- go stright
						elsif ((counter > 5) AND (counter < 8))then
							t_o<="10"; -- Turn left
						end if;		
				
					elsif (T = "11") then  -- back and forth
						if (counter=0) or (counter=8) or (counter=4)then
							t_o<="11";
						elsif ((counter<4) AND (counter>0))then
							t_o<="00"; -- go stright
						elsif (counter>4) AND (counter<7)then
							t_o<="01"; -- go reverse
						end if;
					end if;
				end if;
		end process;
				
end architecture arc_track;


