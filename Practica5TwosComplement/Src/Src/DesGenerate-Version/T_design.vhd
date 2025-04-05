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
signal Q, M,Res_P, SigneP :  STD_LOGIC_VECTOR(15 downto 0);
signal signP : std_logic;
signal SigneQ, SigneM  : std_logic_vector (7 downto 0);
signal carry : std_logic_vector(8 downto 0);
signal gbg : std_logic_vector(2 downto 0);

component VectorMult 
      port (
      -- In --
      C_B, C_M : in std_logic_vector(7 downto 0);
      C_Q : in std_logic;
      -- Out --
      C_Cout : out std_logic;
      C_P : out std_logic_vector(7 downto 0)
      );
end component;

component CLA_16Bits
      port (
      C_A, C_B : in std_logic_vector(7 downto 0);
      C_S : out std_logic_vector(7 downto 0);
      C_cin : in std_logic;
      C_cout: out std_logic
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



      -- Sign Extension --
      with signQ select
      Q <=  x"00" & RQ when '0',
            x"00" & SigneQ when others;
       
      with signM select
      M <=  x"00" & RM when '0',
            x"00" & SigneM when others;
  
      with signP select
      P <=  Res_P when '0',
            SigneP when others;
      
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
     ADD1Q: CLA_16Bits 
       port map (
          C_A => not(RQ),
          C_B => x"01",
          C_S => SigneQ,
          C_cin => '0',
          C_cout => gbg(0)
      );

      ADD1M: CLA_16Bits 
       port map (
          C_A => not(RM),
          C_B => x"01",
          C_S => SigneM,
          C_cin => '0',
          C_cout => gbg(1)
      );

      ADD1P: CLA_16Bits 
       port map (
          C_A => not(Res_P),
          C_B => "0000000000000001",
          C_S => SigneP,
          C_cin => '0',
          C_cout => gbg(2)
      );
      
      VA: VectorMult port map( C_B => PPJuan(0), C_M => M, C_Q => Q(0), C_Cout => carry(0), C_P => PX(0) );
      VB: VectorMult port map( C_B => PPJuan(1), C_M => M, C_Q => Q(1), C_Cout => carry(1), C_P => PX(1) );
      VC: VectorMult port map( C_B => PPJuan(2), C_M => M, C_Q => Q(2), C_Cout => carry(2), C_P => PX(2) );
      VD: VectorMult port map( C_B => PPJuan(3), C_M => M, C_Q => Q(3), C_Cout => carry(3), C_P => PX(3) );
      VE: VectorMult port map( C_B => PPJuan(4), C_M => M, C_Q => Q(4), C_Cout => carry(4), C_P => PX(4) );
      VF: VectorMult port map( C_B => PPJuan(5), C_M => M, C_Q => Q(5), C_Cout => carry(5), C_P => PX(5) );
      VG: VectorMult port map( C_B => PPJuan(6), C_M => M, C_Q => Q(6), C_Cout => carry(6), C_P => PX(6) );
      
      Res_P <= PX(7)(8 downto 0) & PX(6)(0) & PX(5)(0) & PX(4)(0) & PX(3)(0) & PX(2)(0) & PX(1)(0) & PX(0)(0);
      
      signP <= signQ xor signM;

end juve3dstudio;