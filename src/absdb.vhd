library IEEE;
use IEEE.STD_LOGIC_1164.all;	 
use ieee.numeric_std.all	;

entity absdb is
	 port(
	 	i1 : in std_logic_vector(63 downto 0);	
	 	i2 : in std_logic_vector(63 downto 0); 
		o1 : out std_logic_vector(63 downto 0)
	     );
end absdb;
	 	
architecture absdb of absdb is				 
begin		
	process(i1,i2)	 			
		variable diff: unsigned(7 downto 0);			
		variable larger: unsigned(7 downto 0);
		variable smaller: unsigned(7 downto 0);
	begin 		
		diff:=to_unsigned(0,8) ;
		


		for j in 0 to 7 loop
			if(i1((j*8+7) downto j*8)>i2((j*8+7) downto j*8))  then
				larger:= unsigned(i1((j*8+7) downto j*8));
				smaller:=unsigned(i2((j*8+7) downto j*8));
			else
				larger:= unsigned(i2((j*8+7) downto j*8));
				smaller:=unsigned(i1((j*8+7) downto j*8));

			end if; 

			diff:= larger-smaller;

			o1(j*8+7 downto j*8)<=std_logic_vector(diff);
		end loop;												  
		
	end process;						
end absdb;			 
