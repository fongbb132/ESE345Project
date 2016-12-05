																																																															   library IEEE;
use IEEE.STD_LOGIC_1164.all;	 
use ieee.numeric_std.all	;

entity ah is
	 port(
	 	i1 : in std_logic_vector(63 downto 0);	
	 	i2 : in std_logic_vector(63 downto 0); 
		o1 : out std_logic_vector(63 downto 0)
	     );
end ah;
	 	
architecture ah of ah is				 
begin		
	process(i1)	 			
	
	begin 		
		o1(63 downto 48)<= std_logic_vector(unsigned(i1(63 downto 48)) + unsigned(i2(63 downto 48)));
		o1(47 downto 32)<= std_logic_vector(unsigned(i1(47 downto 32)) + unsigned(i2(47 downto 32)));
		o1(31 downto 16)<=std_logic_vector(unsigned(i2(31 downto 16)) + unsigned(i1(31 downto 16)));
		o1(15 downto 0)<=std_logic_vector(unsigned(i2(15 downto 0)) + unsigned(i1(15 downto 0)));
		
	end process;						
end ah;			 
