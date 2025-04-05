----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
------- VectorMult -------
-------- 21/03/2025 --------
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--------- Pin/out ---------
entity VectorMult is
generic(size : integer := 16); 
	port
		(
        -- In --
        C_B, C_M : in std_logic_vector(size-1 downto 0);
        C_Q : in std_logic;
        -- Out --
        C_Cout : out std_logic;
        C_P : out std_logic_vector(size-1 downto 0)
        );
end VectorMult;

architecture juve3dstudio of VectorMult is

------ Full Adder ------
signal Carry : std_logic_vector (size downto 0);
signal C_A: std_logic_vector(size-1 downto 0);


begin
	------- Mod -------
  	GEN_XOR : for i in 0 to size-1 generate
      C_A(i)<=C_M(i) and C_Q;
      -- Carry --
      Carry(i+1) <= (C_A(i) and C_B(i)) or (carry(i) and (C_A(i) xor C_B(i)));
      -- Partial Product --
      C_P(i) <= C_A(i) xor C_B(i) xor carry(i);    
	end generate GEN_XOR;
	
    carry(0) <= '0';
    C_Cout   <= carry(size);

    
	end juve3dstudio;


