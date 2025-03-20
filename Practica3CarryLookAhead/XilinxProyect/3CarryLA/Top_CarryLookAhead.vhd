----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
---- Top_CarryLookAhead ----
-------- 17/02/2025 --------
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--------- Pin/out ---------
entity Top_CarryLookAhead is
	port
		(
		A,B : in std_logic_vector(15 downto 0);
        cout: out std_logic;
		S : out std_logic_vector (15 downto 0)
        );
end Top_CarryLookAhead;

architecture juve3dstudio of Top_CarryLookAhead is


component CP_CLA4Bits
	port
	(
	C_A,C_B : in std_logic_vector(3 downto 0);
	C_S : out std_logic_vector (3 downto 0);
	C_cin : in std_logic;
	C_cout: out std_logic
	);
end component;
signal S_C: std_logic_vector(14 downto 0):= (others => '0') ;
constant Zero : std_logic := '0'; 
begin
     
    U0: CP_CLA4Bits port map(C_A => A(3  downto 0)  , C_B => B(3  downto 0)  , C_S => S(3  downto 0)  , C_Cin => Zero   , C_Cout => S_C(3));
    U1: CP_CLA4Bits port map(C_A => A(7  downto 4)  , C_B => B(7  downto 4)  , C_S => S(7  downto 4)  , C_Cin => S_C(3) , C_Cout =>S_C(7));
    U2: CP_CLA4Bits port map(C_A => A(11 downto 8)  , C_B => B(11 downto 8)  , C_S => S(11 downto 8)  , C_Cin => S_C(7) , C_Cout =>S_C(11) );
    U3: CP_CLA4Bits port map(C_A => A(15 downto 12) , C_B => B(15 downto 12) , C_S => S(15 downto 12) , C_Cin => S_C(11), C_Cout =>S_C(14));

    cout <= S_C(14);
end juve3dstudio;
