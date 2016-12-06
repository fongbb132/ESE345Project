																														   																
library ieee;
use ieee.std_logic_1164.all;
use work.instruction_buffer_type.all;			 		 
use ieee.numeric_std.all;
									 

architecture tb of testbench is
	constant period : time := 50ns;
	type regfile_content is array (0 to 15) of std_logic_vector(63 downto 0);

	constant reg_content1 : regfile_content := (
	"1111111111111111111111111111111111111111111111110110101001100000",
	"UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU",
	"UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU",
	"0000000000000000000000000000000000000000000000000000000000000000",
	"0100011111001100000011011101110000111001100100011001100010100110",
	"UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU",
	"UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU",
	"UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU",
	"1111111111111111111111111111111111111111111111110110101001100000",
	"1111111111111111111111111111111111111111111111111101010011000000",
	"0000000000000000000000000000000000000000000000000000000000000000",
	"1001110110011010011010111101111110001001111010100000001100000110",
	"0000000000000000000000000000000000000000000000000000000000000000",
	"UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU",
	"1011100000110011111100100010010011000110011011100110011101011010",
	"1010101000110010101000100000001110110000010110000110101001100000");


	signal inst_addr: std_logic_vector(3 downto 0); 
	signal clk: std_logic; 
	signal port1, port2,port3, port4,port5, port6,port7, port8,port9, port10,port11, port12,port13, port14,port15, port16: std_logic_vector(63 downto 0); 

	signal buffer_in: instructionBuffer; 

begin	
	
	u1:entity pipelinedUnit port map(
		buffer_in=>buffer_in, 
		inst_addr=> inst_addr, 
		clk=>clk, 
		port1=>port1,
		port2=>port2,
		port3=>port3,
		port4=>port4,
		port5=>port5,
		port6=>port6,
		port7=>port7,
		port8=>port8,
		port9=>port9,
		port10=>port10,
		port11=>port11,
		port12=>port12,
		port13=>port13,
		port14=>port14,
		port15=>port15,
		port16=>port16
	);						  
	process
	begin
		
	buffer_in(0)<="0001001000001011";                                                                                     
	buffer_in(1)<="0001000110001010";                                                                                     
	buffer_in(2)<="1000101010111110";                                                                                     
	buffer_in(3)<="1010111010100000";                                                                                     
	buffer_in(4)<="1111111010111001";                                                                                     
	buffer_in(5)<="1001101000001011";                                                                                     
	buffer_in(6)<="1011101010101010";                                                                                     
	buffer_in(7)<="0100100110101100";                                                                                     
	buffer_in(8)<="1001000010101011";                                                                                     
	buffer_in(9)<="1100111010110000";                                                                                     
	buffer_in(10)<="1001111010100100";                                                                                    
	buffer_in(11)<="1000110010100011";                                                                                    
	buffer_in(12)<="0010100110011111";                                                                                    
	buffer_in(13)<="1100100111111001";                                                                                    
	buffer_in(14)<="1001101000001000";                                                                                    
	buffer_in(15)<="0000000000000000";
	
	
	for i in 0 to 15 loop
		  inst_addr	   <= std_logic_vector(to_unsigned(i, 4));
		  clk<='1';
		  wait for period/2;
		  
		  clk<='0';
		  wait for period/2;
	end loop; 
	end process; 
end tb;