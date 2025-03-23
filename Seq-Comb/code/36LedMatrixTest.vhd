----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
-------- LedMatrix --------
-------- 05/11/2024 --------
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

--------- Pin/out ---------
entity LedMatrix is
	port
		(
		SW, CLK	: in std_logic;
		CS, CLK2, DIN	: out std_logic
		);
end LedMatrix;

architecture juve3dstudio of LedMatrix is
    -- Counters --
    signal CountCLK : std_logic_vector (2 downto 0) := "000";
    signal CountCLK2 : std_logic_vector (3 downto 0) := "0000";
    signal Enable, CCLK2 : std_logic ;
    signal actual, siguiente : std_logic_vector (6 downto 0) :=  "0000000" ;
begin
    CountCLK <= CountCLK + '1' when CLK'event and CLK = '1' and Enable = '1';
    Enable <= '1' when SW = '0' or actual > "0000000" else '0';
    
    
    -- Memoria --
    actual <= siguiente when CLK'event and CLK = '1'; 
    -- Logica de estado Siguiente --
    siguiente <= actual + '1' when actual < 67 and (SW = '0' or actual>"0000000")   else (others => '0') ;
    -- Logica de Salida --
    CS <= '0' when Enable = '1' and (actual < 64)  else '1';
    
    CCLK2 <= 
            '1' when CountCLK = "001" else 
            '1' when CountCLK = "011" else 
            '1' when CountCLK = "101" else 
            '1' when CountCLK = "111" else 
            '0' ; -- 2 0 2 1
            
            
    CLK2 <= CCLK2;
    DIN <= '1';

end juve3dstudio;