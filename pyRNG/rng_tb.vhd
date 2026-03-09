-- filepath: c:\Users\Das\Dropbox\Obsidian\Fisica\tmp\HDL-ART\pyRNG\rng_tb.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rng_tb is
end rng_tb;

architecture behavior of rng_tb is

    -- Component Declaration
    component RNG
        port(
            clk : in std_logic;
            sw  : in std_logic;
            card : out std_logic_vector(7 downto 0)
        );
    end component;

    -- Signals for connection
    signal clk : std_logic := '0';
    signal sw  : std_logic := '0';
    signal ran : std_logic_vector(7 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: RNG
        port map (
            clk => clk,
            sw  => sw,
            card => ran
        );

	process
	begin

        clk <= '0';
        wait for 1 ns;

        clk <= '1';
        wait for 1 ns;
	end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initial state
        sw <= '0';
        wait for 20 ns;

        -- Toggle sw to load new value
        sw <= '1';
        wait for 10 ns;
        sw <= '0';
        wait for 100 ns;

        -- Toggle sw again
        sw <= '1';
        wait for 10 ns;
        sw <= '0';
        wait for 100 ns;

        -- End simulation
        wait;
    end process;

end behavior;