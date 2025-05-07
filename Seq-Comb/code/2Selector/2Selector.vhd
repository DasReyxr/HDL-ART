---------  Code ------
-------- Orlando Contreras -------
----------- Reyes Das -------------

------------ 12/04/2024 ------------
----------- MAIN LIBRARY ----------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

----------- SET OUTPUTS ----------- 

entity Selector is
  port
  (
    A, B, S : in std_logic;
    Z       : out std_logic); -- C = Z1

end Selector;

architecture Behavioral of Selector is

begin
  Z <= (A and not s) or (B and S);
end Behavioral;