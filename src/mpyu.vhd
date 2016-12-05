library IEEE;
use IEEE.STD_LOGIC_1164.all;	 
use ieee.numeric_std.all	;

entity mpyu is
	 port(
	 	i1 : in std_logic_vector(63 downto 0);	
	 	i2 : in std_logic_vector(63 downto 0); 
		o1 : out std_logic_vector(63 downto 0)
	     );
end mpyu;
	 	
architecture mpyu of mpyu is				 
begin		
	process(i1,i2)	 			
		variable sum1: unsigned(31 downto 0);			
		variable sum2: unsigned(31 downto 0);
	begin 		
		sum1:=unsigned(i1(47 downto 32)) * unsigned(i2(47 downto 32));
		
		sum2:=unsigned(i1(15 downto 0)) * unsigned(i2(15 downto 0));
		
											
		
		
		
		o1(63 downto 32)<= std_logic_vector(sum1(31 downto 0));
		o1(31 downto 0)<= std_logic_vector(sum2(31 downto 0));
		
	end process;						
end mpyu;			 
