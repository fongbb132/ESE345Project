library IEEE;
use IEEE.STD_LOGIC_1164.all;	 
use ieee.numeric_std.all	;

entity sfw is
	 port(
	 	i1 : in std_logic_vector(63 downto 0);	
	 	i2 : in std_logic_vector(63 downto 0); 
		o1 : out std_logic_vector(63 downto 0)
	     );
end sfw;
	 	
architecture sfw of sfw is				 
begin		
	process(i1,i2)	 			
	
	begin 		
		o1(63 downto 32)<= std_logic_vector(unsigned(i1(63 downto 32)) - unsigned(i2(63 downto 32)));
		o1(31 downto 0)<=std_logic_vector(unsigned(i1(31 downto 0)) - unsigned(i2(31 downto 0)));
		
	end process;						
end sfw;			 
