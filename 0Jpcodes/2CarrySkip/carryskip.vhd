----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
-------- CarrySkip4 --------
-------- 10/02/2025 --------
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--------- Pin/out ---------
entity CarrySkip is
	port
		(
			A, B: in std_logic_vector(3 downto 0);
			S: out std_logic_vector(3 downto 0);
            cin : in std_logic;
            cout : out std_logic
        );
end CarrySkip;

architecture juve3dstudio of CarrySkip is
    signal S_P, S_C : std_logic_vector(3 downto 0);
    signal Skip : std_logic;
    begin
    -- Sumador LSB --
    S_C(0) <= (A(0) and B(0)) or (cin and (A(1) xor B(1)));  
    S_C(1) <= (A(1) and B(1)) or (S_C(0) and (A(1) xor B(1))); 
    S_C(2) <= (A(2) and B(2)) or (S_C(1) and (A(2) xor B(2))); 
    S_C(3) <= (A(3) and B(3)) or (S_C(2) and (A(3) xor B(3))); 
    
    S(0) <= A(0) xor B(0) xor cin   ;
    S(1) <= A(1) xor B(1) xor S_C(0);
    S(2) <= A(2) xor B(2) xor S_C(1);
    S(3) <= A(3) xor B(3) xor S_C(2);
    
    S_P(0) <= A(0) xor B(0);
    S_P(1) <= A(1) xor B(1);
    S_P(2) <= A(2) xor B(2);
    S_P(3) <= A(3) xor B(3);

    Skip <=  S_P(0) and S_P(1) and S_P(2) and S_P(3);
    cout <= S_C(3) when Skip = '0' else '0';

    -- with Skip select
    -- cout <= cin when  '1', 
    --         carry(3) when others;

end juve3dstudio;