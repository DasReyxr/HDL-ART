----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
------- Multiplier -------
-------- 28/02/2025 --------
------- Main Library -------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--------- Pin/out ---------
entity Multiplier is
Port (
      Q,M : in STD_LOGIC_VECTOR(7 downto 0);
      COUT: out std_logic;
      P:out std_logic_VECTOR(14 downto 0));
end Multiplier;

architecture juve3dstudio of Multiplier is
signal P0,P1,P2,P3,P4,P5,P6,P7 :std_logic_vector(7 downto 0);
signal CB0, CB1, CB2, CB3, CB4, CB5, CB6, CB7, CB8 : std_logic_vector(7 downto 0);
signal signQ,signM : std_logic ;
signal S_Result :std_logic_vector(9 downto 0);
signal carry : std_logic_vector(8 downto 0);

component VectorMult 
      port
      (
      -- In --
      C_B, C_M : in std_logic_vector(7 downto 0);
      C_Q : in std_logic;
      -- Out --
      C_Cout : out std_logic;
      C_P : out std_logic_vector(7 downto 0)
      );
end component;

      begin
      signQ <= Q(7);
      signM <= M(7);
      cout <= signQ xor signM;
      
      CB0 <= x"00";
      CB1 <= carry(0) & P0(7 downto 1);
      CB2 <= carry(1) & P1(7 downto 1);
      CB3 <= carry(2) & P2(7 downto 1);
      CB4 <= carry(3) & P3(7 downto 1);
      CB5 <= carry(4) & P4(7 downto 1);
      CB6 <= carry(5) & P5(7 downto 1);
      CB7 <= carry(6) & P6(7 downto 1);
      CB8 <= '0' & M(6 downto 0);

      
      V0: VectorMult port map( C_B => CB0 , C_M => CB8, C_Q => Q(0), C_Cout => carry(0), C_P => P0);
      V1: VectorMult port map( C_B => CB1 , C_M => CB8, C_Q => Q(1), C_Cout => carry(1), C_P => P1);
      V2: VectorMult port map( C_B => CB2 , C_M => CB8, C_Q => Q(2), C_Cout => carry(2), C_P => P2);
      V3: VectorMult port map( C_B => CB3 , C_M => CB8, C_Q => Q(3), C_Cout => carry(3), C_P => P3);
      V4: VectorMult port map( C_B => CB4 , C_M => CB8, C_Q => Q(4), C_Cout => carry(4), C_P => P4);
      V5: VectorMult port map( C_B => CB5 , C_M => CB8, C_Q => Q(5), C_Cout => carry(5), C_P => P5);
      V6: VectorMult port map( C_B => CB6 , C_M => CB8, C_Q => Q(6), C_Cout => carry(6), C_P => P6);
      V7: VectorMult port map( C_B => CB7 , C_M => CB8, C_Q => '0' , C_Cout => carry(7), C_P => P7);

      
	P <= '0' & P7(6 downto 0) & P6(0) & P5(0) & P4(0) & P3(0) & P2(0) & P1(0) & P0(0);

end juve3dstudio;