library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 

entity load is
    Port ( clk : in STD_LOGIC;         
           reset : in STD_LOGIC; 
           load : in STD_LOGIC;			  
           pulse_out : out STD_LOGIC);  
end load;

architecture arch of load is
    type state_type is (IDLE, PULSE_ON, PULSE_OFF, FIN);
    signal estando_actual, estado_siguiente : state_type;
    signal counter : integer := 0;        
    constant duracion : integer := 25000000; 
begin

  
    process(clk, reset)
    begin
        if reset = '1' then
            estando_actual <= IDLE;
            counter <= 0;
        elsif rising_edge(clk) then
            estando_actual <= estado_siguiente;

            if estando_actual = PULSE_ON then
                counter <= counter + 1;
            else
                counter <= 0; 
            end if;
        end if;
    end process;

    process(estando_actual, load, counter)
    begin
        case estando_actual is
            when IDLE => 
                if load = '1' then
                    estado_siguiente <= PULSE_ON;
                else
                    estado_siguiente <= IDLE;	
                end if;

            when PULSE_ON =>
                if counter >= duracion then
                    estado_siguiente <= PULSE_OFF; 
                else
                    estado_siguiente <= PULSE_ON; 
                end if;

            when PULSE_OFF =>
                if load='1' then
				estado_siguiente<= FIN;
				else 
				estado_siguiente<=IDLE;
				end if;
			 when FIN=>
			   if load='1' then
				estado_siguiente<= FIN;
				else 
				estado_siguiente<=IDLE;
				end if;
            
            when others =>
                estado_siguiente <= IDLE; 
        end case;
    end process;

    process(estando_actual, counter)
    begin
        case estando_actual is
            when IDLE =>
                pulse_out <= '0';
                
            when PULSE_ON =>
                if counter < duracion then
                    pulse_out <= '1'; 
                else
                    pulse_out <= '0';  
                end if;
				when FIN =>
					 pulse_out<='0';

            when others =>
                pulse_out <= '0'; 
        end case;
    end process;

end arch;




