----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
-------- Full Adder --------
-------- 04/02/2025 --------
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--------- Pin/out ---------
entity FULLADDER is
	port
		(
		A,B, CIN: in std_logic;
		Cout,S	: out std_logic
		);
end FULLADDER;

architecture juve3dstudio of FULLADDER is

begin
    Cout <= (A and B) or (cin and (A xor B));
    S <= (A xor B) xor cin;
end juve3dstudio;
