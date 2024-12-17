

-------- Testbench --------
------ Orlando Reyes ------
--------- Auf Das ---------
--------- LedMatrix ---------
-------- 5/12/2024 --------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb is
end tb;

architecture sim of tb is

component LedMatrix
	port 
    (
		CLK	: in std_logic;
		CS, CLK2, DIN	: out std_logic
    );
end component;

signal S_Clk : std_logic := '0';

signal S_CS : std_logic := '0';
signal S_CLK2 : std_logic := '0';
signal S_DIN : std_logic := '0';

begin
	uut: LedMatrix port map (S_Clk, S_CS, S_CLK2, S_DIN);

	process
	begin

        S_Clk <= '0';
        wait for 37 ns;

        S_Clk <= '1';
        wait for 37 ns;
	end process;

end sim;