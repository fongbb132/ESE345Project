library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_file is
  port(
    rs        : out std_logic_vector(63 downto 0);
    rt        : out std_logic_vector(63 downto 0);
    rd       : in  std_logic_vector(63 downto 0);
    writeEnable : in  std_logic;
    regASel     : in  std_logic_vector(3 downto 0);
    regBSel     : in  std_logic_vector(3 downto 0);
    writeRegSel : in  std_logic_vector(3 downto 0);
    clk         : in  std_logic;
	
	port1, port2, port3, port4, port5, port6, port7, port8, port9, port10, port11, port12, port13, port14, port15, port16: out std_logic_vector(63 downto 0) 

    );
end register_file;


architecture behavioral of register_file is
  type registerFile is array(15 downto 0) of std_logic_vector(63 downto 0);
  signal registers : registerFile;
begin
  regFile : process (clk) is
  begin
    if rising_edge(clk) then
      rs <= registers(to_integer(unsigned(regASel)));
      rt <= registers(to_integer(unsigned(regBSel)));
      if writeEnable = '1' then
        registers(to_integer(unsigned(writeRegSel))) <= rd;  
        if regASel = writeRegSel then  
          rs <= rd;
        end if;
        if regBSel = writeRegSel then 
          rt <= rd;
        end if;
      end if;
    end if;		  	  							 
	
	port1<=registers(0);
	port2<=registers(1);
	port3<=registers(2);
	port4<=registers(3);
	port5<=registers(4);
	port6<=registers(5);
	port7<=registers(6);
	port8<=registers(7);
	port9<=registers(8);
	port10<=registers(9);
	port11<=registers(10);
	port12<=registers(11);
	port13<=registers(12);
	port14<=registers(13);
	port15<=registers(14);
	port16<=registers(15);
	
  end process;
end behavioral;