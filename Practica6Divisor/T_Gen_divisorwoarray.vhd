----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
---- Restoring Division ----
---- I date 06/05/2025 ----
---- C date 06/05/2025 ----
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Divisor8Bits is
    port (
        N, ED : in std_logic_vector(7 downto 0);
        SN, SD : in std_logic;
        Quot, gbg : out std_logic_vector(7 downto 0);
        Sq : out std_logic
    );
end;

architecture juve3dstudio of Divisor8Bits is

      component FullSub8
          port (
              A, B : in std_logic_vector(7 downto 0);
              Delta : out std_logic_vector(7 downto 0)
          );
      end component;
      type array8 is array (0 to 7) of std_logic_vector(7 downto 0);
      signal shiftedR, subR, R : array8 := (others => (others => '0'));
      signal gt : std_logic_vector(7 downto 0) := "00000000";

begin

    shiftedR(0) <= "0000000" & N(7);
    Div0: FullSub8 port map(A => shiftedR(0),B => ED,Delta => subR(0));
    gt(0) <= '1' when ED <= shiftedR(0) else '0';
    with gt(0) select
    R(0) <= subR(0) when '1',
        shiftedR(0) when others;

    gen_division: for i in 1 to 7 generate
    begin
    shiftedR(i) <= R(i-1)(6 downto 0) & N(7-i);
    Div: FullSub8 port map(A => shiftedR(i),B => ED,Delta => subR(i));
    gt(i) <= '1' when ED <= shiftedR(i) else '0';
    with gt(i) select
    R(i) <= subR(i) when '1',
        shiftedR(i) when others;
    end generate;

    Quot <= gt(0) & gt(1) & gt(2) & gt(3) & gt(4) & gt(5) & gt(6) & gt(7); -- Change order to 0 to 7
    gbg <= R(7);
    Sq <= SN xor SD;
end juve3dstudio;