----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
-------- 1 Flipflop --------
-------- 13/08/2024 --------
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--------- Pin/out ---------
entity Flipflop is
    Port ( CLK : in  STD_LOGIC;
           D : in  STD_LOGIC;
           Q : out  STD_LOGIC
			 );
end Flipflop;


architecture juve3dstudio of Flipflop is

begin
 Q <= D when CLK'event and CLK = '0';
 
end juve3dstudio;
