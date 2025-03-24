library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity MULTICOM is
Port (Q : in STD_LOGIC_VECTOR(3 downto 0);
      M: in  std_logic_VECTOR(3 downto 0);
      CIN: in  std_logic;
      COUT: out std_logic;
      P:out std_logic_VECTOR(7 downto 0));
end MULTICOM;

architecture Behavioral of MULTICOM is
signal cpp0,cpp1,cpp2,cpp3 :std_logic_vector(3 downto 0);
signal spp :std_logic_vector(9 downto 0);
signal signQ, signM,signP : std_logic;
component PRODPAR 
Port (Q : in STD_LOGIC;
      M: in  std_logic;
      PP: in  std_logic;
      CIN: in std_logic;
      COUT:out std_logic;
		SP : out std_logic);
end component;
begin
      signQ <= Q(3);
      signM <= M(3);
      signP <= singQ xor signM;

      pPAR0: ProdPar port map(Q=>Q(0), M=>M(0) ,PP=>'0' ,CIN=>'0' ,COUT=>cpp0(0) ,SP=>P(0));
      pPAR1: ProdPar port map(Q=>Q(0), M=>M(1) ,PP=>'0' ,CIN=>cpp0(0) ,COUT=>cpp0(1) ,SP=>spp(0));
      pPAR2: ProdPar port map(Q=>Q(0), M=>M(2) ,PP=>'0' ,CIN=>cpp0(1) ,COUT=>cpp0(2) ,SP=>spp(1));
      pPAR3: ProdPar port map(Q=>Q(0), M=>'0' ,PP=>'0' ,CIN=>cpp0(2) ,COUT=>cpp0(3) ,SP=>spp(2));
      --parte 2
      pPAR4: ProdPar port map(Q=>Q(1), M=>M(0) ,PP=>spp(0) ,CIN=>'0' ,COUT=>cpp1(0) ,SP=>P(1));
      pPAR5: ProdPar port map(Q=>Q(1), M=>M(1) ,PP=>spp(1) ,CIN=>cpp1(0) ,COUT=>cpp1(1) ,SP=>spp(0));
      pPAR6: ProdPar port map(Q=>Q(1), M=>M(2) ,PP=>spp(2) ,CIN=>cpp1(1) ,COUT=>cpp1(2) ,SP=>spp(1));
      pPAR7: ProdPar port map(Q=>Q(1), M=>'0' ,PP=> ,CIN=>cpp1(2) ,COUT=>cpp1(3) ,SP=>spp(2));
      --parte 3
      pPAR8: ProdPar port map(Q=>Q(2), M=>M(0) ,PP=>'0' ,CIN=>'0' ,COUT=>cpp2(0) ,SP=>P(0));
      pPAR9: ProdPar port map(Q=>Q(2), M=>M(1) ,PP=>'0' ,CIN=>cpp2(0) ,COUT=>cpp2(1) ,SP=>spp(0));
      pPAR10: ProdPar port map(Q=>Q(2), M=>M(2) ,PP=>'0' ,CIN=>cpp2(1) ,COUT=>cpp2(2) ,SP=>spp(1));
      pPAR11: ProdPar port map(Q=>Q(2), M=>'0' ,PP=>'0' ,CIN=>cpp2(2) ,COUT=>cpp2(3) ,SP=>spp(2));
      --parte4
      pPAR12: ProdPar port map(Q=>'0', M=>M(0) ,PP=>'0' ,CIN=>'0' ,COUT=>cpp3(0) ,SP=>P(0));
      pPAR13: ProdPar port map(Q=>'0', M=>M(1) ,PP=>'0' ,CIN=>cpp3(0) ,COUT=>cpp3(1) ,SP=>spp(0));
      pPAR14: ProdPar port map(Q=>'0', M=>M(2) ,PP=>'0' ,CIN=>cpp3(1) ,COUT=>cpp3(2) ,SP=>spp(1));
      pPAR15: ProdPar port map(Q=>'0', M=>'0' ,PP=>'0' ,CIN=>cpp3(2) ,COUT=>cpp0(3) ,SP=>spp(2));

      P(7) <= signP; 
      end Behavioral;

