library ieee;
use ieee.std_logic_1164.all;
use  ieee.numeric_std.all;

entity separador is

	port
	(
		-- Input ports
	en	: in  std_logic_vector(6 downto 0);
		

		-- Output ports
		unidades,decenas	: out std_logic_vector(6 downto 0)


	);
end separador;

architecture arch_separador of separador is

signal e : UNSIGNED(6 DOWNTO 0);

begin
e<= unsigned(en);
unidades<=  std_logic_vector( e mod 10);
decenas<=  std_logic_vector( e / 10);

end arch_separador;
