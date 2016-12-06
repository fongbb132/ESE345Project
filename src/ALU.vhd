																
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is 
	port(a_in,b_in: in std_logic_vector(63 downto 0);		
	opcode: in std_logic_vector(3 downto 0);
	result: out std_logic_vector(63 downto 0);
	rt,rs: in std_logic_vector(3 downto 0)
	);
end ALU;

architecture structural of ALU is	   	
	signal port1, port2,port3, port4,port5, port6,port7, port8,port9, port10,port11, port12,port13, port14,port15,port16: std_logic_vector(63 downto 0);
begin				   
	
	u0:entity mux16to1 port map(port16=>port16, port2=>port2,port3=>port3, port4=>port4,port5=>port5, port6=>port6,port7=>port7, port8=>port8,port9=>port9, port10=>port10,
		port11=>port11, port12=>port12,port13=>port13, port14=>port14,port15=>port15,	rt=> rt	  ,rs=>rs, 
		opcode => opcode, output=>result);				
	
	u1:entity and64 port map(i1=>a_in, 
	i2=>b_in, 
	o1=>port3);	
	
	u2:entity or64 port map(i1=>a_in, 
	i2=>b_in, 
	o1=>port4);		   
	
	u3:entity cnth port map(i1=>a_in, 
	
	o1=>port5);
	
	
	u4:entity clz port map(i1=>a_in, 
	
	o1=>port6);	 
	
	
	
	u5:entity rot port map(i1=>a_in, 
	i2=>b_in, 
	o1=>port7);	
	
	u6:entity shlhi port map(i1=>a_in, 
	i2=>b_in, 
	o1=>port8);
	
	
	u7:entity a port map(i1=>a_in, 
	i2=>b_in, 
	o1=>port9);	 
	
	
	
	u8:entity sfw port map(i1=>a_in, 
	i2=>b_in, 
	o1=>port10);	
	
	u9:entity ah port map(i1=>a_in, 
	i2=>b_in, 
	o1=>port11);
	
	
	u10:entity sfh port map(i1=>a_in, 
	i2=>b_in, 
	o1=>port12);	 
	
	
	
	u11:entity ahs port map(i1=>a_in, 
	i2=>b_in, 
	o1=>port13);	
	
	u12:entity sfhs port map(i1=>a_in, 
	i2=>b_in, 
	o1=>port14);
	
	
	u13:entity mpyu port map(i1=>a_in, 
	i2=>b_in, 
	o1=>port15);	 
	
	
	
	u14:entity absdb port map(i1=>a_in, 
	i2=>b_in, 
	o1=>port16);	
end structural;


