library ieee;
use ieee.std_logic_1164.all;

entity sounds is
	port(
	sound1 : out integer range -128 to 127;
	sound2 : out integer range -128 to 127;
	sound3 : out integer range -128 to 127;
	clk ,rst : in std_logic;
       RL :in std_logic_vector(1 downto 0));
end sounds;

architecture group_ca_arc of sounds is 
	  signal n : integer := 23; --0 range 0 to 100 := 0;
	  signal i : integer; --0 range 0 to 100 := 0;
	  signal j : integer range 0 to 30:=0;
	  type memory_type is array (0 to 29) of integer range -128 to 127; 
	  signal sine : memory_type := (0,16,31,45,58,67,74,77,77,74,67,58,45,31,16,0,
   	-16,-31,-45,-58,-67,-74,-77,-77,-74,-67,-58,-45,-31,-16);
         signal sine1 : memory_type := (10,20,30,50,60,70,80,87,90,70,50,50,40,25,10,2,
   	-10,-35,-40,-51,-62,-76,-87,-78,-70,-70,-60,-40,-30,-10);

signal sine2: memory_type := (10,20,30,50,60,70,80,87,90,70,50,50,40,25,10,2,
   	-10,-35,-40,-51,-62,-76,-87,-78,-70,-70,-60,-40,-30,-10);

	
begin
	 process(clk,rst)
 	 begin
	if( rst = '0' ) then --rising_edge (clk)

	
	 case RL is 
		when "01"=>  --01 circle
				for n in 23 downto 0 loop
					sound1 <= sine(n);   --sound for circular movement 
				end loop;
		 	 
	      when "10"=>     --square		
				for n in 23 downto 0 loop
					sound2 <= sine1(n);   --sound for square movement 
		 	 	end loop;
		when "11"=>			       
				for n in 23 downto 0 loop
					sound3 <= sine2(n);
      				end loop;
		when others => 
	 end case ;
       elsif (rst ='1') then
       sound1<= sine(1);
       sound2<=sine(1);
       sound3<=sine(1);
       end if;
	end process;
end group_ca_arc;
