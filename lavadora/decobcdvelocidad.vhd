library ieee;
use ieee.std_logic_1164.all;
entity decobcdvelocidad is
	port
	(
		-- Input ports
		V	: in std_logic_vector(2 downto 0);
		-- Output ports
		s : out std_logic_vector(  6 downto 0 )
	
	);
end decobcdvelocidad;

architecture arch_decobcdvelocidad of decobcdvelocidad is

begin
with  V select
S<=  "1000010"	when "000",
"1111001" when "001",
"1110001" when "010",
"1001000" when "011",
"1111111" when others;

end arch_decobcdvelocidad;
