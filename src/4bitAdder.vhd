															  -------------------------------------------------------------------------------
-- Entity Name : 4bitAdder
-- Entity Description: full_adder has a, b and carry_out as inputs and sum, carry_out as 
--			   	  	   the outputs  
-- Architecture Name : structural
-- Description : Using structural coding style and 
--   			 components hall_adder and or_2.	 		   
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

entity bit4_adder is 
	port(
	carry_in: in std_logic;	  
	a_in: in std_logic_vector(3 downto 0); 
	b_in: in std_logic_vector(3 downto 0); 	  
	g_out: out std_logic; 
	p_out:out std_logic; 
	sum_out: out std_logic_vector(3 downto 0); 
	carry_out:out std_logic);
end bit4_adder;

architecture structural of bit4_adder is
	signal c_out1:std_logic;
	signal c_out2:std_logic;
	signal c_out3:std_logic;	   	
	signal c_in0:std_logic;	   	
	signal c_in1:std_logic;	   	
	signal c_in2:std_logic;	   	
	signal c_in3:std_logic;
	signal g0:std_logic;	  	   
	signal g1:std_logic;	   
	signal g2:std_logic;	   
	signal g3:std_logic;   
	signal p0:std_logic;
	signal p1:std_logic; 
	signal p2:std_logic;
	signal p3:std_logic; 
	
begin					
	c_in0 <= carry_in;				  	
	g0 <= a_in(0) and b_in(0); 
	g1 <= a_in(1) and b_in(1); 
	g2 <= a_in(2) and b_in(2); 
	g3 <= a_in(3) and b_in(3); 	  
	p0 <= a_in(0) or b_in(0); 
	p1 <= a_in(1) or b_in(1);
	p2 <= a_in(2) or b_in(2);
	p3 <= a_in(3) or b_in(3);		 
	g_out<=g3 or (p3 and g2) or (p3 and p2 and p1) or (p3 and p2 and p1 and g0); 
	p_out <= p3 and p2 and p1 and p0;
	
	c_out1 <= g0 or(p0 and carry_in);	
	c_out2 <= g1 or (p1 and g0) or (p1 and p0 and carry_in);		 
	c_out3 <= g2 or (p2 and g1) or (p2 and p1 and g0) or (p2 and p1 and p0 and carry_in);
	carry_out <=   g3 or (p3 and g2) or (p3 and p2 and g1 ) or (p3 and p2 and p1 and g0) or (p3 and p2 and p1 and p0 and carry_in);
	
	u1:entity full_adder port map(a=>a_in(0), b=>b_in(0), sum=>sum_out(0), carry_out=>c_out1,carry_in=>carry_in);	
	u2:entity full_adder port map(a=>a_in(1), b=>b_in(1), sum=>sum_out(1), carry_out=>c_out2,carry_in=>c_out1);	
	u3:entity full_adder port map(a=>a_in(2), b=>b_in(2), sum=>sum_out(2), carry_out=>c_out3,carry_in=>c_out2);	
	u4:entity full_adder port map(a=>a_in(3), b=>b_in(3), sum=>sum_out(3), carry_out=>carry_out,carry_in=>c_out3);					   
end structural;