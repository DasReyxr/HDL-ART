-------- Testbench --------
------ Orlando Reyes ------
--------- Auf Das ---------
--------- Cancion ---------
-------- 29/10/2024 --------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb is
end tb;

architecture sim of tb is

component Cancion
	port 
    (
		CLK	: in std_logic;
        BuzzerOUT    : out std_logic
    );
end component;

signal S_Clk : std_logic := '0';
signal S_BuzzerOUT : std_logic := '0';

begin
	uut: Cancion port map (S_Clk, S_BuzzerOUT);

	process
	begin
        S_Clk <= '0';
        wait for 37 ns; 
        S_Clk <= '1';
        wait for 37 ns;
      
	end process;

end sim;