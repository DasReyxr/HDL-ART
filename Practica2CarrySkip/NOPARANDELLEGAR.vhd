----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
-------- Sumador 2 Bits --------
-------- 04/02/2025 --------
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--------- Pin/out ---------
entity Adder16CS is
	port
		(
		A,B: in std_logic_vector(15 downto 0);
		Cout: out std_logic;
        S : out std_logic_vector(15 downto 0)
        );
end Adder16CS;

architecture juve3dstudio of Adder16CS is


component CarrySkip4
	
	port
		(
			C_A, C_B: in std_logic_vector(3 downto 0);
			C_S: out std_logic_vector(3 downto 0);
            C_cin : in std_logic;
            C_cout : out std_logic
        );
end component;

signal S_P: std_logic_vector(15 downto 0):= (others => '0');
signal S_C: std_logic_vector(14 downto 0):= (others => '0') ;
signal Zero : std_logic := '0';
signal CarrySkip, S_COUT : std_logic := '0';
begin
     
    U0: CarrySkip4 port map(C_A => A(3  downto 0)  , C_B => B(3  downto 0)  , C_S => S(3  downto 0)  , C_Cin => Zero   , C_Cout => S_C(3) );
    U1: CarrySkip4 port map(C_A => A(7  downto 4)  , C_B => B(7  downto 4)  , C_S => S(7  downto 4)  , C_Cin => S_C(3) , C_Cout =>S_C(7) );
    U2: CarrySkip4 port map(C_A => A(11 downto 8)  , C_B => B(11 downto 8)  , C_S => S(11 downto 8)  , C_Cin => S_C(7) , C_Cout =>S_C(11) );
    U3: CarrySkip4 port map(C_A => A(15 downto 12) , C_B => B(15 downto 12) , C_S => S(15 downto 12) , C_Cin => S_C(13), C_Cout =>Cout);


    CarrySkip <=  S_P(0) and S_P(1) and S_P(2) and S_P(3) and S_P(4) and 
                    S_P(5) and S_P(6) and S_P(7) and S_P(8) and S_P(9) and 
                    S_P(10) and S_P(11);

    COUT <= S_COUT when CarrySkip = '0' else '0';


end juve3dstudio;
