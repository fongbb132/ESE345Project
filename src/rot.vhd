 library IEEE;
use IEEE.STD_LOGIC_1164.all;	 
use ieee.numeric_std.all	;

entity rot is
	 port(
	 	i1 : in std_logic_vector(63 downto 0);	
	 	i2 : in std_logic_vector(63 downto 0); 
		 o1 : out std_logic_vector(63 downto 0)
	     );
end rot;
	 	
architecture rot of rot is				 
begin		
	process(i1)
	
	variable c0: Integer;			
	
	begin 								 		
		c0:=to_integer(unsigned(i2(5 downto 0)));
		
		o1<=i1(c0-1 downto 0) & i1(63 downto (c0));
	end process;						
end rot;			 