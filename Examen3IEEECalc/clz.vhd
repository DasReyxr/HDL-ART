----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
------ Floating Point ------
---- I date 26/05/2025 ----
---- C date 26/05/2025 ----
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
--------- Pin/out ---------
entity clz is
	port
		(
			Val: in std_logic_vector(31 downto 0);
            clz: out integer range 0 to 32
            );
end ;

architecture juve3dstudio of clz is

    begin
    clz <= 0 when val(31) = '1' else
        1 when val(30) = '1' else
        2 when val(29) = '1' else
        3 when val(28) = '1' else
        4 when val(27) = '1' else
        5 when val(26) = '1' else
        6 when val(25) = '1' else
        7 when val(24) = '1' else
        8 when val(23) = '1' else
        9 when val(22) = '1' else
        10 when val(21) = '1' else
        11 when val(20) = '1' else
        12 when val(19) = '1' else
        13 when val(18) = '1' else
        14 when val(17) = '1' else
        15 when val(16) = '1' else
        16 when val(15) = '1' else
        17 when val(14) = '1' else
        18 when val(13) = '1' else
        19 when val(12) = '1' else
        20 when val(11) = '1' else
        21 when val(10) = '1' else
        22 when val(9) = '1' else
        23 when val(8) = '1' else
        24 when val(7) = '1' else
        25 when val(6) = '1' else
        26 when val(5) = '1' else
        27 when val(4) = '1' else
        28 when val(3) = '1' else
        29 when val(2) = '1' else
        30 when val(1) = '1' else
        31 when val(0) = '1' else
        32;  -- all zeros
    
end juve3dstudio;