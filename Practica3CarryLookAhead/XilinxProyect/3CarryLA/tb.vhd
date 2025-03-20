----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
---- Top_CarryLookAhead ----
-------- 17/02/2025 --------
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Top_CarryLookAhead is
end TB_Top_CarryLookAhead;

architecture testbench of TB_Top_CarryLookAhead is
    component Top_CarryLookAhead
        port (
            A, B : in std_logic_vector(15 downto 0);
            cout : out std_logic;
            S    : out std_logic_vector(15 downto 0)
        );
    end component;
    
    signal A, B, S : std_logic_vector(15 downto 0) := (others => '0');
    signal cin, cout : std_logic := '0';
    
begin
    
    UUT: Top_CarryLookAhead port map (
        A => A,
        B => B,
        cout => cout,
        S => S
    );
    
    process
    begin
        -- Caso de prueba 1: Suma básica
        A   <= X"0001";
        B   <= X"0001";
        wait for 10 ns;
        
        -- Caso de prueba 2: Suma con acarreo
        A   <= X"000F";
        B   <= X"0001";
        wait for 10 ns;
        
        -- Caso de prueba 3: Suma con valores más grandes
        A   <= X"1234";
        B   <= X"4321";
        wait for 10 ns;
        
        -- Caso de prueba 4: Suma con overflow
        A   <= X"FFFF";
        B   <= X"0001";
        wait for 10 ns;
        
        -- Caso de prueba 5: Cero + Cero
        A   <= X"0000";
        B   <= X"0000";
        wait for 10 ns;
        
        wait;
    end process;
    
end testbench;