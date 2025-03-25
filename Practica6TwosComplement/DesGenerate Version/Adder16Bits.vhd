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
	generic(size : integer := 8); -- Provide a default value
	port
		(
		C_A, C_B : in std_logic_vector(size-1 downto 0);
		C_S : out std_logic_vector(size-1 downto 0);
        C_cin : in std_logic;
		C_cout : out std_logic
        );
end CLA_16Bits;

architecture juve3dstudio of CLA_16Bits is
-- Ensure all vectors are correctly sized
signal P, G : std_logic_vector(size-1 downto 0);
signal carry : std_logic_vector(size downto 0);  -- Adjusted to size downto 0

begin
	carry(0) <= C_cin;
    GEN_XOR : for i in 0 to size-1 generate
        P(i) <= C_A(i) xor C_B(i);
        G(i) <= C_A(i) and C_B(i);
        carry(i+1) <= G(i) or (P(i) and carry(i));    
        C_S(i) <= P(i) xor carry(i);
    end generate GEN_XOR;

	C_cout <= carry(size);

end juve3dstudio;
