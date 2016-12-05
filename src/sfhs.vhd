library IEEE;
use IEEE.STD_LOGIC_1164.all;	 
use ieee.numeric_std.all	;

entity sfhs is
	 port(
	 	i1 : in std_logic_vector(63 downto 0);	
	 	i2 : in std_logic_vector(63 downto 0); 
		o1 : out std_logic_vector(63 downto 0)
	     );
end sfhs;
	 	
architecture sfhs of sfhs is				 
begin		
	process(i1,i2)	 			
		variable sum1: unsigned(16 downto 0);			
		variable sum2: unsigned(16 downto 0);
		variable sum3: unsigned(16 downto 0);
		variable sum4: unsigned(16 downto 0);
	begin 		
		sum1:=unsigned('0'&i1(63 downto 48)) - unsigned('0'&i2(63 downto 48));
		
		if(unsigned('0'&i1(63 downto 48)) < unsigned('0'&i2(63 downto 48))) then 
			sum1 :=  to_unsigned(0,17);
		end if; 										
		
		
		sum2:=unsigned('0'&i1(47 downto 32)) - unsigned('0'&i2(47 downto 32));
		
		if(unsigned('0'&i1(47 downto 32)) < unsigned('0'&i2(47 downto 32))) then 
			sum2 :=  to_unsigned(0,17);
		end if; 										
		
		sum3:=unsigned('0'&i1(31 downto 16)) - unsigned('0'&i2(31 downto 16));
		
		if(unsigned('0'&i1(31 downto 16)) < unsigned('0'&i2(31 downto 16))) then 
			sum3 :=  to_unsigned(0,17);
		end if; 										
		
		sum4:=unsigned('0'&i1(15 downto 0)) - unsigned('0'&i2(15 downto 0));
		
		if(unsigned('0'&i1(15 downto 0)) < unsigned('0'&i2(15 downto 0))) then 
			sum4 :=  to_unsigned(0,17);
		end if; 										
		
		
		o1(63 downto 48)<= std_logic_vector(sum1(15 downto 0));
		o1(47 downto 32)<= std_logic_vector(sum2(15 downto 0));
		o1(31 downto 16)<= std_logic_vector(sum3(15 downto 0));
		o1(15 downto 0) <= std_logic_vector(sum4(15 downto 0));
		
	end process;						
end sfhs;			 
