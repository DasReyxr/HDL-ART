----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
------- Multiplier -------
-------- 22/03/2025 --------
------- Main Library -------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--------- Pin/out ---------
entity MultiplierSigned is
    Port (
        signQ, signM : in std_logic;
        RQ, RM : in STD_LOGIC_VECTOR(7 downto 0);
        Sign : out std_logic;
        P : out std_logic_vector(15 downto 0)
    );
end MultiplierSigned;


architecture juve3dstudio of MultiplierSigned is

type Array8 is array (0 to 7) of std_logic_vector(15 downto 0);
signal PPJuan,PX: Array8;
signal P7,P6,P5,P4,P3,P2,P1,P0 : std_logic_vector(15 downto 0);
signal Res_P:  STD_LOGIC_VECTOR(15 downto 0);
signal signP : std_logic;

signal SigneQ, SigneM, SigneP   : std_logic_vector (15 downto 0);
signal carry : std_logic_vector(8 downto 0);
signal gbg : std_logic_vector(2 downto 0);

component VectorMult 
port
		(
        -- In --
        C_B, C_M : in std_logic_vector(15 downto 0);
        C_Q : in std_logic;
        -- Out --
        C_Cout : out std_logic;
        C_P : out std_logic_vector(15 downto 0)
        );
end component;

component Propagator  
	port
		(
        C_signX : in std_logic;
    	C_A: in std_logic_vector(15 downto 0);
		C_Q : out std_logic_vector(15 downto 0)
        );
end component;

begin
      -- debugging --
      P7 <= PX(7);
      P6 <= PX(6);
      P5 <= PX(5);
      P4 <= PX(4);
      P3 <= PX(3);
      P2 <= PX(2);
      P1 <= PX(1);
      P0 <= PX(0);

      -- Partial Products --
      PPJuan(0) <= (others => '0');
      PPJuan(1) <= carry(0) & PX(0)(15 downto 1); 
      PPJuan(2) <= carry(1) & PX(1)(15 downto 1); 
      PPJuan(3) <= carry(2) & PX(2)(15 downto 1); 
      PPJuan(4) <= carry(3) & PX(3)(15 downto 1); 
      PPJuan(5) <= carry(4) & PX(4)(15 downto 1); 
      PPJuan(6) <= carry(5) & PX(5)(15 downto 1); 
      PPJuan(7) <= carry(6) & PX(6)(15 downto 1); 


      -- Two's Complement --
    
     ADD1Q: Propagator 
       port map (
        C_signX => signQ,
        C_A => x"00"& RQ,
        C_Q => SigneQ
      );

      ADD1M: Propagator 
       port map (
        C_signX => signM,
        C_A => x"00" & RM,
        C_Q => SigneM
          
      );

      ADD1P: Propagator 
       port map (
        C_signX => signP,
        C_A => Res_P,
        C_Q =>SigneP
      );
      
      VA: VectorMult port map( C_B => PPJuan(0), C_M => SigneM, C_Q => SigneQ(0), C_Cout => carry(0), C_P => PX(0) );
      VB: VectorMult port map( C_B => PPJuan(1), C_M => SigneM, C_Q => SigneQ(1), C_Cout => carry(1), C_P => PX(1) );
      VC: VectorMult port map( C_B => PPJuan(2), C_M => SigneM, C_Q => SigneQ(2), C_Cout => carry(2), C_P => PX(2) );
      VD: VectorMult port map( C_B => PPJuan(3), C_M => SigneM, C_Q => SigneQ(3), C_Cout => carry(3), C_P => PX(3) );
      VE: VectorMult port map( C_B => PPJuan(4), C_M => SigneM, C_Q => SigneQ(4), C_Cout => carry(4), C_P => PX(4) );
      VF: VectorMult port map( C_B => PPJuan(5), C_M => SigneM, C_Q => SigneQ(5), C_Cout => carry(5), C_P => PX(5) );
      VG: VectorMult port map( C_B => PPJuan(6), C_M => SigneM, C_Q => SigneQ(6), C_Cout => carry(6), C_P => PX(6) );
      
      Res_P <= PX(7)(8 downto 0) & PX(6)(0) & PX(5)(0) & PX(4)(0) & PX(3)(0) & PX(2)(0) & PX(1)(0) & PX(0)(0);
      
      signP <= signQ xor signM;
      Sign <= signP;
end juve3dstudio;