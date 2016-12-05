
library ieee;
use ieee.std_logic_1164.all;

entity bit16_adder is 
	port(a_in,b_in: in std_logic_vector(15 downto 0);		
	carry_in: in std_logic;
	sum_out: out std_logic_vector(15 downto 0);	   
	p_out:out std_logic;
	g_out:out std_logic;
	carry_out:out std_logic);
end bit16_adder;

architecture structural of bit16_adder is
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
	c_out2 <= g_out1 or (p_out1 and g_out1) or (p_out1 and p_out0 and carry_in);			 
	c_out3 <= g_out2 or (p_out2 and g_out1) or (p_out2 and p_out1 and g_out0) or (p_out2 and p_out1 and p_out0 and carry_in);
	carry_out <= g_out3 or(p_out3 and g_out2) or (p_out3 and p_out2 and g_out1) or (p_out3 and p_out2 and p_out1 and g_out0) or (p_out3 and p_out2 and p_out1 and p_out0 and carry_in);
	
	
	g_out<=g_out3 or (p_out3 and g_out2) or (p_out3 and p_out2 and p_out1) or (p_out3 and p_out2 and p_out1 and g_out0); 
	p_out <= p_out3 and p_out2 and p_out1 and p_out0;
	
	u1:entity bit4_adder port map(a_in(3 downto 0)=>a_in(3 downto 0), 
		b_in(3 downto 0)=>b_in(3 downto 0), 
		sum_out(3 downto 0)=>sum_out(3 downto 0), 	 
		carry_in=>carry_in,		 
		carry_out=>c_out1,
		g_out => g_out0,
		p_out => p_out0);	
		
	u2 :entity bit4_adder port map(a_in(3 downto 0)=>a_in(7 downto 4), 
		b_in(3 downto 0)=>b_in(7 downto 4), 
		sum_out(3 downto 0)=>sum_out(7 downto 4), 	 
		carry_in=>c_out1,
		carry_out=>c_out2,
		g_out => g_out1,
		p_out => p_out1);	   
		
	u3:entity bit4_adder port map(a_in=>a_in(11 downto 8), 
		b_in(3 downto 0)=>b_in(11 downto 8), 
		sum_out(3 downto 0)=>sum_out(11 downto 8), 	 
		carry_in=>c_out2,
		carry_out=>c_out3,
		g_out => g_out2,
		p_out => p_out2);	  
	u4:entity bit4_adder port map(a_in=>a_in(15 downto 12), 
		b_in=>b_in(15 downto 12), 
		sum_out=>sum_out(15 downto 12), 	 
		carry_in=>c_out3,
		carry_out=>carry_out,
		g_out => g_out3,
		p_out => p_out3);	  			 

	
end structural;