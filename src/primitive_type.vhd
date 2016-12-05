-------------------------------------------------------------------------------
--
-- Title       : primitive_type
-- Design      : add
-- Author      : fong
-- Company     : fong
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE345Project\src\primitive_type.vhd
-- Generated   : Thu Nov 17 12:41:31 2016
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
--{entity {primitive_type} architecture {primitive_type}}
							  					   
library ieee;  
use ieee.std_logic_1164.all;

entity inv is
	port(i:in std_logic;
	o: out std_logic);
end inv;		


architecture dataflow of inv is
begin
	o <= not i;
end dataflow;  


library ieee;  
use ieee.std_logic_1164.all;
		   
entity and_2 is
	port(i1, i2:in std_logic;
	o1: out std_logic);
end and_2;	

architecture dataflow of and_2 is
begin
	o1 <= i1 and i2;
end dataflow; 


library ieee;  
use ieee.std_logic_1164.all;
				 

entity or_2 is
	port(i1, i2:in std_logic;
	o1: out std_logic);
end or_2;
					  

architecture dataflow of or_2 is   
begin
	o1 <= i1 or i2;
end dataflow;