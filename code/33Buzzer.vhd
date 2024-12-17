----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
---------- Guzzer ----------
-------- 10/09/2024 --------
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 
--------- Pin/out ---------
entity Guzzer is
	port
		(
		CLK, Enable	: in std_logic;
		OUTPUT : out std_logic
		);
end Guzzer;

architecture juve3dstudio of Guzzer is
	signal BUZZER : STD_LOGIC;
	signal siguiente, actual : STD_LOGIC_VECTOR(17 downto 0) := "000000000000000000";
begin
	-- Memoria --
	actual <= siguiente when CLK'event and CLK = '1'; 
	-- Logica de estado Siguiente --
	siguiente <= actual + '1' when actual <= "100111000011111111" else "000000000000000000";
	-- Logica de Salida --
	
	OUTPUT <= '0' when actual <= "010011100001111111"  and Enable='0' else '1'; 

	

end juve3dstudio;