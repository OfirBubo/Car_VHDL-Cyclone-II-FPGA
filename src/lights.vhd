library ieee;
use ieee.std_logic_1164.all;

entity lights is
	port(red : out std_logic_vector(15 downto 0);
	green : out std_logic_vector(7 downto 0);
       clk ,rst : in std_logic;
	RL :in std_logic_vector(1 downto 0));
end lights;

architecture group_c_arc of lights is 
	  signal red1 : std_logic_vector (15 downto 0):= "0000000000000000";
	  signal green1 : std_logic_vector (7 downto 0):= "00000000";
	  signal n : integer := 23; --0 range 0 to 100 := 0;
	  signal i : integer; --0 range 0 to 100 := 0;
	
begin
	 process(clk,rst)
 	 begin
	if(rst = '1' ) then --rising_edge (clk)

	
	 case RL is 
		when "01"=>  --01 circle
				for n in 23 downto 0 loop
					if (n>=8) then
						red1(n - 8)<='1';
						red<=red1;
						red1(n - 8)<='0';
						red<=red1;
					else
						green1(n)<='1';
						green<=green1;
						green1(n)<='0';
						green<=green1;
					end if;
				end loop;
		 	 
	      when "10"=>     --square		
				for n in 23 downto 0 loop
					if (n>=8) then
						red1(n - 8)<='1';
						red<=red1;
						red1(n - 8)<='0';
						red<=red1;
					else
						green1(n)<='1';
						green<=green1;
						green1(n)<='0';
						green<=green1;
					end if;
				end loop;
		 	 
		when "11"=>			       
				green1<="11111111";
				red1<="1111111111111111";
				red<=red1;
				green<=green1;
				green1<="00000000";
				red1<="0000000000000000";
				red<=red1;
				green<=green1;
			
		when others => 
	 end case ;
	elsif (rst ='1') then
       red1<= "0000000000000000";

        green1<="00000000";
        red<=red1;
	green<=green1;
       
      end if;
 end process;
end group_c_arc;
