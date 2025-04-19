----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
------- Display Osc -------
-------- 07/06/2024 --------
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.ALL; 
--------- Pin/out ---------
entity Display7 is
	port
		(
        	CLK : in std_logic;
			Disp : out std_logic_vector(6 downto 0)
		);
end Display7;

architecture juve3dstudio of Display7 is
	
    signal Count4 : unsigned(3 downto 0) := "0000"; 	
	signal Count29 : unsigned(28 downto 0) := "00000000000000000000000000000";
begin

	Count29 <= Count29 + 1 when CLK'event and CLK = '1';
    Count4(0) <= Count29(25);
	Count4(1) <= Count29(26);
	Count4(2) <= Count29(27);
    Count4(3) <= Count29(28);
	Disp <=  "0111111" WHEN Count4 = "0000" ELSE
			"0000110" WHEN Count4 = "0001" ELSE
			"1011011" WHEN Count4 = "0010" ELSE
			"1001111" WHEN Count4 = "0011" ELSE
			"1100110" WHEN Count4 = "0100" ELSE
			"1101101" WHEN Count4 = "0101" ELSE
			"1111101" WHEN Count4 = "0110" ELSE
			"0000111" WHEN Count4 = "0111" ELSE
			"1111111" WHEN Count4 = "1000" ELSE
			"1101111" WHEN Count4 = "1001" ELSE
			"0000000";

end juve3dstudio;