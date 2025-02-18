----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
-------- Sumador 2 Bits --------
-------- 04/02/2025 --------
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--------- Pin/out ---------
entity TwoBitsAdder is
	port
		(
		A,B: in std_logic_vector(15 downto 0);
		Cout: out std_logic;
        S : out std_logic_vector(15 downto 0)
        );
end TwoBitsAdder;

architecture juve3dstudio of TwoBitsAdder is

component HALFADDER
port
		(
		A,B	: in std_logic;
		Cout,S	: out std_logic
		);
end component;

component FULLADDER
	port
		(
		A,B, CIN: in std_logic;
		Cout,S	: out std_logic
		);
end component;
signal S_C: std_logic_vector(15 downto 0);
begin
    U0: HALFADDER port map(A => A(0), B => B(0), Cout => S_C(0), S => S(0));

     U1:  FULLADDER port map(A => A(01), B => B(01), CIN => S_C(00), Cout => S_C(01),  S => S(01));
     U2:  FULLADDER port map(A => A(02), B => B(02), CIN => S_C(01), Cout => S_C(02),  S => S(02));
     U3:  FULLADDER port map(A => A(03), B => B(03), CIN => S_C(02), Cout => S_C(03),  S => S(03));
     U4:  FULLADDER port map(A => A(04), B => B(04), CIN => S_C(03), Cout => S_C(04),  S => S(04));
     U5:  FULLADDER port map(A => A(05), B => B(05), CIN => S_C(04), Cout => S_C(05),  S => S(05));
     U6:  FULLADDER port map(A => A(06), B => B(06), CIN => S_C(05), Cout => S_C(06),  S => S(06));
     U7:  FULLADDER port map(A => A(07), B => B(07), CIN => S_C(06), Cout => S_C(07),  S => S(07));
     U8:  FULLADDER port map(A => A(08), B => B(08), CIN => S_C(07), Cout => S_C(08),  S => S(08));
     U9:  FULLADDER port map(A => A(09), B => B(09), CIN => S_C(08), Cout => S_C(09),  S => S(09));
     U10: FULLADDER port map(A => A(10), B => B(10), CIN => S_C(09), Cout => S_C(10),  S => S(10));
     U11: FULLADDER port map(A => A(11), B => B(11), CIN => S_C(10), Cout => S_C(11),  S => S(11));
     U12: FULLADDER port map(A => A(12), B => B(12), CIN => S_C(11), Cout => S_C(12),  S => S(12));
     U13: FULLADDER port map(A => A(13), B => B(13), CIN => S_C(12), Cout => S_C(13),  S => S(13));
     U14: FULLADDER port map(A => A(14), B => B(14), CIN => S_C(13), Cout => S_C(14),  S => S(14));
     U15: FULLADDER port map(A => A(15), B => B(15), CIN => S_C(14), Cout => COUT,   S => S(15));
		



end juve3dstudio;
