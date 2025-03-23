library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity MULTISIGMAG is
Port (Q : in STD_LOGIC_VECTOR(7 downto 0);
      M: in  std_logic_VECTOR(7 downto 0);
      P:out std_logic_VECTOR(15 downto 0));
end MULTISIGMAG;

architecture Behavioral of MULTISIGMAG is
signal signe,TRASH: std_logic;
signal cpp0,cpp1,cpp2,cpp3,cpp4,cpp5,cpp6,cpp7 :std_logic_vector(7 downto 0);
signal spp :std_logic_vector(48 downto 0);
component PRODPAR 
Port (Q : in STD_LOGIC;
      M: in  std_logic;
      PP: in  std_logic;
      CIN: in std_logic;
      COUT:out std_logic;
		SP : out std_logic);
end component;
begin
signe<=Q(7) xor M(7);--esto es el signo
pPAR0: ProdPar port map(Q=>Q(0), M=>M(0) ,PP=>'0' ,CIN=>'0' ,COUT=>cpp0(0) ,SP=>P(0));
pPAR1: ProdPar port map(Q=>Q(0), M=>M(1) ,PP=>'0' ,CIN=>cpp0(0) ,COUT=>cpp0(1) ,SP=>spp(0));
pPAR2: ProdPar port map(Q=>Q(0), M=>M(2) ,PP=>'0' ,CIN=>cpp0(1) ,COUT=>cpp0(2) ,SP=>spp(1));
pPAR3: ProdPar port map(Q=>Q(0), M=>M(3) ,PP=>'0' ,CIN=>cpp0(2) ,COUT=>cpp0(3) ,SP=>spp(2));
pPAR5: ProdPar port map(Q=>Q(0), M=>M(4) ,PP=>'0' ,CIN=>cpp0(3) ,COUT=>cpp0(4) ,SP=>spp(3));
pPAR6: ProdPar port map(Q=>Q(0), M=>M(5) ,PP=>'0' ,CIN=>cpp0(4) ,COUT=>cpp0(5) ,SP=>spp(4));
pPAR7: ProdPar port map(Q=>Q(0), M=>M(6) ,PP=>'0' ,CIN=>cpp0(5) ,COUT=>cpp0(6) ,SP=>spp(5));
pPAR8: ProdPar port map(Q=>Q(0), M=>'0' ,PP=>'0' ,CIN=>cpp0(6) ,COUT=>cpp0(7) ,SP=>spp(6));
--parte 2
pPAR9: ProdPar port map(Q=>Q(1), M=>M(0) ,PP=>spp(0) ,CIN=>'0' ,COUT=>cpp1(0) ,SP=>P(1));
pPAR10: ProdPar port map(Q=>Q(1), M=>M(1) ,PP=>spp(1) ,CIN=>cpp1(0) ,COUT=>cpp1(1) ,SP=>spp(7));
pPAR11: ProdPar port map(Q=>Q(1), M=>M(2) ,PP=>spp(2) ,CIN=>cpp1(1) ,COUT=>cpp1(2) ,SP=>spp(8));
pPAR12: ProdPar port map(Q=>Q(1), M=>M(3) ,PP=>spp(3) ,CIN=>cpp1(2) ,COUT=>cpp1(3) ,SP=>spp(9));
pPAR13: ProdPar port map(Q=>Q(1), M=>M(4) ,PP=>spp(4) ,CIN=>cpp1(3) ,COUT=>cpp1(4) ,SP=>spp(10));
pPAR14: ProdPar port map(Q=>Q(1), M=>M(5) ,PP=>spp(5) ,CIN=>cpp1(4) ,COUT=>cpp1(5) ,SP=>spp(11));
pPAR15: ProdPar port map(Q=>Q(1), M=>M(6) ,PP=>spp(6) ,CIN=>cpp1(5) ,COUT=>cpp1(6) ,SP=>spp(12));
pPAR16: ProdPar port map(Q=>Q(1), M=>'0' ,PP=>cpp0(7) ,CIN=>cpp1(6) ,COUT=>cpp1(7) ,SP=>spp(13));
--parte 3
pPAR17: ProdPar port map(Q=>Q(2), M=>M(0) ,PP=>spp(7) ,CIN=>'0' ,COUT=>cpp2(0) ,SP=>P(2));
pPAR18: ProdPar port map(Q=>Q(2), M=>M(1) ,PP=>spp(8) ,CIN=>cpp2(0) ,COUT=>cpp2(1) ,SP=>spp(14));
pPAR19: ProdPar port map(Q=>Q(2), M=>M(2) ,PP=>spp(9) ,CIN=>cpp2(1) ,COUT=>cpp2(2) ,SP=>spp(15));
pPAR20: ProdPar port map(Q=>Q(2), M=>M(3) ,PP=>spp(10) ,CIN=>cpp2(2) ,COUT=>cpp2(3) ,SP=>spp(16));
pPAR21: ProdPar port map(Q=>Q(2), M=>M(4) ,PP=>spp(11) ,CIN=>cpp2(3) ,COUT=>cpp2(4) ,SP=>spp(17));
pPAR22: ProdPar port map(Q=>Q(2), M=>M(5) ,PP=>spp(12) ,CIN=>cpp2(4) ,COUT=>cpp2(5) ,SP=>spp(18));
pPAR23: ProdPar port map(Q=>Q(2), M=>M(6) ,PP=>spp(13) ,CIN=>cpp2(5) ,COUT=>cpp2(6) ,SP=>spp(19));
pPAR24: ProdPar port map(Q=>Q(2), M=>'0' ,PP=>cpp1(7) ,CIN=>cpp2(6) ,COUT=>cpp2(7) ,SP=>spp(20));
--parte4
pPAR25: ProdPar port map(Q=>Q(3), M=>M(0) ,PP=>spp(14) ,CIN=>'0' ,COUT=>cpp3(0) ,SP=>P(3));
pPAR26: ProdPar port map(Q=>Q(3), M=>M(1) ,PP=>spp(15) ,CIN=>cpp3(0) ,COUT=>cpp3(1) ,SP=>spp(21));
pPAR27: ProdPar port map(Q=>Q(3), M=>M(2) ,PP=>spp(16) ,CIN=>cpp3(1) ,COUT=>cpp3(2) ,SP=>spp(22));
pPAR28: ProdPar port map(Q=>Q(3), M=>M(3) ,PP=>spp(17) ,CIN=>cpp3(2) ,COUT=>cpp3(3) ,SP=>spp(23));
pPAR29: ProdPar port map(Q=>Q(3), M=>M(4) ,PP=>spp(18) ,CIN=>cpp3(3) ,COUT=>cpp3(4) ,SP=>spp(24));
pPAR30: ProdPar port map(Q=>Q(3), M=>M(5) ,PP=>spp(19) ,CIN=>cpp3(4) ,COUT=>cpp3(5) ,SP=>spp(25));
pPAR31: ProdPar port map(Q=>Q(3), M=>M(6) ,PP=>spp(20) ,CIN=>cpp3(5) ,COUT=>cpp3(6) ,SP=>spp(26));
pPAR32: ProdPar port map(Q=>Q(3), M=>'0' ,PP=>cpp2(7) ,CIN=>cpp3(6) ,COUT=>cpp3(7) ,SP=>spp(27));
--PARTE5
pPAR33: ProdPar port map(Q=>Q(4), M=>M(0) ,PP=>spp(21) ,CIN=>'0' ,COUT=>cpp4(0) ,SP=>P(4));
pPAR34: ProdPar port map(Q=>Q(4), M=>M(1) ,PP=>spp(22) ,CIN=>cpp4(0) ,COUT=>cpp4(1) ,SP=>spp(28));
pPAR35: ProdPar port map(Q=>Q(4), M=>M(2) ,PP=>spp(23) ,CIN=>cpp4(1) ,COUT=>cpp4(2) ,SP=>spp(29));
pPAR37: ProdPar port map(Q=>Q(4), M=>M(3) ,PP=>spp(24) ,CIN=>cpp4(2) ,COUT=>cpp4(3) ,SP=>spp(30));
pPAR38: ProdPar port map(Q=>Q(4), M=>M(4) ,PP=>spp(25) ,CIN=>cpp4(3) ,COUT=>cpp4(4) ,SP=>spp(31));
pPAR39: ProdPar port map(Q=>Q(4), M=>M(5) ,PP=>spp(26) ,CIN=>cpp4(4) ,COUT=>cpp4(5) ,SP=>spp(32));
pPAR40: ProdPar port map(Q=>Q(4), M=>M(6) ,PP=>spp(27) ,CIN=>cpp4(5) ,COUT=>cpp4(6) ,SP=>spp(33));
pPAR41: ProdPar port map(Q=>Q(4), M=>'0' ,PP=>cpp3(7) ,CIN=>cpp4(6) ,COUT=>cpp4(7) ,SP=>spp(34));
--PARTE6
pPA42: ProdPar port map(Q=>Q(5), M=>M(0) ,PP=>spp(28) ,CIN=>'0' ,COUT=>cpp5(0) ,SP=>P(5));
pPAR43: ProdPar port map(Q=>Q(5), M=>M(1) ,PP=>spp(29) ,CIN=>cpp5(0) ,COUT=>cpp5(1) ,SP=>spp(35));
pPAR44: ProdPar port map(Q=>Q(5), M=>M(2) ,PP=>spp(30) ,CIN=>cpp5(1) ,COUT=>cpp5(2) ,SP=>spp(36));
pPAR45: ProdPar port map(Q=>Q(5), M=>M(3) ,PP=>spp(31) ,CIN=>cpp5(2) ,COUT=>cpp5(3) ,SP=>spp(37));
pPAR46: ProdPar port map(Q=>Q(5), M=>M(4) ,PP=>spp(32) ,CIN=>cpp5(3) ,COUT=>cpp5(4) ,SP=>spp(38));
pPAR47: ProdPar port map(Q=>Q(5), M=>M(5) ,PP=>spp(33) ,CIN=>cpp5(4) ,COUT=>cpp5(5) ,SP=>spp(39));
pPAR48: ProdPar port map(Q=>Q(5), M=>M(6) ,PP=>spp(34) ,CIN=>cpp5(5) ,COUT=>cpp5(6) ,SP=>spp(40));
pPAR49: ProdPar port map(Q=>Q(5), M=>'0' ,PP=>cpp4(7) ,CIN=>cpp5(6) ,COUT=>cpp5(7) ,SP=>spp(41));
--PARTE7
pPAR50: ProdPar port map(Q=>Q(6), M=>M(0) ,PP=>spp(35) ,CIN=>'0' ,COUT=>cpp6(0) ,SP=>P(6));
pPAR51: ProdPar port map(Q=>Q(6), M=>M(1) ,PP=>spp(36) ,CIN=>cpp6(0) ,COUT=>cpp6(1) ,SP=>spp(42));
pPAR52: ProdPar port map(Q=>Q(6), M=>M(2) ,PP=>spp(37) ,CIN=>cpp6(1) ,COUT=>cpp6(2) ,SP=>spp(43));
pPAR53: ProdPar port map(Q=>Q(6), M=>M(3) ,PP=>spp(38) ,CIN=>cpp6(2) ,COUT=>cpp6(3) ,SP=>spp(44));
pPAR54: ProdPar port map(Q=>Q(6), M=>M(4) ,PP=>spp(39) ,CIN=>cpp6(3) ,COUT=>cpp6(4) ,SP=>spp(45));
pPAR55: ProdPar port map(Q=>Q(6), M=>M(5) ,PP=>spp(40) ,CIN=>cpp6(4) ,COUT=>cpp6(5) ,SP=>spp(46));
pPAR56: ProdPar port map(Q=>Q(6), M=>M(6) ,PP=>spp(41) ,CIN=>cpp6(5) ,COUT=>cpp6(6) ,SP=>spp(47));
pPAR57: ProdPar port map(Q=>Q(6), M=>'0' ,PP=>cpp5(7) ,CIN=>cpp6(6) ,COUT=>cpp6(7) ,SP=>spp(48));
--PARTE8
pPAR58: ProdPar port map(Q=>'0', M=>M(0) ,PP=>spp(42) ,CIN=>'0' ,COUT=>cpp7(0) ,SP=>P(7));
pPAR59: ProdPar port map(Q=>'0', M=>M(1) ,PP=>spp(43) ,CIN=>cpp7(0) ,COUT=>cpp7(1) ,SP=>P(8));
pPAR60: ProdPar port map(Q=>'0', M=>M(2) ,PP=>spp(44) ,CIN=>cpp7(1) ,COUT=>cpp7(2) ,SP=>P(9));
pPAR61: ProdPar port map(Q=>'0', M=>M(3) ,PP=>spp(45) ,CIN=>cpp7(2) ,COUT=>cpp7(3) ,SP=>P(10));
pPAR62: ProdPar port map(Q=>'0', M=>M(4) ,PP=>spp(46) ,CIN=>cpp7(3) ,COUT=>cpp7(4) ,SP=>P(11));
pPAR63: ProdPar port map(Q=>'0', M=>M(5) ,PP=>spp(47) ,CIN=>cpp7(4) ,COUT=>cpp7(5) ,SP=>P(12));
pPAR64: ProdPar port map(Q=>'0', M=>M(6) ,PP=>spp(48) ,CIN=>cpp7(5) ,COUT=>cpp7(6) ,SP=>P(13));
pPAR65: ProdPar port map(Q=>'0', M=>'0' ,PP=>cpp6(7) ,CIN=>cpp7(6) ,COUT=>TRASH ,SP=>P(14));

P(15)<=signe;
end Behavioral;
