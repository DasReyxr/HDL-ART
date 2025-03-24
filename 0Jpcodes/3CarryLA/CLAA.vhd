----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
----------- CLAA -----------
-------- 17/02/2025 --------
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--------- Pin/out ---------
entity CLAA is
	port
		(
		A,B : in std_logic_vector(3 downto 0);
        cin : in std_logic;
		cout: out std_logic;
		S : out std_logic_vector (3 downto 0)
        );
end CLAA;

architecture juve3dstudio of CLAA is
signal P, G : std_logic_vector(3 downto 0);
signal carry : std_logic_vector (4 downto 0);
begin
	carry(0) <= cin;
	-- Juan 1 --
	P(0) <= A(0) xor B(0);
	P(1) <= A(1) xor B(1);
	P(2) <= A(2) xor B(2);
	P(3) <= A(3) xor B(3);
	
	G(0) <= A(0) and B(0);
	G(1) <= A(1) and B(1);
	G(2) <= A(2) and B(2);
	G(3) <= A(3) and B(3);

	-- Juan 2 --
	carry(1) <=  G(0)  or (P(0) and carry(0));
	carry(2) <=  G(1)  or 
				(P(1) and G(0))  or 
				(P(1) and P(0) and carry(0));
	
	carry(3) <=  G(2)  or 
				(P(2) and G(1)) or 
				(P(2) and P(1) and G(0)) or 
				(P(2) and P(1) and P(0)  and carry(0));

	carry(4) <=  G(3) or 
				(P(3) and G(2)) or   
				(P(3) and P(2) and G(1)) or 
				(P(3) and P(2) and P(1) and G(0)) or 
				(P(3) and P(2) and P(1) and P(0)  and carry(0));

	-- Juan 3 --
	S(0) <= P(0) xor carry(0);
	S(1) <= P(1) xor carry(1);
	S(2) <= P(2) xor carry(2);
	S(3) <= P(3) xor carry(3);
	cout <= carry(4);

end juve3dstudio;

