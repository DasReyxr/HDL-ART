----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
-------- Sumador 2 Bits --------
-------- 04/02/2025 --------
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--------- Pin/out ---------

entity tb is
    end tb;

    architecture sim of tb is

    component TwoBitsAdder
    port (
        A, B : in std_logic_vector(11 downto 0);
        Cout : out std_logic;
        S : out std_logic_vector(11 downto 0)
    );
    end component;

    signal A_tb, B_tb : std_logic_vector(11 downto 0);
    signal Cout_tb : std_logic;
    signal S_tb : std_logic_vector(11 downto 0);


    begin
        UUT: TwoBitsAdder port map (
            A => A_tb,
            B => B_tb,
            Cout => Cout_tb,
            S => S_tb
        );

        stim_proc: process
        begin
            -- Test Case 1: FFF + FFF
            A_tb <= X"FFF"; B_tb <= X"FFF";
            wait for 10 ns;
            -- Test Case 2: 001 + 00F
            A_tb <= X"001"; B_tb <= X"00F";
            wait for 10 ns;

            -- Test Case 3: 002 + 007
            A_tb <= X"002"; B_tb <= X"007";
            wait for 10 ns;

            -- Stop Simulation
            wait;
        end process;
    end sim;