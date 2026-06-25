library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_SPI_Clock is
end tb_SPI_Clock;

architecture sim of tb_SPI_Clock is

    -- DUT signals
    signal clk   : std_logic := '0';
    signal NSS   : std_logic := '1';
    signal CPOL  : std_logic := '0';
    signal CPHA  : std_logic := '0';

    type slv4 is array (0 to 3) of std_logic;

    signal sample_strobe : slv4 := (others => '0');
    signal SCLK          : slv4 := (others => '0');
    constant clk_period : time := 10 ns;

begin
UUT0: entity work.SPI_Clock
port map (
    clk           => clk,
    NSS           => NSS,
    CPOL          => '0',
    CPHA          => '0',
    sample_strobe => sample_strobe(0),
    SCLK          => SCLK(0)
);

UUT1: entity work.SPI_Clock
port map (
    clk           => clk,
    NSS           => NSS,
    CPOL          => '0',
    CPHA          => '1',
    sample_strobe => sample_strobe(1),
    SCLK          => SCLK(1)
);

UUT2: entity work.SPI_Clock
port map (
    clk           => clk,
    NSS           => NSS,
    CPOL          => '1',
    CPHA          => '0',
    sample_strobe => sample_strobe(2),
    SCLK          => SCLK(2)
);

UUT3: entity work.SPI_Clock
port map (
    clk           => clk,
    NSS           => NSS,
    CPOL          => '1',
    CPHA          => '1',
    sample_strobe => sample_strobe(3),
    SCLK          => SCLK(3)
);

    --------------------------------------------------------------------
    -- Clock generation
    --------------------------------------------------------------------
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end loop;
    end process;

    --------------------------------------------------------------------
    -- Stimulus
    --------------------------------------------------------------------
    stim_proc : process
    begin

        -- Idle
        NSS <= '1';
        wait for 50 ns;

        -- Activate SPI
        NSS <= '0';
		wait for 800 ns;
        -- Disable SPI
        NSS <= '1';
        wait for 100 ns;

        -- finish
        assert false report "Simulation finished" severity failure;

    end process;

end sim;