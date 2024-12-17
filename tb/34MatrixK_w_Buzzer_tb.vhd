-------- Testbench --------
------ Orlando Reyes ------
--------- Auf Das ---------
----------- Tmat -----------
-------- 27/08/2024 --------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb is
end tb;

architecture sim of tb is

    component GuzzerMatrix
    port
    (
        CLK : in std_logic;
        Buzzer : out std_logic;
        --- Sequencer ---
        rowSelect: out std_logic_vector(3 downto 0);
        --- Matrix Keyboard ---
        ColumnBus : in std_logic_vector(3 downto 0)
    );
    end component;

    signal S_CLK, S_Buzzer: std_logic;
    signal S_rowSelect: std_logic_vector(3 downto 0);
    signal S_ColumnBus: std_logic_vector(3 downto 0);

begin

    uut: GuzzerMatrix port map (S_CLK, S_Buzzer, S_rowSelect, S_ColumnBus);

    process
    begin
        wait for 100 ns;
        S_CLK <= '0';
        wait for 100 ns;
        S_CLK <= '1';
   
    end process;

    process
    begin
        wait for 300 ns;
        S_ColumnBus <= "0001";
        wait for 900 ns;
        -- 1st Column ---
        S_ColumnBus <= "0010";
        wait for 800 ns;
        S_ColumnBus <= "0100";
        wait for 800 ns;
        S_ColumnBus <= "1000";
        wait for 800 ns;
        S_ColumnBus <= "0000";
        wait for 100 ns;
        
        -- 2nd Column ---
        S_ColumnBus <= "0001";
        wait for 900 ns;
        S_ColumnBus <= "0010";
        wait for 800 ns;
        S_ColumnBus <= "0100";
        wait for 800 ns;
        S_ColumnBus <= "1000";
        wait for 800 ns;
        S_ColumnBus <= "0000";
        wait for 100 ns;

        -- 3rd Column ---
        S_ColumnBus <= "0001";
        wait for 900 ns;
        S_ColumnBus <= "0010";
        wait for 800 ns;
        S_ColumnBus <= "0100";
        wait for 800 ns;
        S_ColumnBus <= "1000";
        wait for 800 ns;
        S_ColumnBus <= "0000";
        wait for 100 ns;

        -- 4th Column ---
        S_ColumnBus <= "0001";
        wait for 900 ns;
        S_ColumnBus <= "0010";
        wait for 800 ns;
        S_ColumnBus <= "0100";
        wait for 800 ns;
        S_ColumnBus <= "1000";
        wait for 800 ns;
        S_ColumnBus <= "0000";
        wait for 100 ns;
        
        wait;
    end process;

end sim;
