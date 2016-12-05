-------------------------------------------------------------------------------
--
-- Title       : test_bench_full_adder
-- Design      : add
-- Author      : fong
-- Company     : fong
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345Project\src\test_bench_full_adder.vhd
-- Generated   : Thu Nov 17 12:47:50 2016
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {test_bench_full_adder} architecture {test_bench_full_adder}}
 library ieee;		   
use ieee.std_logic_1164.all;	
use ieee.numeric_std.all;

entity testbench is		   
end testbench;

architecture behavior of testbench is  
-- Declare signals to assign values to and to observe	   
	signal a_tb, b_tb, carry_in_tb, sum_tb, carry_out_tb: std_logic; 
	begin												
	-- Create an instance of the circuit to be tested	
	uut: entity full_adder port map(a => a_tb, b => b_tb,carry_in=>carry_in_tb, 
		sum => sum_tb,carry_out=>carry_out_tb );		 
	-- Define a process to apply input stimulus and test outputs 
	tb : process												 
		constant period: time := 20 ns;								
		constant n: integer := 3;								   
		begin -- Apply every possible input combination			   
		for i in 0 to 2**n - 1 loop								   
			(a_tb, b_tb,carry_in_tb) <= to_unsigned(i,n);					  
			wait for period;										   
		end loop;													  
		wait; -- indefinitely suspend process						   
	end process;

end;
