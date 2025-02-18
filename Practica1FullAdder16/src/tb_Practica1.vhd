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
    
    component Adder16
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
        UUT: Adder16 port map (
            A => A_tb,
            B => B_tb,
            Cout => Cout_tb,
            S => S_tb
        );
    
        stim_proc: process
        begin
            -- Test Case 1: Max values (FFF + FFF = 1FFE)
            A_tb <= X"FFF"; B_tb <= X"FFF";
            wait for 10 ns;

            -- Test Case 2: Min values (000 + 000 = 000)
            A_tb <= X"000"; B_tb <= X"000";
            wait for 10 ns;

            -- Test Case 3: Carry generation (800 + 800 = 1000)
            A_tb <= X"800"; B_tb <= X"800";
            wait for 10 ns;

            -- Test Case 4: Random mid-range (123 + 456 = 579)
            A_tb <= X"123"; B_tb <= X"456";
            wait for 10 ns;

            -- Test Case 5: Mixed bits (AAA + 555 = FFF)
            A_tb <= X"AAA"; B_tb <= X"555";
            wait for 10 ns;

            -- Test Case 6: Overflow check (FFF + 001 = 1000)
            A_tb <= X"FFF"; B_tb <= X"001";
            wait for 10 ns;

            -- Stop Simulation
            wait;
        end process;
    end sim;