LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY contador_lavadora IS
    PORT (
        clk       : IN std_logic;          
        reset     : IN std_logic;          
        enable    : IN std_logic;          
        load      : IN std_logic;          
        count_in  : IN integer range 0 to 99;  
        encendida  : IN std_logic;          
        count     : OUT std_logic_vector(6 DOWNTO 0);  
        finalizado : OUT std_logic          
    );
END contador_lavadora;

ARCHITECTURE arch1 OF contador_lavadora IS
    SIGNAL cnt : integer range 0 to 99;   
    SIGNAL proceso_habilitado : std_logic := '0'; 
BEGIN
    counter : PROCESS (clk, reset) IS
    BEGIN
        if (reset = '0') THEN
            cnt <= 99;                      
            proceso_habilitado <= '0';      
        elsif (clk'event AND clk = '1') THEN
            if (encendida = '1') THEN          
                if (load = '1') THEN
                    cnt <= count_in;          
                    proceso_habilitado <= '0'; 
                elsif (enable = '1') THEN
                    if (cnt = 0) THEN
                        proceso_habilitado <= '1';  
                    else
                        cnt <= cnt - 1;          
                        proceso_habilitado <= '0'; 
                    end if;
                end if;
            end if;
        end if;
    END PROCESS;

    finalizado <= proceso_habilitado;           
    count <= std_logic_vector(to_unsigned(cnt, 7)); 

END arch1;

