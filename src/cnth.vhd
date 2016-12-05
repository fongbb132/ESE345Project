 library IEEE;
use IEEE.STD_LOGIC_1164.all;	 
use ieee.numeric_std.all	;

entity cnth is
	 port(
		 i1 : in std_logic_vector(63 downto 0);		 
		 o1 : out std_logic_vector(63 downto 0)
	     );
end cnth;
	 	
architecture cnth of cnth is				 
begin		
	process(i1)
	
	variable c0: natural:=0;	 
	variable c1: natural :=0;
	variable c2: natural:=0;	 
	variable c3: natural:=0;	 
	
	begin 								 
		
		
		for i in 0 to 3 loop
			for j in 0 to 15	loop		
				if (i = 0) then  			   
					if (i1(i+j) = '1') then 
						c0:=c0+1;	 
				  	end if;
				elsif(i=1) then   
					if (i1(j+16) = '1') then 
						c1:=c1+1;			 
				  	end if;
				elsif(i=2) then   
					if (i1(j+32) = '1') then 
						c2:=c2+1;		 
				  	end if;
				elsif(i=3) then   
					if (i1(j+48) = '1') then 
						c3:=c3+1;	  
				  	end if;
				end if;   
			end loop;	
		end loop;
		o1<=std_logic_vector(to_unsigned(0,64));
		o1(4 downto 0)<=std_logic_vector(to_unsigned(c0, 5));	 
		o1(20 downto 16)<= std_logic_vector(to_unsigned(c1, 5));
		o1(36 downto 32)<= std_logic_vector(to_unsigned(c2, 5));
		o1(52 downto 48)<=std_logic_vector(to_unsigned(c3, 5));
	end process;						
end cnth;			 