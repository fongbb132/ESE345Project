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
    clk         : in  std_logic
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
  end process;
end behavioral;