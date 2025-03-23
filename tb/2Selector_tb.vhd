--------- Testbench Code -------
-------- Orlando Contreras -------
----------- Reyes Das ------------


------------ 12/04/2024 ------------
----------- MAIN LIBRARY ----------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

----------- SET OUTPUTS ----------- 

entity testbench is
end testbench;

architecture MAIN of testbench is

component Selector
port ( 
    A, B, S   : in std_logic;
    Z : out std_logic
 );
end component;

signal sA, sB, sS,sZ  : std_logic;
begin


uut: Selector port map (sA, sB, sS, sZ);

--secuencia de casos de entrada que se van a simular
process
begin
    -- Truth Table --
    sA <= '0';
    sB <= '0';
    sS <= '0';
    wait for 1 us;
    sA <= '0';
    sB <= '0';
    sS <= '1';
    wait for 1 us;
    sA <= '0';
    sB <= '1';
    sS <= '0';
    wait for 1 us;
    sA <= '0';
    sB <= '1';
    sS <= '1';
    wait for 1 us;
    
    sA <= '1';
    sB <= '0';
    sS <= '0';
    wait for 1 us;
    sA <= '1';
    sB <= '0';
    sS <= '1';
    wait for 1 us;
    sA <= '1';
    sB <= '1';
    sS <= '0';
    wait for 1 us;
    sA <= '1';
    sB <= '1';
    sS <= '1';
    wait for 1 us;
    
    wait;
end process;

end MAIN;