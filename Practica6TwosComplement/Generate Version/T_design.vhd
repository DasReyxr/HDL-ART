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
    Generic(
        INN : integer := 8;  -- Input size
        OUTT : integer := 2*INN  -- Output size
    );
    Port (
        signQ, signM : in std_logic;
        RQ, RM : in STD_LOGIC_VECTOR(INN-1 downto 0);
        Sign : out std_logic;
        P : out std_logic_vector(OUTT-1 downto 0)
    );
end MultiplierSigned;


architecture juve3dstudio of MultiplierSigned is

type Array8 is array (0 to INN-1) of std_logic_vector(OUTT-1 downto 0);
signal PPJuan,PX: Array8;
signal       P7,P6,P5,P4,P3,P2,P1,P0 : std_logic_vector(15 downto 0);
signal Q, M,Res_P, SigneP :  STD_LOGIC_VECTOR(OUTT-1 downto 0);
signal signP : std_logic;
signal SigneQ, SigneM  : std_logic_vector (INN-1 downto 0);
signal carry : std_logic_vector(INN downto 0);
signal gbg : std_logic_vector(2 downto 0);

component VectorMult 
generic(size : integer := OUTT); 
      port (
      -- In --
      C_B, C_M : in std_logic_vector(size-1 downto 0);
      C_Q : in std_logic;
      -- Out --
      C_Cout : out std_logic;
      C_P : out std_logic_vector(size-1 downto 0)
      );
end component;

component CLA_16Bits
      generic(size : integer := INN);
      port (
      C_A, C_B : in std_logic_vector(size-1 downto 0);
      C_S : out std_logic_vector(size-1 downto 0);
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

      GEN_M: for i in 0 to 6 generate
        PPJuan(i+1) <= carry(i) & PX(i)(OUTT-1 downto 1); 
      end generate GEN_M;

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
       generic map (size => OUTT)
       port map (
          C_A => not(Res_P),
          C_B => "0000000000000001",
          C_S => SigneP,
          C_cin => '0',
          C_cout => gbg(2)
      );
      
      GEN_VMULT: for i in 0 to INN-1 generate
      V: VectorMult port map( C_B => PPJuan(i), C_M => M, C_Q => Q(i), C_Cout => carry(i), C_P => PX(i) );
      end generate GEN_VMULT;

      Res_P <= PX(7)(8 downto 0) & PX(6)(0) & PX(5)(0) & PX(4)(0) & PX(3)(0) & PX(2)(0) & PX(1)(0) & PX(0)(0);
      
      signP <= signQ xor signM;

end juve3dstudio;