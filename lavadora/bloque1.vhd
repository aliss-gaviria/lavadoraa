library ieee;
use ieee.std_logic_1164.all;

entity bloque1 is
	
	port
	(
		-- Input ports
		reloj: in std_logic;
		

		-- Output ports
		uni,dece	: out std_logic_vector(6 downto 0)
		
	);
end bloque1;



architecture arch_bloque1 of bloque1 is
signal cen:std_logic_vector( 6 downto 0);
signal reset, enable : std_logic := '1';   -- Declaración de reset y enable
signal clk : std_logic;  -- Señal de reloj interna
signal out1,out2: std_logic;
signal unidades, decenas:std_logic_vector(6 downto 0);

component divisorfrecuencia
	port
	(
		-- Input ports
	clk: in  std_logic;
		
		-- Output ports
		out1, out2	: buffer std_logic
	);

end component;

component contador

	port
	(
		clk : IN std_logic;
        reset : IN std_logic;
        enable: IN std_logic;
        count : OUT std_logic_vector(6 DOWNTO 0)
	);

end component;


component separador

	

	port
	(
			-- Input ports
	en	: in  std_logic_vector(6 downto 0);
		

		-- Output ports
		unidades,decenas	: out std_logic_vector(6 downto 0)
	);

end component;


component decobcda7segmentos

	port
	(
		-- Input ports
	A,B,C,D	: in  std_logic;
		-- Output ports
		S : out std_logic_vector(  6 downto 0 )
	);

end component;
	

begin
clk<= reloj;
u_d: divisorfrecuencia port map(clk=>reloj, out1=>out1, out2=>out2);
u_c: contador port map( clk=>out1, reset=>reset, enable=>enable, count=>cen);
u_s: separador port map(en=>cen, decenas=>decenas, unidades=>unidades );
u_deco_uni: decobcda7segmentos port map(A=>unidades(3),B=> unidades(2),C=>unidades(1),D=>unidades(0), S=>uni);
u_deco_dece: decobcda7segmentos port map(A=>decenas(3),B=> decenas(2),C=>decenas(1),D=>decenas(0), S=>dece);

	

end arch_bloque1;
