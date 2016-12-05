library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity and64 is
	 port(
		 i1 : in std_logic_vector(63 downto 0);
		 i2 : in std_logic_vector(63 downto 0);
		 o1 : out std_logic_vector(63 downto 0)
	     );
end and64;
	 	
architecture and64 of and64 is
	 					  			  					  
begin	
	o1<=i1 and i2; 
		
end and64;			 