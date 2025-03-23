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


      begin
        P<= Q(6 downto 0) & M;
        COUT <= Q(7);
end juve3dstudio;