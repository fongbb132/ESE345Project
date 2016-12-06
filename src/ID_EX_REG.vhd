
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ID_EX_Reg is
	port(
		rs_val, rt_val : in std_logic_vector(63 downto 0);-- serial data input
		opcode, rs, rt, rd : in std_logic_vector(3 downto 0);-- parallel output
		
		writeEn: out std_logic; 
		clk: in std_logic; 																									  	
		rs_val_out, rt_val_out : out std_logic_vector(63 downto 0);-- serial data input
		opcode_out, rs_out, rt_out, rd_out : out std_logic_vector(3 downto 0)-- parallel output
		);
end ID_EX_Reg; 

architecture ID_EX_Reg of ID_EX_Reg is			 

																			   																			  
	signal rs_val_signal: std_logic_vector(63 downto 0); 
	signal rt_val_signal: std_logic_vector(63 downto 0); 
	signal rs_signal: std_logic_vector(3 downto 0);   
	signal opcode_signal, rd_out_signal, rt_signal: std_logic_vector(3 downto 0); 
begin	
	
	process(clk )
	begin			  
		
		if(opcode = "0000") then 
			writeEn<='0';
		else
			writeEn<='1';
			
		end if; 
		
		
		if rising_edge(clk) then 		 
			opcode_out <= opcode_signal; 
			rs_val_out <=rs_val_signal; 
			rt_val_out <= rt_val_signal;
			rs_out<=rs_signal; 
			rt_out<=rt_signal; 
			rd_out<=rd_out_signal; 
			
		end if; 							   
		
		if falling_edge(clk) then 
			opcode_signal<= opcode; 
			rs_val_signal <= rs_val;
			rt_val_signal <= rt_val;
			rs_signal<= rs; 
			rt_signal<=rt; 
			rd_out_signal <=rd;
			
		end if; 
	end process; 
	

				   
end ID_EX_Reg;



