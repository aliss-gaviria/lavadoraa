library ieee;
use ieee.std_logic_1164.all;
entity encendido is 
port (
onn, full, openn: in std_logic;
encendida: out std_logic);
end encendido;
architecture arch_encendido of encendido is
signal enc: std_logic_vector(2 downto 0);

begin
enc<= onn & full & openn; 
inicial: process (onn,full,openn)
begin 
case enc is 
when "111" =>
                encendida<= '1';
when others =>
                encendida <= '0';
end case;
end process;
end arch_encendido;