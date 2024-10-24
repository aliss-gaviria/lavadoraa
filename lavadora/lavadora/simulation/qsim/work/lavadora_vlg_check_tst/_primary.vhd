library verilog;
use verilog.vl_types.all;
entity lavadora_vlg_check_tst is
    port(
        alarma          : in     vl_logic;
        fin             : in     vl_logic;
        giro_bcd        : in     vl_logic_vector(6 downto 0);
        leds            : in     vl_logic;
        llenado         : in     vl_logic;
        tiempo_faltante1: in     vl_logic_vector(6 downto 0);
        tiempo_faltante2: in     vl_logic_vector(6 downto 0);
        vaciado         : in     vl_logic;
        velocidad_bcd   : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end lavadora_vlg_check_tst;
