																
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is 
	port(a_in,b_in: in std_logic_vector(63 downto 0);		
	opcode: in std_logic_vector(3 downto 0);
	result: out std_logic_vector(63 downto 0));
end ALU;

architecture structural of ALU is	   	
	signal rdAnd, rdOr: std_logic_vector(63 downto 0);
begin		
	u1:entity and64 port map(i1=>a_in, 
	i2=>b_in, 
	o1=>rdAnd);	
	
	u2:entity or64 port map(i1=>a_in, 
	i2=>b_in, 
	o1=>rdOr);	
	
	 
	
	process(a_in, b_in,opcode)
	begin
	if(opcode = "0000") then 

	elsif(opcode ="0001") then

	elsif(opcode = "0010") then		  
		result<=rdAnd;
	elsif(opcode = "0011") then	  	  
		result<=rdOr;

	elsif(opcode = "0100") then

	elsif(opcode = "0101") then
	
	elsif(opcode = "0110") then
	
	elsif(opcode = "0111") then
	
	elsif(opcode = "1000") then
	
	elsif(opcode = "1001") then
		


	end if; 	   
	

	end process;
end structural;


