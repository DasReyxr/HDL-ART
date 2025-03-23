----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
------- VectorMult -------
-------- 28/02/2025 --------
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--------- Pin/out ---------
entity VectorMult is
	port
		(
        -- In --
        C_B, C_M : in std_logic_vector(7 downto 0);
        C_Q : in std_logic;
        -- Out --
        C_Cout : out std_logic;
        C_P : out std_logic_vector(7 downto 0)
        );
end VectorMult;

architecture juve3dstudio of VectorMult is

------ Full Adder ------
signal Carry : std_logic_vector (8 downto 0);
signal C_A: std_logic_vector(7 downto 0);


begin
	------- Mod -------
	C_A(0)<=C_M(0) and C_Q;
	C_A(1)<=C_M(1) and C_Q;
	C_A(2)<=C_M(2) and C_Q;
	C_A(3)<=C_M(3) and C_Q;

	C_A(4)<=C_M(4) and C_Q;
	C_A(5)<=C_M(5) and C_Q;
	C_A(6)<=C_M(6) and C_Q;
	C_A(7)<=C_M(7) and C_Q;
	    	
	------- Full Adder -------

    carry(0) <= '0';
    C_Cout   <= carry(8);

    -- Carry --
    Carry(1) <= (C_A(0) and C_B(0)) or (carry(0) and (C_A(0) xor C_B(0)));
    Carry(2) <= (C_A(1) and C_B(1)) or (carry(1) and (C_A(1) xor C_B(1)));
    Carry(3) <= (C_A(2) and C_B(2)) or (carry(2) and (C_A(2) xor C_B(2)));
    Carry(4) <= (C_A(3) and C_B(3)) or (carry(3) and (C_A(3) xor C_B(3)));
    Carry(5) <= (C_A(4) and C_B(4)) or (carry(4) and (C_A(4) xor C_B(4)));
    Carry(6) <= (C_A(5) and C_B(5)) or (carry(5) and (C_A(5) xor C_B(5)));
    Carry(7) <= (C_A(6) and C_B(6)) or (carry(6) and (C_A(6) xor C_B(6)));
    Carry(8) <= (C_A(7) and C_B(7)) or (carry(7) and (C_A(7) xor C_B(7)));
    
        
    -- Partial Product --
	C_P(0) <= C_A(0) xor C_B(0) xor carry(0);
	C_P(1) <= C_A(1) xor C_B(1) xor carry(1);
	C_P(2) <= C_A(2) xor C_B(2) xor carry(2);
	C_P(3) <= C_A(3) xor C_B(3) xor carry(3);
	C_P(4) <= C_A(4) xor C_B(4) xor carry(4);
	C_P(5) <= C_A(5) xor C_B(5) xor carry(5);
	C_P(6) <= C_A(6) xor C_B(6) xor carry(6);
	C_P(7) <= C_A(7) xor C_B(7) xor carry(7);
    
    end juve3dstudio;


