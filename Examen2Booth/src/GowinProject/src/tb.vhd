----------- Tb -----------
------ Orlando Reyes ------
--------- Auf Das ---------
------- Booth Wallace -------
-------- 14/04/2025 --------
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_Multiplier is
end tb_Multiplier;

architecture behavior of tb_Multiplier is

    -- Component Declaration
    component Multiplier is
        port(
            SignA, SignB : in std_logic;
            RA, RB       : in std_logic_vector(7 downto 0);
            P_out        : out std_logic_vector(15 downto 0);
            SignP        : out std_logic
        );
    end component;

    -- Signals
    signal SignA, SignB : std_logic := '0';
    signal RA, RB       : std_logic_vector(7 downto 0) := (others => '0');
    signal P_out        : std_logic_vector(15 downto 0);
    signal SignP        : std_logic;

begin

    -- Instantiate the Unit Under Test
    uut: Multiplier
        port map (
            SignA => SignA,
            SignB => SignB,
            RA    => RA,
            RB    => RB,
            P_out => P_out,
            SignP => SignP
        );

    -- Stimulus
    stim_proc: process
    begin
        -- Test 1: 5 * 3 = 15
        SignA <= '0'; RA <= x"05";
        SignB <= '0'; RB <= x"03";
        wait for 20 ns;

        -- Test 2: -5 * 3 = -15
        SignA <= '1'; RA <= x"05";
        SignB <= '0'; RB <= x"03";
        wait for 20 ns;

        -- Test 3: 5 * -3 = -15
        SignA <= '0'; RA <= x"05";
        SignB <= '1'; RB <= x"03";
        wait for 20 ns;

        -- Test 4: -5 * -3 = 15
        SignA <= '1'; RA <= x"05";
        SignB <= '1'; RB <= x"03";
        wait for 20 ns;

        -- Test 5: 0 * 10 = 0
        SignA <= '0'; RA <= x"00";
        SignB <= '0'; RB <= x"0A";
        wait for 20 ns;

        -- Test 6: 127 * 127 = 16129
        SignA <= '0'; RA <= x"7F";
        SignB <= '0'; RB <= x"7F";
        wait for 20 ns;

        -- Test 7: -128 * 1 = -128
        SignA <= '1'; RA <= x"80";
        SignB <= '0'; RB <= x"01";
        wait for 20 ns;

        -- Test 8: 1 * -128 = -128
        SignA <= '0'; RA <= x"01";
        SignB <= '1'; RB <= x"80";
        wait for 20 ns;

        wait;
    end process;

end behavior;
