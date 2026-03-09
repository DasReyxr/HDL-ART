library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity IEEEConv_tb is
end IEEEConv_tb;

architecture tb of IEEEConv_tb is
    signal IEEE : std_logic_vector(31 downto 0) := (others => '0');
    signal Sign : std_logic;
    signal Intg : std_logic_vector(23 downto 0);
    signal Frac : unsigned(15 downto 0);


begin
    -- Instancia del módulo bajo prueba
    DUT: entity work.IEEEConv
        port map (
            IEEE => IEEE,
            Sign => Sign,
            Intg => Intg,
            Frac => Frac
        );

    process
    begin

        
    -- Aplicar 5.25 (01000000101010000000000000000000)
    IEEE <= x"40A80000";
        wait for 10 ns;
    IEEE <= x"00000000";
    wait for 10 ns;
    -- Aplicar 0.75 (00111111010000000000000000000000)
    IEEE <= x"3F400000";
        
        wait;
    end process;

end tb;
