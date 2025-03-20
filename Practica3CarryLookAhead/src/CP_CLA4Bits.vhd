----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
------- CP_CLA4Bits -------
-------- 17/02/2025 --------
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--------- Pin/out ---------
entity CP_CLA4Bits is
	port
		(
		C_A,C_B : in std_logic_vector(3 downto 0);
		C_S : out std_logic_vector (3 downto 0);
        C_cin : in std_logic;
		C_cout: out std_logic
        );
end CP_CLA4Bits;

architecture juve3dstudio of CP_CLA4Bits is
signal P, G : std_logic_vector(3 downto 0);
signal carry : std_logic_vector (4 downto 0);
begin
	carry(0) <= C_cin;
	-- Juan 1 --
	P(0) <= C_A(0) xor C_B(0);
	P(1) <= C_A(1) xor C_B(1);
	P(2) <= C_A(2) xor C_B(2);
	P(3) <= C_A(3) xor C_B(3);
	
	G(0) <= C_A(0) and C_B(0);
	G(1) <= C_A(1) and C_B(1);
	G(2) <= C_A(2) and C_B(2);
	G(3) <= C_A(3) and C_B(3);

	-- Juan 2 --
	carry(1) <=  G(0)  or (P(0) and carry(0));
    carry(2) <=  G(1)  or (P(1) and carry(1));
    carry(3) <=  G(2)  or (P(2) and carry(2));
    carry(4) <=  G(3)  or (P(3) and carry(3));

    
	-- Juan 3 --
	C_S(0) <= P(0) xor carry(0);
	C_S(1) <= P(1) xor carry(1);
	C_S(2) <= P(2) xor carry(2);
	C_S(3) <= P(3) xor carry(3);
	C_cout <= carry(4);

    end juve3dstudio;

    -- carry(2) <=  G(1)  or 
	-- 			(P(1) and G(0))  or 
	-- 			(P(1) and P(0) and carry(0));


	-- carry(3) <=  G(2)  or 
	-- 			(P(2) and G(1)) or 
	-- 			(P(2) and P(1) and G(0)) or 
	-- 			(P(2) and P(1) and P(0)  and carry(0));

	-- carry(4) <=  G(3) or 
	-- 			(P(3) and G(2)) or   
	-- 			(P(3) and P(2) and G(1)) or 
	-- 			(P(3) and P(2) and P(1) and G(0)) or 
	-- 			(P(3) and P(2) and P(1) and P(0)  and carry(0));


