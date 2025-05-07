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
  
      -- Signals for shifted values
      signal shiftedR0, shiftedR1, shiftedR2, shiftedR3, shiftedR4, shiftedR5, shiftedR6, shiftedR7 : std_logic_vector(7 downto 0) := (others => '0');
      -- Signals for subtracted values
      signal subR0, subR1, subR2, subR3, subR4, subR5, subR6, subR7 : std_logic_vector(7 downto 0) := (others => '0');
      -- Signals for remainder values
      signal R0, R1, R2, R3, R4, R5, R6, R7 : std_logic_vector(7 downto 0) := (others => '0');
      -- Signals for comparison results
      signal gt : std_logic_vector(7 downto 0) := "00000000";

      
begin

      -- Shifted values
      shiftedR0 <= "0000000" & N(7);
      shiftedR1 <= R0(6 downto 0) & N(6);
      shiftedR2 <= R1(6 downto 0) & N(5);
      shiftedR3 <= R2(6 downto 0) & N(4);
      shiftedR4 <= R3(6 downto 0) & N(3);
      shiftedR5 <= R4(6 downto 0) & N(2);
      shiftedR6 <= R5(6 downto 0) & N(1);
      shiftedR7 <= R6(6 downto 0) & N(0);

      -- Subtracted values
      Sub0: FullSub8 port map(A => shiftedR0,B => ED,Delta => subR0);
      Sub1: FullSub8 port map(A => shiftedR1,B => ED,Delta => subR1);
      Sub2: FullSub8 port map(A => shiftedR2,B => ED,Delta => subR2);
      Sub3: FullSub8 port map(A => shiftedR3,B => ED,Delta => subR3);
      Sub4: FullSub8 port map(A => shiftedR4,B => ED,Delta => subR4);
      Sub5: FullSub8 port map(A => shiftedR5,B => ED,Delta => subR5);
      Sub6: FullSub8 port map(A => shiftedR6,B => ED,Delta => subR6);
      Sub7: FullSub8 port map(A => shiftedR7,B => ED,Delta => subR7);


      -- Comparison results
      gt(0) <= '1' when ED <= shiftedR0 else '0';
      gt(1) <= '1' when ED <= shiftedR1 else '0';
      gt(2) <= '1' when ED <= shiftedR2 else '0';
      gt(3) <= '1' when ED <= shiftedR3 else '0';
      gt(4) <= '1' when ED <= shiftedR4 else '0';
      gt(5) <= '1' when ED <= shiftedR5 else '0';
      gt(6) <= '1' when ED <= shiftedR6 else '0';
      gt(7) <= '1' when ED <= shiftedR7 else '0';

      -- Remainder values
      with gt(0) select
      R0 <= subR0 when '1',
            shiftedR0 when others;

      with gt(1) select
      R1 <= subR1 when '1',
            shiftedR1 when others;

      with gt(2) select
      R2 <= subR2 when '1',
            shiftedR2 when others;

      with gt(3) select
      R3 <= subR3 when '1',
            shiftedR3 when others;

      with gt(4) select
      R4 <= subR4 when '1',
            shiftedR4 when others;

      with gt(5) select
      R5 <= subR5 when '1',
            shiftedR5 when others;

      with gt(6) select
      R6 <= subR6 when '1',
            shiftedR6 when others;

      with gt(7) select
      R7 <= subR7 when '1',
            shiftedR7 when others;


      -- Outputs
      Quot <= gt(0) & gt(1) & gt(2) & gt(3) & gt(4) & gt(5) & gt(6) & gt(7); -- Change order to 0 to 7
      gbg <= std_logic_vector(R7);
      Sq <= SN xor SD;
end juve3dstudio;