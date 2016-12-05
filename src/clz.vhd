 library IEEE;
use IEEE.STD_LOGIC_1164.all;	 
use ieee.numeric_std.all	;

entity clz is
	 port(
		 i1 : in std_logic_vector(63 downto 0);		 
		 o1 : out std_logic_vector(63 downto 0)
	     );
end clz;
	 	
architecture clz of clz is				 
begin		
	process(i1)
	
	variable c0: natural:=0;	 
	variable c1: natural:=0;			
	
	begin 								 		
			for j in 31 downto 0	loop			   				
					if (i1(j) = '0') then 		
						c0:=c0+1;  
					else
						exit;
				  	end if;			   
			end loop;					
			
			for j in 31 downto 0	loop	
					if (i1(j+32) = '0') then 
						c1:=c1+1;
					else 
						exit;
				  	end if;	 		   														 
			end loop;					  
			
		o1<=std_logic_vector(to_unsigned(0,64));										   
		o1(5 downto 0)<=std_logic_vector(to_unsigned(c0, 6));	 	  
		o1(37 downto 32)<= std_logic_vector(to_unsigned(c1, 6));	  
	end process;						
end clz;			 