-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "10/21/2024 15:08:32"

-- 
-- Device: Altera EP3C16F484C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	lavadora IS
    PORT (
	encendida : IN std_logic;
	lleno : IN std_logic;
	cerrado : IN std_logic;
	reloj : IN std_logic;
	llenado : OUT std_logic;
	vaciado : OUT std_logic;
	tiempo_faltante1 : OUT std_logic_vector(6 DOWNTO 0);
	tiempo_faltante2 : OUT std_logic_vector(6 DOWNTO 0);
	giro_bcd : OUT std_logic_vector(6 DOWNTO 0);
	velocidad_bcd : OUT std_logic_vector(6 DOWNTO 0);
	alarma : OUT std_logic
	);
END lavadora;

-- Design Ports Information
-- encendida	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lleno	=>  Location: PIN_H5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cerrado	=>  Location: PIN_H6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- llenado	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vaciado	=>  Location: PIN_J2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tiempo_faltante1[0]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tiempo_faltante1[1]	=>  Location: PIN_F12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tiempo_faltante1[2]	=>  Location: PIN_G12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tiempo_faltante1[3]	=>  Location: PIN_H13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tiempo_faltante1[4]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tiempo_faltante1[5]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tiempo_faltante1[6]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tiempo_faltante2[0]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tiempo_faltante2[1]	=>  Location: PIN_E14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tiempo_faltante2[2]	=>  Location: PIN_B14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tiempo_faltante2[3]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tiempo_faltante2[4]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tiempo_faltante2[5]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tiempo_faltante2[6]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- giro_bcd[0]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- giro_bcd[1]	=>  Location: PIN_B17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- giro_bcd[2]	=>  Location: PIN_A17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- giro_bcd[3]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- giro_bcd[4]	=>  Location: PIN_B16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- giro_bcd[5]	=>  Location: PIN_A16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- giro_bcd[6]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- velocidad_bcd[0]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- velocidad_bcd[1]	=>  Location: PIN_D19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- velocidad_bcd[2]	=>  Location: PIN_C19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- velocidad_bcd[3]	=>  Location: PIN_B19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- velocidad_bcd[4]	=>  Location: PIN_A19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- velocidad_bcd[5]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- velocidad_bcd[6]	=>  Location: PIN_B18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- alarma	=>  Location: PIN_J3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reloj	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF lavadora IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_encendida : std_logic;
SIGNAL ww_lleno : std_logic;
SIGNAL ww_cerrado : std_logic;
SIGNAL ww_reloj : std_logic;
SIGNAL ww_llenado : std_logic;
SIGNAL ww_vaciado : std_logic;
SIGNAL ww_tiempo_faltante1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_tiempo_faltante2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_giro_bcd : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_velocidad_bcd : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_alarma : std_logic;
SIGNAL \encendida~input_o\ : std_logic;
SIGNAL \lleno~input_o\ : std_logic;
SIGNAL \cerrado~input_o\ : std_logic;
SIGNAL \reloj~input_o\ : std_logic;
SIGNAL \llenado~output_o\ : std_logic;
SIGNAL \vaciado~output_o\ : std_logic;
SIGNAL \tiempo_faltante1[0]~output_o\ : std_logic;
SIGNAL \tiempo_faltante1[1]~output_o\ : std_logic;
SIGNAL \tiempo_faltante1[2]~output_o\ : std_logic;
SIGNAL \tiempo_faltante1[3]~output_o\ : std_logic;
SIGNAL \tiempo_faltante1[4]~output_o\ : std_logic;
SIGNAL \tiempo_faltante1[5]~output_o\ : std_logic;
SIGNAL \tiempo_faltante1[6]~output_o\ : std_logic;
SIGNAL \tiempo_faltante2[0]~output_o\ : std_logic;
SIGNAL \tiempo_faltante2[1]~output_o\ : std_logic;
SIGNAL \tiempo_faltante2[2]~output_o\ : std_logic;
SIGNAL \tiempo_faltante2[3]~output_o\ : std_logic;
SIGNAL \tiempo_faltante2[4]~output_o\ : std_logic;
SIGNAL \tiempo_faltante2[5]~output_o\ : std_logic;
SIGNAL \tiempo_faltante2[6]~output_o\ : std_logic;
SIGNAL \giro_bcd[0]~output_o\ : std_logic;
SIGNAL \giro_bcd[1]~output_o\ : std_logic;
SIGNAL \giro_bcd[2]~output_o\ : std_logic;
SIGNAL \giro_bcd[3]~output_o\ : std_logic;
SIGNAL \giro_bcd[4]~output_o\ : std_logic;
SIGNAL \giro_bcd[5]~output_o\ : std_logic;
SIGNAL \giro_bcd[6]~output_o\ : std_logic;
SIGNAL \velocidad_bcd[0]~output_o\ : std_logic;
SIGNAL \velocidad_bcd[1]~output_o\ : std_logic;
SIGNAL \velocidad_bcd[2]~output_o\ : std_logic;
SIGNAL \velocidad_bcd[3]~output_o\ : std_logic;
SIGNAL \velocidad_bcd[4]~output_o\ : std_logic;
SIGNAL \velocidad_bcd[5]~output_o\ : std_logic;
SIGNAL \velocidad_bcd[6]~output_o\ : std_logic;
SIGNAL \alarma~output_o\ : std_logic;

