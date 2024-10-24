library verilog;
use verilog.vl_types.all;
entity lavadora_vlg_sample_tst is
    port(
        cerrado         : in     vl_logic;
        encendida       : in     vl_logic;
        lleno           : in     vl_logic;
        reloj           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end lavadora_vlg_sample_tst;
