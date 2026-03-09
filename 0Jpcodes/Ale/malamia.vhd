
output
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:26:41 02/16/2024 
-- Design Name: 
-- Module Name:    Multiplicador - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Multiplicador is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           O : out  STD_LOGIC_VECTOR (7 downto 0));
end Multiplicador;

architecture Behavioral of Multiplicador is
	signal PP1 : STD_LOGIC_VECTOR (3 downto 0);
	signal PP2 : STD_LOGIC_VECTOR (3 downto 0);
	signal PP3 : STD_LOGIC_VECTOR (3 downto 0);
	signal PP4 : STD_LOGIC_VECTOR (3 downto 0);
	signal S :  STD_LOGIC_VECTOR (5 downto 0);
	signal C : STD_LOGIC_VECTOR (10 downto 0);
begin

	PP1(0) <= A(0) AND B(0);
	PP1(1) <= A(1) AND B(0);
	PP1(2) <= A(2) AND B(0);
	PP1(3) <= A(3) AND B(0);
	
	PP2(0) <= A(0) AND B(1);
	PP2(1) <= A(1) AND B(1);
	PP2(2) <= A(2) AND B(1);
	PP2(3) <= A(3) AND B(1);
	
	PP3(0) <= A(0) AND B(2);
	PP3(1) <= A(1) AND B(2);
	PP3(2) <= A(2) AND B(2);
	PP3(3) <= A(3) AND B(2);
	
	PP4(0) <= A(0) AND B(3);
	PP4(1) <= A(1) AND B(3);
	PP4(2) <= A(2) AND B(3);
	PP4(3) <= A(3) AND B(3);
	
	O(0) <= PP1(0);
	
	O(1) <= PP2(0) XOR PP1(1);
	C(0) <= PP2(0) AND PP1(1);
	
	S(0) <= PP2(1) XOR PP1(2) XOR C(0);
	C(1) <= (PP2(1) AND PP1(2)) OR (C(0) AND (PP2(1) XOR PP1(2)));
	
	S(1) <= PP2(2) XOR PP1(3) XOR C(1);
	C(2) <= (PP2(2) AND PP1(3)) OR (C(1) AND (PP2(2) XOR PP1(3)));
	
	S(2) <= PP2(3) XOR C(2);
	C(3) <= PP2(3) AND C(2);
	
	O(2) <= S(0) XOR PP3(0);
	C(4) <= S(0) AND PP3(0);
	
	S(3) <= PP3(1) XOR S(1) XOR C(4);
	C(5) <= (PP3(1) AND S(1)) OR (C(4) AND (PP3(1) XOR S(1)));
	
	S(4) <= PP3(2) XOR S(2) XOR C(5);
	C(6) <= (PP3(2) AND S(2)) OR (C(5) AND (PP3(2) XOR S(2)));
	
	S(5) <= PP3(3) XOR C(3) XOR C(6);
	C(7) <= (PP3(3) AND C(3)) OR (C(6) AND (PP3(3) XOR C(3)));
	
	O(3) <= PP4(0) XOR S(3);
	C(8) <= PP4(0) AND S(3);
	
	O(4) <= PP4(1) XOR S(4) XOR C(8);
	C(9) <= (PP4(1) AND S(4)) OR (C(8) AND (PP4(1) XOR S(4)));
	
	O(5) <= PP4(2) XOR S(5) XOR C(9);
	C(10) <= (PP4(2) AND S(5)) OR (C(9) AND (PP4(2) XOR S(5)));
	
	O(6) <= PP4(3) XOR C(7) XOR C(10);
	O(7) <= (PP4(3) AND C(7)) OR (C(10) AND (PP4(3) XOR C(7)));

end Behavioral;

