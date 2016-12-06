																														   																
library ieee;
use ieee.std_logic_1164.all;
use work.instruction_buffer_type.all;


entity pipelinedUnit is 
	port(
	buffer_in: in instructionBuffer;
	clk:in std_logic; 
	inst_addr:in std_logic_vector(3 downto 0); 		
	port1, port2, port3, port4, port5, port6, port7, port8, port9, port10, port11, port12, port13, port14, port15, port16: out std_logic_vector(63 downto 0)
	
	); 
	

end pipelinedUnit;

architecture structural of pipelinedUnit is
	signal instr: std_logic_vector(15 downto 0); 
	signal opcode_if_id, rs_if_id, rt_if_id, rd_if_id: std_logic_vector(3 downto 0);    	
	signal opcode_id_ex, rs_id_ex, rt_id_ex, rd_id_ex: std_logic_vector(3 downto 0); 
	signal rs_val, rt_val, rs_val_id_ex, rt_val_id_ex: std_logic_vector( 63 downto 0); 
	signal writeEn:std_logic; 
	signal ALU_result: std_logic_vector(63 downto 0); 
	
	
begin	
	
	u1:entity instruction_buffer port map(
		instructions=>buffer_in, 
		instruction_address=> inst_addr, 
		clk=>clk, 
		instruction_out=> instr
	);	
		
	u2 :entity IF_ID_Reg port map(
		instr=> instr, 
		opcode=>opcode_if_id, 
		rs=> rs_if_id, 
		rt=>rt_if_id, 
		rd=>rd_if_id
	);	   
	

	u3: entity register_file port map(
		regASel=> rs_if_id, 
		regBSel=> rt_if_id, 
		clk=>clk, 
		writeEnable=>writeEn, 
		rs=> rs_val, 
		rt=> rt_val, 

		rd=> ALU_result, 
		writeRegSel=> rd_id_ex	 ,	  
		 port1 => port1, 
		 port2 => port2, 
		 port3 => port3, 
		 port4 => port4,  
		 port5 => port5, 
		 port6 => port6, 
		 port7 => port7, 
		 port8 => port8, 
		 port9 => port9, 
		 port10 => port10, 
		 port11 => port11, 
		 port12 => port12, 
		 port13 => port13, 
		 port14 => port14,
		 port15 => port15, 
		 port16 => port16

	);

	u4: entity ID_EX_Reg port map(
		rs_val => rs_val, 
		rt_val => rt_val, 
		opcode => opcode_if_id, 
		rs => rs_if_id, 
		rt => rt_if_id, 
		rd=> rd_if_id, 
		writeEn=>writeEn, 
		clk=>clk, 
		rs_val_out =>  rs_val_id_ex, 
		rt_val_out=>  rt_val_id_ex,
		opcode_out => opcode_id_ex, 
		rt_out => rt_id_ex,
		rs_out => rs_id_ex,
		rd_out=>rd_id_ex
	);



	u5: entity ALU port map(
		a_in=> rs_val_id_ex, 
		b_in=> rt_val_id_ex, 
		opcode => opcode_id_ex, 
		result => ALU_result,

		rs => rs_id_ex,
		rt=>rt_id_ex
	);
	
end structural;