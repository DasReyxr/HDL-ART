----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:50:32 02/26/2025 
-- Design Name: 
-- Module Name:    FULLA - Behavioral 
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


entity FULLA is
Port (A : in STD_LOGIC;
      B: in  std_logic;
      CIN: in  std_logic;
      COUT: out std_logic;
      S:out std_logic);
end FULLA;

architecture Behavioral of FULLA is

begin
COUT<=(A AND B) OR (CIN AND (A XOR B));
S<=A XOR B XOR CIN;
end Behavioral;

