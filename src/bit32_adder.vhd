																
library ieee;
use ieee.std_logic_1164.all;

entity bit32_adder is 
	port(a_in,b_in: in std_logic_vector(31 downto 0);		
	carry_in: in std_logic;
	sum_out: out std_logic_vector(31 downto 0);
	carry_out:out std_logic);
end bit32_adder;

architecture structural of bit32_adder is
	signal g_out0:std_logic;
	signal p_out0:std_logic;	 	
	signal g_out1:std_logic;
	signal p_out1:std_logic;	 	
	signal g_out2:std_logic;
	signal p_out2:std_logic;	 	
	signal g_out3:std_logic;
	signal p_out3:std_logic;	 		 
	signal c_out1:std_logic;
	signal c_out2:std_logic;
	signal c_out3:std_logic;	   	
	
begin		
	c_out1 <= g_out0 or (p_out0 and carry_in);																																			
	carry_out <= g_out1 or (p_out1 and g_out1) or (p_out1 and p_out0 and carry_in);	
	
	
	u1:entity bit16_adder port map(a_in=>a_in(15 downto 0), 
		b_in=>b_in(15 downto 0), 
		sum_out=>sum_out(15 downto 0), 	 
		carry_in=>carry_in,		 
		carry_out=>c_out1,
		g_out => g_out0,
		p_out => p_out0);	
		
	u2 :entity bit16_adder port map(a_in=>a_in(31 downto 16), 
		b_in=>b_in(31 downto 16), 
		sum_out=>sum_out(31 downto 16), 	 
		carry_in=>c_out1,
		carry_out=>c_out2,
		g_out => g_out1,
		p_out => p_out1);	   
	

	
end structural;