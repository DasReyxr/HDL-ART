----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:48:46 02/26/2025 
-- Design Name: 
-- Module Name:    PRODPAR - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity PRODPAR is
Port (Q : in STD_LOGIC;
      M: in  std_logic;
      PP: in  std_logic;
      CIN: in std_logic;
      COUT:out std_logic;
		SP : out std_logic);
end PRODPAR;

architecture Behavioral of PRODPAR is
component FULLA
Port (A : in STD_LOGIC;
      B: in  std_logic;
      CIN: in std_logic;
      COUT:out std_logic;
		S : out std_logic);
end component;
signal SAND: std_logic ;
begin
SAND<=Q AND M;
U1: FULLA port map
(A=>SAND,B=>PP,CIN=>CIN,COUT=>COUT,S=>SP);

end Behavioral;

