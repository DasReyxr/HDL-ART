----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
---- Complement 2 ----
-------- 17/02/2025 --------
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_1164.all;
--------- Pin/out ---------
entity COM2 is
	port
		(
		n : in std_logic_vector(4 downto 0);
		nMalo : out std_logic_vector (7 downto 0);
        signOut : out std_logic
        );
end COM2;

architecture juve3dstudio of COM2 is

    signal sign  : std_logic;
    signal M_Ca1, Mtemp, M_Ca2 : std_logic_vector(7 downto 0);
    signal Carry : std_logic_vector (6 downto 0);
    begin
    sign <= n(4);
    M_CA1 <= "0000" &  not(n(3 downto 0));
    Mtemp <= "0000" & n(3 downto 0);
    

    M_Ca2(0)  <= M_Ca1(0) xor '1';
    M_Ca2(1)  <= M_Ca1(1) xor Carry(0);
    M_Ca2(2)  <= M_Ca1(2) xor Carry(1);
    M_Ca2(3)  <= M_Ca1(3) xor Carry(2);
    M_Ca2(4)  <= M_Ca1(4) xor Carry(3);
    M_Ca2(5)  <= M_Ca1(5) xor Carry(4);
    M_Ca2(5)  <= M_Ca1(5) xor Carry(4);
    M_Ca2(6)  <= M_Ca1(6) xor Carry(5);
    M_Ca2(7)  <= M_Ca1(7) xor Carry(6);
    
    
    Carry(0)  <= M_Ca1(0) and '1';
    Carry(1)  <= M_Ca1(1) and Carry(0);
    Carry(2)  <= M_Ca1(2) and Carry(1);
    Carry(3)  <= M_Ca1(3) and Carry(2);
    Carry(4)  <= M_Ca1(4) and Carry(3);
    Carry(5)  <= M_Ca1(5) and Carry(4);
    Carry(6)  <= M_Ca1(6) and Carry(5);

    /* Das Version
    M_Ca2(0)  <= M_Ca1(0) xor '1';
    Carry(0)  <= M_Ca1(0) and '1';
    Adder1 : for i in 0 to 7 generate
    M_Ca2(i+1) <= M_Ca1(i+1) xor carry(i);
    Carry(i)   <= M_Ca1(i)   and Carry(i); 
    end generate Adder1;
*/

    nMalo <=  n(3 downto 0) when signN = '0' else M_Ca2;
    signOut <= sign;
end juve3dstudio;


    
    /*
1 0001 
  1110
 +   1
 
 S =    Min(0) xor 1 = 1
 Cout = Min(0) and 1 = 0

    Min(1) xor Carry(0) = 1
    Min(1) and Carry(0) = 0

    Min(2) xor Carry(1) = 1
    Min(2) and Carry(1) = 0
    
    Min(3) xor Carry(2) = 1
    Min(3) and Carry(2) = 0
*/
