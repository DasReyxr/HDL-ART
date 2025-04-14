library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.ALL;

--------- Pin/out ---------
entity CarrySave is
	port
		(
        IN1,IN2,IN3   : in std_logic_vector(15 downto 0);
		S,sCarry   : out std_logic_vector(15 downto 0)
        );
end CarrySave;
architecture juve3dstudio of CarrySave is
signal C : std_logic_vector(15 downto 0);  -- Adjusted to 8 downto 0
begin
    S <= (IN1 xor IN2) xor IN3; 
    C <= (IN1 and IN2) or ( IN1 and IN3) or (IN2 and IN3);
	 sCarry <= C(14 downto 0) & '0';

end juve3dstudio;