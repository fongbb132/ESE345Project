-------------------------------------------------------------------------------
--
-- Title       : xor_2
-- Design      : add
-- Author      : fong
-- Company     : fong
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345Project\src\xor_2.vhd
-- Generated   : Thu Nov 17 12:32:45 2016
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
--{entity {xor_2} architecture {xor_2}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity xor_2 is
	 port(
		 i1 : in STD_LOGIC;
		 i2 : in STD_LOGIC;
		 o1 : out STD_LOGIC
	     );
end xor_2;
	 	
architecture xor_2 of xor_2 is
	 					  			  					  
begin	
	o1<=i1 xor i2; 
		
end xor_2;			 
							