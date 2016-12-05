 library IEEE;
use IEEE.STD_LOGIC_1164.all;	 
use ieee.numeric_std.all	;

entity shlhi is
	 port(
	 	i1 : in std_logic_vector(63 downto 0);	
	 	i2 : in std_logic_vector(63 downto 0); 
		o1 : out std_logic_vector(63 downto 0)
	     );
end shlhi;
	 	
architecture shlhi of shlhi is				 
begin		
	process(i1)
	
	variable c0: Integer;			 			
	
	begin 								 		
		c0:=to_integer(unsigned(i2(3 downto 0)));	
		o1(63 downto 48)<=i1((63-c0) downto 48) & std_logic_vector(to_unsigned(0, c0));	   
		o1(47 downto 32)<=i1((47-c0) downto 32) & std_logic_vector(to_unsigned(0, c0));	
		o1(31 downto 16)<=i1((31-c0) downto 16) & std_logic_vector(to_unsigned(0, c0));
		o1(15 downto 0)<=i1((15-c0) downto 0) & std_logic_vector(to_unsigned(0, c0));
		
		
	end process;						
end shlhi;			 

