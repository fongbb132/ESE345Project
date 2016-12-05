-------------------------------------------------------------------------------
-- Entity Name : full_adder
-- Entity Description: full_adder has a, b and carry_out as inputs and sum, carry_out as 
--			   	  	   the outputs  
-- Architecture Name : structural
-- Description : Using structural coding style and 
--   			 components hall_adder and or_2.	 		   
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

entity full_adder is 
	port(a,b,carry_in: in std_logic;
	sum, carry_out:out std_logic);
end full_adder;

architecture structural of full_adder is
	signal c_out1:std_logic;
	signal c_out2:std_logic;
	signal s_out:std_logic;	
begin						
	u1:entity half_adder port map(a=>a, b=>b, sum=>s_out, carry_out=>c_out1);
	u2:entity half_adder port map(a=>s_out, b=>carry_in, sum=>sum, carry_out=>c_out2);
	u3:entity or_2 port map(i1=>c_out2, i2=>c_out1, o1=>carry_out);
	
end structural;