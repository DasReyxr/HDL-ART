library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Comp is
	port (
        MC : in std_logic_vector(7 downto 0);
        C_S    : out std_logic_vector(7 downto 0)
	);
end Comp;

architecture bobo of Comp is

signal Carry : std_logic_vector(8 downto 0);
signal B     : std_logic_vector(7 downto 0);
signal Comp_M : std_logic_vector(7 downto 0);

begin
	 Comp_M <= NOT(MC);
    B <= "00000000";
    Carry(0) <= '1';

    C_S(0)  <= Comp_M(0) XOR B(0) XOR Carry(0);
    Carry(1) <= (Comp_M(0) AND B(0)) OR (Carry(0) AND (Comp_M(0) XOR B(0)));

    C_S(1)  <= Comp_M(1) XOR B(1) XOR Carry(1);
    Carry(2) <= (Comp_M(1) AND B(1)) OR (Carry(1) AND (Comp_M(1) XOR B(1)));

    C_S(2)  <= Comp_M(2) XOR B(2) XOR Carry(2);
    Carry(3) <= (Comp_M(2) AND B(2)) OR (Carry(2) AND (Comp_M(2) XOR B(2)));

    C_S(3)  <= Comp_M(3) XOR B(3) XOR Carry(3);
    Carry(4) <= (Comp_M(3) AND B(3)) OR (Carry(3) AND (Comp_M(3) XOR B(3)));

    C_S(4)  <= Comp_M(4) XOR B(4) XOR Carry(4);
    Carry(5) <= (Comp_M(4) AND B(4)) OR (Carry(4) AND (Comp_M(4) XOR B(4)));

    C_S(5)  <= Comp_M(5) XOR B(5) XOR Carry(5);
    Carry(6) <= (Comp_M(5) AND B(5)) OR (Carry(5) AND (Comp_M(5) XOR B(5)));

    C_S(6)  <= Comp_M(6) XOR B(6) XOR Carry(6);
    Carry(7) <= (Comp_M(6) AND B(6)) OR (Carry(6) AND (Comp_M(6) XOR B(6)));

    C_S(7)  <= Comp_M(7) XOR B(7) XOR Carry(7);	
end bobo;
