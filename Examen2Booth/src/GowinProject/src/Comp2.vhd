library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Comp2 is
	port (
        MC : in std_logic_vector(15 downto 0);
        C_S : out std_logic_vector(15 downto 0));
end Comp2;

architecture bobo of Comp2 is

signal Carry : std_logic_vector(16 downto 0);
signal B : std_logic_vector(15 downto 0);
signal Comp_M : std_logic_vector(15 downto 0);

begin
	Comp_M <= NOT(MC);
    B <= "0000000000000001";
    Carry(0) <= '0';

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
    Carry(8) <= (Comp_M(7) AND B(7)) OR (Carry(7) AND (Comp_M(7) XOR B(7)));

    C_S(8)  <= Comp_M(8) XOR B(8) XOR Carry(8);
    Carry(9) <= (Comp_M(8) AND B(8)) OR (Carry(8) AND (Comp_M(8) XOR B(8)));

    C_S(9)  <= Comp_M(9) XOR B(9) XOR Carry(9);
    Carry(10) <= (Comp_M(9) AND B(9)) OR (Carry(9) AND (Comp_M(9) XOR B(9)));

    C_S(10)  <= Comp_M(10) XOR B(10) XOR Carry(10);
    Carry(11) <= (Comp_M(10) AND B(10)) OR (Carry(10) AND (Comp_M(10) XOR B(10)));

    C_S(11)  <= Comp_M(11) XOR B(11) XOR Carry(11);
    Carry(12) <= (Comp_M(11) AND B(11)) OR (Carry(11) AND (Comp_M(11) XOR B(11)));

    C_S(12)  <= Comp_M(12) XOR B(12) XOR Carry(12);
    Carry(13) <= (Comp_M(12) AND B(12)) OR (Carry(12) AND (Comp_M(12) XOR B(12)));

    C_S(13)  <= Comp_M(13) XOR B(13) XOR Carry(13);
    Carry(14) <= (Comp_M(13) AND B(13)) OR (Carry(13) AND (Comp_M(13) XOR B(13)));

    C_S(14)  <= Comp_M(14) XOR B(14) XOR Carry(14);
    Carry(15) <= (Comp_M(14) AND B(14)) OR (Carry(14) AND (Comp_M(14) XOR B(14)));

    C_S(15)  <= Comp_M(15) XOR B(15) XOR Carry(15);
end bobo;

