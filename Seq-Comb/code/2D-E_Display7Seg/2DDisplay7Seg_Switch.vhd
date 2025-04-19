----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
--------- Display7 ---------
-------- 27/05/2024 --------
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--------- Pin/out ---------
entity Display7 is
	port
		(
			Sw : in std_logic_vector(3 downto 0);
			Disp : out std_logic_vector(0 to 6)
		);
end Display7;

architecture juve3dStudio of Display7 is
begin
--G to a
Disp <= "0111111" when Sw = "1111" else
        "0000110" when Sw = "1110"  else
        "1011011" when Sw = "1101" else
        "1001111" when Sw = "1100" else
        "1100110" when Sw = "1011" else
        "1101101" when Sw = "1010" else
        "1111101" when Sw = "1001" else
        "0000111" when Sw = "1000" else
        "1111111" when Sw = "0111" else
        "1101111" when Sw = "0110" else
        "0000000";
end juve3dStudio;