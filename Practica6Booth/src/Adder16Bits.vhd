----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
------- CP_CLA4Bits -------
-------- 21/03/2025 --------
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--------- Pin/out ---------
entity CLA_16Bits is
	port
		(
		C_A, C_B : in std_logic_vector(7 downto 0);
		C_S : out std_logic_vector(7 downto 0);
        C_cin : in std_logic
	    );
end CLA_16Bits;

architecture juve3dstudio of CLA_16Bits is
-- Ensure all vectors are correctly sized
signal P, G : std_logic_vector(7 downto 0);
signal carry : std_logic_vector(8 downto 0);  -- Adjusted to 8 downto 0

begin
	carry(0) <= C_cin;
	-- Carry --
    Carry(1) <= (C_A(0) and C_B(0)) or (carry(0) and (C_A(0) xor C_B(0)));
	Carry(2) <= (C_A(1) and C_B(1)) or (carry(1) and (C_A(1) xor C_B(1)));
	Carry(3) <= (C_A(2) and C_B(2)) or (carry(2) and (C_A(2) xor C_B(2)));
	Carry(4) <= (C_A(3) and C_B(3)) or (carry(3) and (C_A(3) xor C_B(3)));
	Carry(5) <= (C_A(4) and C_B(4)) or (carry(4) and (C_A(4) xor C_B(4)));
	Carry(6) <= (C_A(5) and C_B(5)) or (carry(5) and (C_A(5) xor C_B(5)));
	Carry(7) <= (C_A(6) and C_B(6)) or (carry(6) and (C_A(6) xor C_B(6)));
	Carry(8) <= (C_A(7) and C_B(7)) or (carry(7) and (C_A(7) xor C_B(7)));
	Carry(9) <= (C_A(8) and C_B(8)) or (carry(8) and (C_A(8) xor C_B(8)));
	Carry(10) <= (C_A(9) and C_B(9)) or (carry(9) and (C_A(9) xor C_B(9)));
	Carry(11) <= (C_A(10) and C_B(10)) or (carry(10) and (C_A(10) xor C_B(10)));
	Carry(12) <= (C_A(11) and C_B(11)) or (carry(11) and (C_A(11) xor C_B(11)));
	Carry(13) <= (C_A(12) and C_B(12)) or (carry(12) and (C_A(12) xor C_B(12)));
	Carry(14) <= (C_A(13) and C_B(13)) or (carry(13) and (C_A(13) xor C_B(13)));
	Carry(15) <= (C_A(14) and C_B(14)) or (carry(14) and (C_A(14) xor C_B(14)));
	Carry(16) <= (C_A(15) and C_B(15)) or (carry(15) and (C_A(15) xor C_B(15)));
	
	-- Partial Product --
    C_S(0) <= C_A(0) xor C_B(0) xor carry(0);
	C_S(1) <= C_A(1) xor C_B(1) xor carry(1);
	C_S(2) <= C_A(2) xor C_B(2) xor carry(2);
	C_S(3) <= C_A(3) xor C_B(3) xor carry(3);
	C_S(4) <= C_A(4) xor C_B(4) xor carry(4);
	C_S(5) <= C_A(5) xor C_B(5) xor carry(5);
	C_S(6) <= C_A(6) xor C_B(6) xor carry(6);
	C_S(7) <= C_A(7) xor C_B(7) xor carry(7);
	C_S(8) <= C_A(8) xor C_B(8) xor carry(8);
	C_S(9) <= C_A(9) xor C_B(9) xor carry(9);
	C_S(10) <= C_A(10) xor C_B(10) xor carry(10);
	C_S(11) <= C_A(11) xor C_B(11) xor carry(11);
	C_S(12) <= C_A(12) xor C_B(12) xor carry(12);
	C_S(13) <= C_A(13) xor C_B(13) xor carry(13);
	C_S(14) <= C_A(14) xor C_B(14) xor carry(14);
	C_S(15) <= C_A(15) xor C_B(15) xor carry(15);

	--C_cout <= carry(8);

end juve3dstudio;
