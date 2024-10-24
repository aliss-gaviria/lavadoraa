library ieee;
use  ieee.std_logic_1164.all;
entity divisorfrecuencia is
	port
	(
		-- Input ports
	clk: in  std_logic;
		
		-- Output ports
		out1, out2	: buffer std_logic
		
	);
end divisorfrecuencia;

architecture arch_divisorfrecuencia of divisorfrecuencia is
signal count1 : integer range 0 to 25000000;

begin
process( clk) is 
	 variable count2: integer range 0 to 25000000;
	begin 
		if( clk' event and clk = '1') then
			count1<= count1 +1;
			count2:= count2 +1;
		if(count1 = 25000000-1 ) then
		out1 <= not out1;
		count1<= 0;
		end if;
		if( count2 = 25000000)then
		out2<= not out2;
		count2:= 0;
		end if;
	end if;
	
	end process; 


end arch_divisorfrecuencia;