BEGIN

ww_encendida <= encendida;
ww_lleno <= lleno;
ww_cerrado <= cerrado;
ww_reloj <= reloj;
llenado <= ww_llenado;
vaciado <= ww_vaciado;
tiempo_faltante1 <= ww_tiempo_faltante1;
tiempo_faltante2 <= ww_tiempo_faltante2;
giro_bcd <= ww_giro_bcd;
velocidad_bcd <= ww_velocidad_bcd;
alarma <= ww_alarma;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X0_Y20_N9
\llenado~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \llenado~output_o\);

-- Location: IOOBUF_X0_Y20_N2
\vaciado~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \vaciado~output_o\);

-- Location: IOOBUF_X26_Y29_N16
\tiempo_faltante1[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \tiempo_faltante1[0]~output_o\);

-- Location: IOOBUF_X28_Y29_N23
\tiempo_faltante1[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \tiempo_faltante1[1]~output_o\);

-- Location: IOOBUF_X26_Y29_N9
\tiempo_faltante1[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \tiempo_faltante1[2]~output_o\);

-- Location: IOOBUF_X28_Y29_N30
\tiempo_faltante1[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \tiempo_faltante1[3]~output_o\);

-- Location: IOOBUF_X26_Y29_N2
\tiempo_faltante1[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \tiempo_faltante1[4]~output_o\);

-- Location: IOOBUF_X21_Y29_N30
\tiempo_faltante1[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \tiempo_faltante1[5]~output_o\);

-- Location: IOOBUF_X21_Y29_N23
\tiempo_faltante1[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \tiempo_faltante1[6]~output_o\);

-- Location: IOOBUF_X26_Y29_N23
\tiempo_faltante2[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \tiempo_faltante2[0]~output_o\);

-- Location: IOOBUF_X28_Y29_N16
\tiempo_faltante2[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \tiempo_faltante2[1]~output_o\);

-- Location: IOOBUF_X23_Y29_N30
\tiempo_faltante2[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \tiempo_faltante2[2]~output_o\);

-- Location: IOOBUF_X23_Y29_N23
\tiempo_faltante2[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \tiempo_faltante2[3]~output_o\);

-- Location: IOOBUF_X23_Y29_N2
\tiempo_faltante2[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \tiempo_faltante2[4]~output_o\);

-- Location: IOOBUF_X21_Y29_N9
\tiempo_faltante2[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \tiempo_faltante2[5]~output_o\);

-- Location: IOOBUF_X21_Y29_N2
\tiempo_faltante2[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \tiempo_faltante2[6]~output_o\);

-- Location: IOOBUF_X37_Y29_N2
\giro_bcd[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \giro_bcd[0]~output_o\);

-- Location: IOOBUF_X30_Y29_N23
\giro_bcd[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \giro_bcd[1]~output_o\);

-- Location: IOOBUF_X30_Y29_N16
\giro_bcd[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \giro_bcd[2]~output_o\);

-- Location: IOOBUF_X30_Y29_N2
\giro_bcd[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \giro_bcd[3]~output_o\);

-- Location: IOOBUF_X28_Y29_N2
\giro_bcd[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \giro_bcd[4]~output_o\);

-- Location: IOOBUF_X30_Y29_N30
\giro_bcd[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \giro_bcd[5]~output_o\);

