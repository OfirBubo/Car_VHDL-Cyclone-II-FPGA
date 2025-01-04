library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity car_test_bench is
port(
 
    --inputs
           	resetN, A, B, clk: in Std_Logic;         -- A = on/off, B = wheel speed 
		C : in std_logic_vector (2 downto 0);  --C=fan speed
		T_i : in std_logic_vector (1 downto 0); -- T = track
           	--outputs
           	
           	--B output
           	FR,BR,FL,BL: out std_logic_vector (1 downto 0);	-- 00/11 stop, 01 forward, 10 reverse
  
   --C output
    		green_leds: out std_logic_vector(7 downto 0);
           	red_leds: out std_logic_vector(15 downto 0);
           	speaker: out std_logic_VECTOR(1 downto 0);
 		sound1 : out integer range -128 to 127;
		sound2 : out integer range -128 to 127;
		sound3 : out integer range -128 to 127;
                  	
           	--D output
           	fan : out std_logic_vector (1 downto 0)
 
);
end car_test_bench;
 architecture sim of car_test_bench is
   
           	--internal signals processed in A component
                -- signals processed from the input  component (A1 component)  which was represented in the presentation by the letter m    
       	           	signal  m_movment_type:  std_logic_vector(1 downto 0);      
	                Signal wheal_speed : std_logic;   	
	           	signal  fan_speed :  std_logic_vector (2 downto 0);
               	        signal  on_off_m :  std_logic;
      			signal  clk_divided_m :  std_logic;
			signal rst_m : std_logic;
--signals processed from the the route type processor component (A2)t which was represented in the presentation by the letter w 
	                signal  on_off_w :  std_logic;
		    	signal  clk_divided_w :  std_logic;
		        signal  w_movment_type :  std_logic_vector (1 downto 0);	
			Signal wheal_speed_w : std_logic; 
			signal rst_w : std_logic;

        
component input is
           	 
           	  Port (resetN, A, B, clk: in Std_Logic;         -- A = on/off, B = wheel speed 
		C : in std_logic_vector (2 downto 0);  --C=fan speed
		T_i : in std_logic_vector (1 downto 0); -- T = track
		a0, b0, clk_divided : out  Std_Logic; -- clk_divider=clk4Hz
 		c0 : out std_logic_vector (2 downto 0); 
		rst_o: out Std_Logic; 
		t_o_i : out std_logic_vector (1 downto 0));
           	end component;
 
component track is
           	 
           	  Port (resetN, A, B, clk: in Std_Logic;          -- A = on/off, B = wheel speed
			T : in std_logic_vector (1 downto 0); -- T = track
			a0, b0 : out  Std_Logic;               
			t_o : out std_logic_vector (1 downto 0);
                	clk_divided: out std_logic;
                	rst_o: out Std_Logic
           		);
           	  end component;
component wheals is
           	 
           	  Port (   Directions: in std_logic_vector (1 downto 0); -- 00 for forward, 11 reverse, 01 left, 10 right
	                   FR,BR,FL,BL: out std_logic_vector (1 downto 0);	-- 00/11 stop, 01 forward, 10 reverse
	                   clk,rst: in std_logic);

           	  end component;
component lights is
port(  
        red : out std_logic_vector (15 downto 0);
	green : out std_logic_vector (7 downto 0);
	clk ,rst : in std_logic;
        RL : in std_logic_vector(1 downto 0));
 		   
		   end component;
component sounds is
port(  
        sound1 : out integer range -128 to 127;
	sound2 : out integer range -128 to 127;
	sound3 : out integer range -128 to 127;
	clk ,rst : in std_logic;
        RL : in std_logic_vector(1 downto 0));
		   
		   end component;

component fan_motor is
	port
	( clk, sw2, sw1, sw0: in  STD_LOGIC;
           pwm1, pwm2: out  STD_LOGIC);
		   
		   end component;
 
begin
 
a1: input
 
		port map (	resetN=>resetN, 
				A=>A, 
				B=>B,
			        C=>C,
				clk=>clk,
				T_i=>T_i,
				a0 =>on_off_m, 
				b0=>wheal_speed,  
				c0=>fan_speed,
				rst_o=>rst_m, 
				clk_divided =>clk_divided_m, 
				t_o_i=>m_movment_type);          	
A2: track
		Port map ( resetN=>resetN, 
			   A=>on_off_m, 
			   B=>wheal_speed,
			   clk=>clk_divided_m,
		           T=>m_movment_type,
		           a0=>on_off_w, 
			   b0=>wheal_speed_w, 
                           t_o => w_movment_type,
                           clk_divided=>clk_divided_w ,
			   rst_o=>rst_w); 

B_component: wheals  port map(
          Directions => m_movment_type,
          FR => FR,
          BR => BR,
          FL => FL,
          BL => BL,
          clk => clk ,
          rst=>rst_w
          );
c_component_one: lights port map(	red=>red_leds, 
			green=>green_leds,
			clk=>clk_divided_m,
			rst=>rst_m,
			RL=>m_movment_type);

C_component_two: sounds port map(	sound1=>sound1, 
			sound2=>sound2,
			clk=>clk_divided_w,
			rst=>rst_w,
			RL=>w_movment_type);

D_component: fan_motor port map(clk=>clk_divided_m,
				sw2=>fan_speed(2),sw1=>fan_speed(1),sw0=>fan_speed(0),
           			pwm1=>Fan(0),pwm2=>Fan(1)	)   ;

 
end architecture;
 
 


 
 
 
 
 

 
 
 
 
 
 
