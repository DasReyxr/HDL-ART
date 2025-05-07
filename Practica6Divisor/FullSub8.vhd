----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
---- Full Substracter8 ----
---- I date 06/05/2025 ----
---- C date 06/05/2025 ----
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FullSub8 is
    Port (
        A,B    : in  STD_LOGIC_VECTOR(7 downto 0);  
        Delta : out STD_LOGIC_VECTOR(7 downto 0)   
    );
end FullSub8;

architecture Behavioral of FullSub8 is
    signal Borrow : STD_LOGIC_VECTOR(7 downto 0);
begin
    Borrow(0) <= '0';
    Borrow(1) <= ((NOT A(0)) AND B(0)) OR ((NOT A(0)) AND Borrow(0)) OR (B(0) AND Borrow(0));
    Borrow(2) <= ((NOT A(1)) AND B(1)) OR ((NOT A(1)) AND Borrow(1)) OR (B(1) AND Borrow(1));
    Borrow(3) <= ((NOT A(2)) AND B(2)) OR ((NOT A(2)) AND Borrow(2)) OR (B(2) AND Borrow(2));
    Borrow(4) <= ((NOT A(3)) AND B(3)) OR ((NOT A(3)) AND Borrow(3)) OR (B(3) AND Borrow(3));
    Borrow(5) <= ((NOT A(4)) AND B(4)) OR ((NOT A(4)) AND Borrow(4)) OR (B(4) AND Borrow(4));
    Borrow(6) <= ((NOT A(5)) AND B(5)) OR ((NOT A(5)) AND Borrow(5)) OR (B(5) AND Borrow(5));
    Borrow(7) <= ((NOT A(6)) AND B(6)) OR ((NOT A(6)) AND Borrow(6)) OR (B(6) AND Borrow(6));
    --Borrow(8) <= ((NOT A(7)) AND B(7)) OR ((NOT A(7)) AND Borrow(7)) OR (B(7) AND Borrow(7));
    
    Delta(0) <= A(0) XOR B(0) XOR Borrow(0);
    Delta(1) <= A(1) XOR B(1) XOR Borrow(1);
    Delta(2) <= A(2) XOR B(2) XOR Borrow(2);
    Delta(3) <= A(3) XOR B(3) XOR Borrow(3);
    Delta(4) <= A(4) XOR B(4) XOR Borrow(4);
    Delta(5) <= A(5) XOR B(5) XOR Borrow(5);
    Delta(6) <= A(6) XOR B(6) XOR Borrow(6);
    Delta(7) <= A(7) XOR B(7) XOR Borrow(7);
    
end Behavioral;