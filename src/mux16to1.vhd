library ieee;
use ieee.std_logic_1164.all;	  

entity mux16to1 is
	port( 

	port16, port2,port3, port4, port5, port6, port7, port8, port9, port10, port11, port12, port13, port14, port15: in std_logic_vector(63 downto 0);
	rt,rs: in std_logic_vector(3 downto 0); 
	opcode: in std_logic_vector(3 downto 0);
	output: out std_logic_vector(63 downto 0));
end mux16to1;

architecture structural of mux16to1 is
begin
	
	process(port16, port2,port3, port4, port5, port6, port7, port8, port9, port10, port11, port12, port13, port14, port15,opcode)
	begin
	if(opcode = "0000") then
		output<="0000000000000000000000000000000000000000000000000000000000000000";
	elsif (opcode = "0001") then
		output<=rt&rs&rt&rs&rt&rs&rt&rs&rt&rs&rt&rs&rt&rs&rt&rs;			 		

	elsif (opcode ="0010") then 
		output<=port3;		   

	elsif (opcode ="0011") then 
		output<=port4;		   

	elsif (opcode ="0100") then 
		output<=port5;		   

	elsif (opcode ="0101") then 
		output<=port6;		   

	elsif (opcode ="0110") then 
		output<=port7;		   

	elsif (opcode ="0111") then 
		output<=port8;

	elsif (opcode ="1000") then 
		output<=port9;		   

	elsif (opcode ="1001") then 
		output<=port10;

	elsif (opcode ="1010") then 
		output<=port11;		   

	elsif (opcode ="1011") then 
		output<=port12;		   

	elsif (opcode ="1100") then 
		output<=port13;

	elsif (opcode ="1101") then 
		output<=port14;		   

	elsif (opcode ="1110") then 
		output<=port15;		   		   		   		   

	else
		output<=port16;

	end if;
	end process;
end structural;