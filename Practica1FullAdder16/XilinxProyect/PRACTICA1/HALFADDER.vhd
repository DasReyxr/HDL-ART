----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
-------- Full Adder --------
-------- 04/02/2025 --------
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--------- Pin/out ---------
entity HALFADDER is
	port
		(
		A,B	: in std_logic;
		Cout,S	: out std_logic
		);
end HALFADDER;

architecture juve3dstudio of HALFADDER is

begin
    Cout <= A and B;
    S <= A xor B;
end juve3dstudio;