library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Top_SPITest is
end tb_Top_SPITest;

architecture sim of tb_Top_SPITest is

    signal clk  : std_logic := '0';
    signal SCLK : std_logic;
    signal MOSI : std_logic;
    signal done : std_logic;

    constant CLK_PERIOD : time := 10 ns;

begin

    --------------------------------------------------------------------
    -- DUT
    --------------------------------------------------------------------
    DUT : entity work.Top_SPITest
    port map(
        clk  => clk,
        SCLK => SCLK,
        MOSI => MOSI,
        done => done
    );

    --------------------------------------------------------------------
    -- Clock Generator (100 MHz)
    --------------------------------------------------------------------
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for CLK_PERIOD/2;
            clk <= '1';
            wait for CLK_PERIOD/2;
        end loop;
    end process;

    --------------------------------------------------------------------
    -- Stimulus
    --------------------------------------------------------------------
    stim_proc : process
    begin

        -- Let the SPI engine run
        wait for 1000 ns;

        assert false
            report "End of simulation."
            severity failure;

    end process;

end sim;