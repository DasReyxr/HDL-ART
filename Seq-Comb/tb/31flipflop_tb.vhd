-------- Testbench --------
------ Orlando Reyes ------
--------- Auf Das ---------
-------- 1 Flipflop --------
-------- 15/08/2024 --------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb is
end tb;

architecture sim of tb is

component Flipflop
	port 
	(
	  CLK : in  STD_LOGIC;
	  D : in  STD_LOGIC;
	  Q : out  STD_LOGIC
	);
end component;

signal  CLK_s, D_s, Q_s: std_logic;

begin

	uut: Flipflop port map (CLK_s, D_s, Q_s);

	process
	begin
		wait for 1 us;
		D_s <= '0';
		CLK_s <= '1';
		wait for 1 us;
		D_s <= '1';
		wait for 1 us;
		CLK_s <= '0';
		wait for 1 us;
		D_s <= '0';
		CLK_s <= '1';
		wait for 1 us;
		D_s <= '1';
		wait for 1 us;
		D_s <= '0';
		CLK_s <= '0';
		wait for 1 us;
		D_s <= '1';
		wait for 1 us;
		D_s <= '0';
		CLK_s <= '1';
		wait;
	end process;

end sim;