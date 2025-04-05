library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--------- Pin/out ---------
entity MultiplierSigned is
    Port (
        signQ, signM : in std_logic;
        RQ, RM : in STD_LOGIC_VECTOR(7 downto 0);
        Sign : out std_logic;
        P : out std_logic_vector(15 downto 0)
    );
end MultiplierSigned;

architecture bobo of MultiplierSigned is

signal PP0,PP1,PP2,PP3,PP4,PP5,PP6,PP7,PP8,PP9,PP10,PP11,PP12,PP13,PP14,PP15 : std_logic_vector(15 downto 0);
signal P0,P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15: std_logic_vector(15 downto 0);
signal Q, M,Res_P, SigneP, SigneQ, SigneM :  STD_LOGIC_VECTOR(15 downto 0);
signal signP : std_logic;
signal carry : std_logic_vector(16 downto 0);

component VectorMult
      port (
      -- In --
      C_B, C_M : in std_logic_vector(15 downto 0);
      C_Q : in std_logic;
      -- Out --
      C_Cout : out std_logic;
      C_P : out std_logic_vector(15 downto 0)
      );
end component;

component Comp2
      port (
			MC : in std_logic_vector(15 downto 0);
        C_S : out std_logic_vector(15 downto 0));
end component;

begin
      -- Sign Extension --
      with signQ select
      Q <= x"00" & RQ when '0',
            SigneQ when others;

      with signM select
      M <= x"00" & RM when '0',
            SigneM when others;

      with signP select
      P <=  Res_P when '0',
            SigneP when others;

      -- Partial Products --
        PP0 <= (others => '0');
		PP1 <= carry(0) & P0(15 downto 1);
		PP2 <= carry(1) & P1(15 downto 1);
		PP3 <= carry(2) & P2(15 downto 1);
		PP4 <= carry(3) & P3(15 downto 1);
		PP5 <= carry(4) & P4(15 downto 1);
		PP6 <= carry(5) & P5(15 downto 1);
		PP7 <= carry(6) & P6(15 downto 1);
		PP8 <= carry(7) & P7(15 downto 1);
		PP9 <= carry(8) & P8(15 downto 1);
		PP10 <= carry(9) & P9(15 downto 1);
		PP11 <= carry(10) & P10(15 downto 1);
		PP12 <= carry(11) & P11(15 downto 1);
		PP13 <= carry(12) & P12(15 downto 1);
		PP14 <= carry(13) & P13(15 downto 1);
        PP15 <= carry(14) & P14(15 downto 1);

		C0: Comp2 port map( MC => x"00" & RQ, C_s => SigneQ);
		C1: Comp2 port map( MC => x"00" & RM, C_s => SigneM);
		C2: Comp2 port map( MC => Res_P, C_s => SigneP);

		V0: VectorMult port map( C_B => PP0, C_M => M, C_Q => Q(0), C_Cout => carry(0), C_P => P0);
		V1: VectorMult port map( C_B => PP1, C_M => M, C_Q => Q(1), C_Cout => carry(1), C_P => P1);
		V2: VectorMult port map( C_B => PP2, C_M => M, C_Q => Q(2), C_Cout => carry(2), C_P => P2);
		V3: VectorMult port map( C_B => PP3, C_M => M, C_Q => Q(3), C_Cout => carry(3), C_P => P3);
		V4: VectorMult port map( C_B => PP4, C_M => M, C_Q => Q(4), C_Cout => carry(4), C_P => P4);
		V5: VectorMult port map( C_B => PP5, C_M => M, C_Q => Q(5), C_Cout => carry(5), C_P => P5);
		V6: VectorMult port map( C_B => PP6, C_M => M, C_Q => Q(6), C_Cout => carry(6), C_P => P6);
		V7: VectorMult port map( C_B => PP7, C_M => M, C_Q => Q(7), C_Cout => carry(7), C_P => P7);

        V8:  VectorMult port map( C_B => PP8,  C_M => M, C_Q => Q(8),  C_Cout => carry(8),  C_P => P8);
		V9:  VectorMult port map( C_B => PP9,  C_M => M, C_Q => Q(9),  C_Cout => carry(9),  C_P => P9);
		V10: VectorMult port map( C_B => PP10, C_M => M, C_Q => Q(10), C_Cout => carry(10), C_P => P10);
		V11: VectorMult port map( C_B => PP11, C_M => M, C_Q => Q(11), C_Cout => carry(11), C_P => P11);
		V12: VectorMult port map( C_B => PP12, C_M => M, C_Q => Q(12), C_Cout => carry(12), C_P => P12);
		V13: VectorMult port map( C_B => PP13, C_M => M, C_Q => Q(13), C_Cout => carry(13), C_P => P13);
		V14: VectorMult port map( C_B => PP14, C_M => M, C_Q => Q(14), C_Cout => carry(14), C_P => P14);
		V15: VectorMult port map( C_B => PP15, C_M => M, C_Q => Q(15), C_Cout => carry(15), C_P => P15);

        Res_P <= P15(0) & P14(0) & P13(0) & P12(0) & P11(0) & P10(0) & P9(0) & P8(0) & P7(0) & P6(0) & P5(0) & P4(0) & P3(0) & P2(0) & P1(0) & P0(0);

        signP <= signQ xor signM;
	    Sign <= not(signP); --Para la tang
end bobo;