-- Location: IOOBUF_X32_Y29_N30
\giro_bcd[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \giro_bcd[6]~output_o\);

-- Location: IOOBUF_X39_Y29_N30
\velocidad_bcd[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \velocidad_bcd[0]~output_o\);

-- Location: IOOBUF_X37_Y29_N30
\velocidad_bcd[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \velocidad_bcd[1]~output_o\);

-- Location: IOOBUF_X37_Y29_N23
\velocidad_bcd[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \velocidad_bcd[2]~output_o\);

-- Location: IOOBUF_X32_Y29_N2
\velocidad_bcd[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \velocidad_bcd[3]~output_o\);

-- Location: IOOBUF_X32_Y29_N9
\velocidad_bcd[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \velocidad_bcd[4]~output_o\);

-- Location: IOOBUF_X39_Y29_N16
\velocidad_bcd[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \velocidad_bcd[5]~output_o\);

-- Location: IOOBUF_X32_Y29_N23
\velocidad_bcd[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \velocidad_bcd[6]~output_o\);

-- Location: IOOBUF_X0_Y21_N23
\alarma~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \alarma~output_o\);

-- Location: IOIBUF_X0_Y24_N1
\encendida~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_encendida,
	o => \encendida~input_o\);

-- Location: IOIBUF_X0_Y27_N1
\lleno~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_lleno,
	o => \lleno~input_o\);

-- Location: IOIBUF_X0_Y25_N22
\cerrado~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cerrado,
	o => \cerrado~input_o\);

-- Location: IOIBUF_X41_Y15_N1
\reloj~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reloj,
	o => \reloj~input_o\);

ww_llenado <= \llenado~output_o\;

ww_vaciado <= \vaciado~output_o\;

ww_tiempo_faltante1(0) <= \tiempo_faltante1[0]~output_o\;

ww_tiempo_faltante1(1) <= \tiempo_faltante1[1]~output_o\;

ww_tiempo_faltante1(2) <= \tiempo_faltante1[2]~output_o\;

ww_tiempo_faltante1(3) <= \tiempo_faltante1[3]~output_o\;

ww_tiempo_faltante1(4) <= \tiempo_faltante1[4]~output_o\;

ww_tiempo_faltante1(5) <= \tiempo_faltante1[5]~output_o\;

ww_tiempo_faltante1(6) <= \tiempo_faltante1[6]~output_o\;

ww_tiempo_faltante2(0) <= \tiempo_faltante2[0]~output_o\;

ww_tiempo_faltante2(1) <= \tiempo_faltante2[1]~output_o\;

ww_tiempo_faltante2(2) <= \tiempo_faltante2[2]~output_o\;

ww_tiempo_faltante2(3) <= \tiempo_faltante2[3]~output_o\;

ww_tiempo_faltante2(4) <= \tiempo_faltante2[4]~output_o\;

ww_tiempo_faltante2(5) <= \tiempo_faltante2[5]~output_o\;

ww_tiempo_faltante2(6) <= \tiempo_faltante2[6]~output_o\;

ww_giro_bcd(0) <= \giro_bcd[0]~output_o\;

ww_giro_bcd(1) <= \giro_bcd[1]~output_o\;

ww_giro_bcd(2) <= \giro_bcd[2]~output_o\;

ww_giro_bcd(3) <= \giro_bcd[3]~output_o\;

ww_giro_bcd(4) <= \giro_bcd[4]~output_o\;

ww_giro_bcd(5) <= \giro_bcd[5]~output_o\;

ww_giro_bcd(6) <= \giro_bcd[6]~output_o\;

ww_velocidad_bcd(0) <= \velocidad_bcd[0]~output_o\;

ww_velocidad_bcd(1) <= \velocidad_bcd[1]~output_o\;

ww_velocidad_bcd(2) <= \velocidad_bcd[2]~output_o\;

ww_velocidad_bcd(3) <= \velocidad_bcd[3]~output_o\;

ww_velocidad_bcd(4) <= \velocidad_bcd[4]~output_o\;

ww_velocidad_bcd(5) <= \velocidad_bcd[5]~output_o\;

ww_velocidad_bcd(6) <= \velocidad_bcd[6]~output_o\;

ww_alarma <= \alarma~output_o\;
END structure;


