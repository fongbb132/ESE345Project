 library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity or64 is
	 port(
		 i1 : in std_logic_vector(63 downto 0);
		 i2 : in std_logic_vector(63 downto 0);
		 o1 : out std_logic_vector(63 downto 0)
	     );
end or64;
	 	
architecture or64 of or64 is
	 					  			  					  
begin	
	o1<=i1 or i2; 
		
end or64;			 