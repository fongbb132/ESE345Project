
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity IF_ID_Reg is
	port(
		instr : in std_logic_vector(15 downto 0);-- serial data input
		opcode, rs, rt, rd : out std_logic_vector(3 downto 0)-- parallel output
		);
end IF_ID_Reg; 

architecture IF_ID_Reg of IF_ID_Reg is
begin	  
	
	opcode <= instr(15 downto 12); 
	rs <= instr(11 downto 8); 
	rt<= instr(7 downto 4); 
	rd <=instr(3 downto 0);					   
end IF_ID_Reg;



