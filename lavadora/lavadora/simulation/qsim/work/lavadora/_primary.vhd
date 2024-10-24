library verilog;
use verilog.vl_types.all;
entity lavadora is
    port(
        encendida       : in     vl_logic;
        lleno           : in     vl_logic;
        cerrado         : in     vl_logic;
        reloj           : in     vl_logic;
        llenado         : out    vl_logic;
        vaciado         : out    vl_logic;
        tiempo_faltante1: out    vl_logic_vector(6 downto 0);
        tiempo_faltante2: out    vl_logic_vector(6 downto 0);
        giro_bcd        : out    vl_logic_vector(6 downto 0);
        velocidad_bcd   : out    vl_logic_vector(6 downto 0);
        alarma          : out    vl_logic;
        fin             : out    vl_logic;
        leds            : out    vl_logic
    );
end lavadora;
