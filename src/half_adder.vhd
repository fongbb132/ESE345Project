									   --
-- Title       : half_adder_struct_hier
-- Design      : half_adder_struct_hier
-- Author      : Fong	  
--
-------------------------------------------------------------------------------
-- Entity Name : half_adder
-- Entity Description: half_adder has a and b as inputs and sum, carry_out as 
--			   	  	   the outputs  
-- Architecture Name : structural
-- Description : Using structural coding style and 
--   			 components xor_2 and and_2.	 				  			 
-----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;	  

entity half_adder is
	port( a, b: in std_logic;
	sum, carry_out: out std_logic);
end half_adder;

architecture structural of half_adder is
begin
	u1: entity xor_2 port map(i1=>a, i2=>b, o1=>sum);
	u2: entity and_2 port map(i1=>a, i2=>b, o1=>carry_out);
end structural;