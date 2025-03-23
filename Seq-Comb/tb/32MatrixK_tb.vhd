
 
-------- Testbench --------
------ Orlando Reyes ------
--------- Auf Das ---------
----------- TMATRICIAL -----------
-------- 27/08/2024 --------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb is
end tb;

architecture sim of tb is

    component TMATRICIAL
        port 
        (
            --- Sequencer ---
            CLK: in std_logic;
            rowSelect: out std_logic_vector(3 downto 0);
            
            --- Matrix Keyboard ---
            ColumnBus : in std_logic_vector(3 downto 0);
            LEDS      : out std_logic_vector(3 downto 0)
        );
    end component;

    signal S_CLK: std_logic;
    signal S_rowSelect: std_logic_vector(3 downto 0);
    
    --- Matrix Keyboard ---
    signal S_ColumnBus: std_logic_vector(3 downto 0);
    signal S_LEDS: std_logic_vector(3 downto 0);

begin

    uut: TMATRICIAL port map (S_CLK, S_rowSelect, S_ColumnBus, S_LEDS);
    
    process
    begin
        wait for 100 ns;
        S_CLK <= '0';
        wait for 100 ns;
        S_CLK <= '1';
        wait;
    end process;

    process
    begin
        wait for 300 ns;
        S_ColumnBus <= "0001";
        wait for 900 ns;
        --- 1st Column ---         
        S_ColumnBus <= "0010";
        wait for 800 ns;
        S_ColumnBus <= "0100";
        wait for 800 ns;
        S_ColumnBus <= "1000";
        wait for 700 ns;
        S_ColumnBus <= "0000";
        wait for 100 ns;
        -- 2st Col
        S_ColumnBus <= "0001";
        wait for 900 ns;
        S_ColumnBus <= "0010";
        wait for 800 ns;
        S_ColumnBus <= "0100";
        wait for 800 ns;
        S_ColumnBus <= "1000";
        wait for 700 ns;
        S_ColumnBus <= "0000";
        wait for 100 ns;
        -- 3rd Col
        S_ColumnBus <= "0001";
        wait for 900 ns;
        S_ColumnBus <= "0010";
        wait for 800 ns;
        S_ColumnBus <= "0100";
        wait for 800 ns;
        S_ColumnBus <= "1000";
        wait for 700 ns;
        S_ColumnBus <= "0000";
        wait for 100 ns;
        -- 4th Col
        S_ColumnBus <= "0001";
        wait for 900 ns;
        S_ColumnBus <= "0010";
        wait for 800 ns;
        S_ColumnBus <= "0100";
        wait for 800 ns;
        S_ColumnBus <= "1000";
        wait for 700 ns;
        S_ColumnBus <= "0000";
        wait for 100 ns;
        

        wait;
    end process;

end sim;

 
