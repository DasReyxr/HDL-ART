---------Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
-------- CarrySkip4 --------
-------- 10/02/2025 --------
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--------- Pin/out ---------
entity CarrySkip4 is
	port
		(
			C_A, C_B: in std_logic_vector(3 downto 0);
			C_S: out std_logic_vector(3 downto 0);
            C_cin : in std_logic;
            C_cout, C_P : out std_logic
        );
end CarrySkip4;

architecture juve3dstudio of CarrySkip4 is
    signal S_P, S_C : std_logic_vector(3 downto 0);
    signal Skip : std_logic;
    begin
    -- Sumador LSB --
    S_C(0) <= (C_A(0) and C_B(0)) or (C_cin   and (C_A(1) xor C_B(1)));  
    S_C(1) <= (C_A(1) and C_B(1)) or (S_C(0) and (C_A(1) xor C_B(1))); 
    S_C(2) <= (C_A(2) and C_B(2)) or (S_C(1) and (C_A(2) xor C_B(2))); 
    S_C(3) <= (C_A(3) and C_B(3)) or (S_C(2) and (C_A(3) xor C_B(3))); 
    
    C_S(0) <= C_A(0) xor C_B(0) xor C_cin   ;
    C_S(1) <= C_A(1) xor C_B(1) xor S_C(0);
    C_S(2) <= C_A(2) xor C_B(2) xor S_C(1);
    C_S(3) <= C_A(3) xor C_B(3) xor S_C(2);
    
    S_P(0) <= C_A(0) xor C_B(0);
    S_P(1) <= C_A(1) xor C_B(1);
    S_P(2) <= C_A(2) xor C_B(2);
    S_P(3) <= C_A(3) xor C_B(3);

    Skip <=  S_P(0) and S_P(1) and S_P(2) and S_P(3);
    C_cout <= S_C(3) when Skip = '0' else '0';
    C_P <= Skip;
    -- with Skip select
    -- C_cout <= C_cin when  '1', 
    --         S_C(3) when others;

end juve3dstudio;