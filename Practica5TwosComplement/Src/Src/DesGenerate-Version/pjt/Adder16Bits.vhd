----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
------- CP_CLA4Bits -------
-------- 21/03/2025 --------
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--------- Pin/out ---------
entity Propagator is
	port
		(
        C_signX : in std_logic;
    	C_A: in std_logic_vector(15 downto 0);
		C_Q: out std_logic_vector(15 downto 0)
        );
end Propagator;

architecture juve3dstudio of Propagator is
signal Ca2,Ca1,Carry, ASigned : std_logic_vector (15 downto 0);

begin
    with C_signX select
    C_Q <=  C_A when '0',
            Ca1 when others;
    
    Ca2 <= not C_A;

    
    -- Asignaciones de Ca1
    Ca1(0)  <= C_A(0) xor '1';
    Ca1(1)  <= Ca2(1) xor Carry(0);
    Ca1(2)  <= Ca2(2) xor Carry(1);
    Ca1(3)  <= Ca2(3) xor Carry(2);
    Ca1(4)  <= Ca2(4) xor Carry(3);
    Ca1(5)  <= Ca2(5) xor Carry(4);
    Ca1(6)  <= Ca2(6) xor Carry(5);
    Ca1(7)  <= Ca2(7) xor Carry(6);
    Ca1(8)  <= Ca2(8) xor Carry(7);
    Ca1(9)  <= Ca2(9) xor Carry(8);
    Ca1(10) <= Ca2(10) xor Carry(9);
    Ca1(11) <= Ca2(11) xor Carry(10);
    Ca1(12) <= Ca2(12) xor Carry(11);
    Ca1(13) <= Ca2(13) xor Carry(12);
    Ca1(14) <= Ca2(14) xor Carry(13);
    Ca1(15) <= Ca2(15) xor Carry(14);

    -- Asignaciones de Carry
    Carry(0)  <= Ca2(0) and '1';
    Carry(1)  <= Ca2(1) and Carry(0);
    Carry(2)  <= Ca2(2) and Carry(1);
    Carry(3)  <= Ca2(3) and Carry(2);
    Carry(4)  <= Ca2(4) and Carry(3);
    Carry(5)  <= Ca2(5) and Carry(4);
    Carry(6)  <= Ca2(6) and Carry(5);
    Carry(7)  <= Ca2(7) and Carry(6);
    Carry(8)  <= Ca2(8) and Carry(7);
    Carry(9)  <= Ca2(9) and Carry(8);
    Carry(10) <= Ca2(10) and Carry(9);
    Carry(11) <= Ca2(11) and Carry(10);
    Carry(12) <= Ca2(12) and Carry(11);
    Carry(13) <= Ca2(13) and Carry(12);
    Carry(14) <= Ca2(14) and Carry(13);
    Carry(15) <= Ca2(15) and Carry(14);



end juve3dstudio;
