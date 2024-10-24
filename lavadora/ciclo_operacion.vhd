library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ciclo_operacion is
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
end ciclo_operacion;

architecture arch_ciclo_operacion of ciclo_operacion is
    
begin
ciclo_operacion: process(ciclo_oper, encendido)
begin
if          encendido = '0' then
            cout <= 0;
            llenado <= '0';
            vaciado <= '0';
            giro <= "111"; 
            velocidad <= "111"; 
				alarma<='0';
				load<='0';
				
        else
            case ciclo_oper is 
				    when 0=>
				
                    cout <= 30;
                    llenado <= '1';
                    vaciado <= '0';
                    giro <= "111"; --nada
                    velocidad <= "111"; --nada
						  alarma<='0';
						  load<='1';
						 
                when 1 =>
					 --llenado
                    cout <= 0;
                    llenado <= '0';
                    vaciado <= '0';
                    giro <= "111"; --nada
                    velocidad <= "111"; --nada
						  alarma<='0';
						  load<='0';
						 
					when 2=>
				
                    cout <= 45;
                    llenado <= '0';
                    vaciado <= '0';
                    giro <= "000"; --nada
                    velocidad <= "010"; --nada
						  alarma<='0';
						  load<='1';
				
               when 3 =>
					 --lavado
                    cout <= 0;
                    giro <= "111"; --derecha
                    velocidad <= "111"; --lenta
                    llenado <= '0';
                    vaciado <= '0';
						  alarma<='0';
						  load<='0';
				  when 4=>
				
                    cout <= 45;
                    llenado <= '0';
                    vaciado <= '0';
                    giro <= "001"; --nada
                    velocidad <= "010"; --nada
						  alarma<='0';
						  load<='1';
                when 5 =>
					 --lavado
                    cout <= 0;
                    giro <= "111"; --izquierda
                    velocidad <= "111"; --lenta
                    llenado <= '0';
                    vaciado <= '0';
						  alarma<='0';
						  load<='0';
						  
					 when 6=>
				
                    cout <= 45;
                    llenado <= '0';
                    vaciado <= '1';
                    giro <= "111"; --nada
                    velocidad <= "111"; --nada
						  alarma<='0';
						  load<='1';
					
                when 7 =>
					 --vaciado
                    cout <= 0;
                    vaciado <= '0';
                    llenado <= '0';
                    giro <= "111"; --nada
                    velocidad <= "111"; 
						  alarma<='0';
						  load<='0';
						  
						  when 8=>
				
                    cout <= 30;
                    llenado <= '0';
                    vaciado <= '0';
                    giro <= "000"; --nada
                    velocidad <= "010"; --nada
						  alarma<='0';
						  load<='1';
					
                when 9 =>
					 --enjuagar
                    cout <= 0;
                    giro <= "111"; --derecha
                    velocidad <= "111"; --lenta
                    llenado <= '0';
                    vaciado <= '0';
						  alarma<='0';
						  load<='0';
						  
					 when 10=>
				
                    cout <= 30;
                    llenado <= '0';
                    vaciado <= '0';
                    giro <= "001"; --nada
                    velocidad <= "010"; --nada
						  alarma<='0';
						  load<='1';
					
                when 11 =>
					 --enjuagar
                    cout <= 0;
                    giro <= "111"; --izquierda
                    velocidad <= "111"; --lenta
                    llenado <= '0';
                    vaciado <= '0';
						  alarma<='0';
						  load<='0';
						  
					when 12=>
				
                    cout <= 75;
                    llenado <= '0';
                    vaciado <= '0';
                    giro <= "000"; --nada
                    velocidad <= "011"; --nada
						  alarma<='0';
						  load<='1';
				
                when 13 =>
					 --centrifugar
                    cout <= 0;
                    giro <= "111"; --drecha
                    velocidad <= "111"; --rapido
                    llenado <= '0';
                    vaciado <= '0';
				        alarma<='0';
						  load<='0';
				
				    when 14=>
					 --alarma
					      cout <= 0;
                    llenado <= '0';
                    vaciado <= '0';
                    giro <= "111";  --nada
                    velocidad <= "111"; 
						  alarma<='1';
						  load<='0';
                when others =>
                    
                    cout <= 0;
                    llenado <= '0';
                    vaciado <= '0';
                    giro <= "111";  --nada
                    velocidad <= "111";
						  alarma<='0'; 
						  load<='0';
            end case;
        end if;
    end process;
end arch_ciclo_operacion;