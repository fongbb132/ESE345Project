library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package instruction_buffer_type is															 
type instructionBuffer is array(15 downto 0) of std_logic_vector (15 downto 0);
end package instruction_buffer_type;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.instruction_buffer_type.all;

entity instruction_buffer is
    port
    (
    instruction_address : in  std_logic_vector(3 downto  0);
    instructions        : in instructionBuffer;
    clk                 : in std_logic;
    instruction_out     : out std_logic_vector(15 downto 0)
    );
end instruction_buffer;							

architecture structural of instruction_buffer is 
begin	  
	process(clk)
	begin 
	if (clk'EVENT and clk ='1')	then
		
		instruction_out <= instructions(to_integer(unsigned(instruction_address)));

	end if;
	end process;
end structural;

