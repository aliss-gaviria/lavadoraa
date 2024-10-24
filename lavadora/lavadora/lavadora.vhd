library ieee;
use ieee.std_logic_1164.all;
entity lavadora is
port (
        encendida, lleno, cerrado, reloj: in std_logic;
        llenado : out std_logic;          
        vaciado : out std_logic;     
        tiempo_faltante1,tiempo_faltante2: out std_logic_vector (6 downto 0);
        giro_bcd : out std_logic_vector(6 downto 0); 
        velocidad_bcd : out std_logic_vector(6 downto 0); 
		  alarma: out std_logic ; 
		  fin,leds: out std_logic  
);
end lavadora;

architecture arch_lavadora of lavadora is

component load
    Port ( clk : in STD_LOGIC;         
           reset : in STD_LOGIC; 
           load : in STD_LOGIC;			  
           pulse_out : out STD_LOGIC);  
end component;
component decobcdvelocidad 
	port
	(
		-- Input ports
		V	: in std_logic_vector(2 downto 0);
		-- Output ports
		s : out std_logic_vector(  6 downto 0 )
	
	);
end component;
component divisorfrecuencia 
	port
	(
		-- Input ports
	clk: in  std_logic;
		
		-- Output ports
		out1, out2	: buffer std_logic
		
	);
end component;
component bloque1 
    port (
        -- Input ports
        reloj, enable, reset,load,encendida: in std_logic;
        count_in: in integer range 0 to 99;
        -- Output ports
        uni, dece: out std_logic_vector(6 downto 0);
        finalizado: out std_logic
    );
end component;
component ciclo_operacion
    Port (       
        encendido : in std_logic;     
        ciclo_oper:in integer range 0 to 14;		 
        llenado : out std_logic;         
        vaciado : out std_logic;       
        giro : out std_logic_vector(2 downto 0); 
        velocidad : out std_logic_vector(2 downto 0); 
		  load: out std_logic;
		  alarma: out std_logic;
        cout : out integer range 0 to 99      
        
        		  
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
component ciclo_oper 
port(
    finalizado: in std_logic;
	 ciclo: out integer range 0 to 14
);
end component;
component encendido  
port (
onn, full, openn: in std_logic;
encendida: out std_logic);
end component;

signal ciclo0: std_logic;
signal ciclo1: integer range 0 to 15;
signal load_cont: std_logic;
signal load_ciclo: std_logic;
signal carga_load: std_logic;
signal contador: integer range 0 to 99;
signal enc: std_logic;
signal v0,v1: std_logic_vector(2 downto 0);
signal s0,s1: std_logic_vector (6 downto 0);
signal outt: std_logic;

signal enc1:std_logic;
begin 

U0: encendido port map (encendida, lleno, cerrado, enc);
U2: ciclo_oper port map (ciclo0,ciclo1);
U4: decobcdvelocidad port map(v0,giro_bcd);
U5: decobcdvelocidad port map(v1,velocidad_bcd);
U1: ciclo_operacion port map (encendido=>enc, ciclo_oper=>ciclo1, llenado=>llenado, vaciado=> vaciado, giro=>v0, velocidad=>v1,load=>load_ciclo, alarma=>alarma, cout=>contador);
U3: bloque1 port map (reloj, cerrado,'1', load_cont,enc1,contador, tiempo_faltante1, tiempo_faltante2,ciclo0);
U6: load port map (clk=>reloj,reset=>'0',load=>load_ciclo, pulse_out=>load_cont);
U7: divisorfrecuencia port map (reloj, outt,open);

end arch_lavadora;