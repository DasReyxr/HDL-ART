----------- Code -----------
------ Iker | Das ------
--------- Auf Das ---------
------- BoothWallace -------
-------- 04/04/2025 --------
------- Main Library -------
library IEEE;library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.ALL;

--------- Pin/out ---------
entity Multiplier is
	port
		(
        SignA,SignB : in std_logic;
        clk     : in std_logic;
        RA, RB	: in std_logic_vector(7 downto 0);
		P_out	: out std_logic_vector (15 downto 0);
		SignP   : out std_logic
        );
end Multiplier;

architecture juve3dstudio of Multiplier is

component CarrySave
    port
    (
    IN1,IN2,IN3   : in std_logic_vector(15 downto 0);
    S,C   : out std_logic_vector(15 downto 0)
    );
end component;

component Comp2
    port (
        MC : in std_logic_vector(15 downto 0);
        C_S : out std_logic_vector(15 downto 0));
end component;

component CLA_16Bits 
	port
		(
		C_A, C_B : in std_logic_vector(7 downto 0);
		C_S : out std_logic_vector(7 downto 0);
        C_cin : in std_logic
        );
end component;

type array16 is array (0 to 5) of std_logic_vector(15 downto 0);
type array8 is array (0 to 7) of std_logic_vector(15 downto 0);
signal  PP : array8;
signal  Carry,Sum : array16;
signal  P : std_logic_vector (8 downto 0);
signal AN, A : std_logic_vector (15 downto 0);
signal sel : std_logic_vector (1 downto 0);
begin
    -- Walas TRIIIIIII --
    CSA1 : CarrySave port map(IN1 => PP(0), IN2 => PP(1), IN3 => PP(2),S=>Sum(0) ,C=>Carry(0));
    CSA2 : CarrySave port map(IN1 => PP(3), IN2 => PP(4), IN3 => PP(5),S=>Sum(1) ,C=>Carry(1));
    CSA3 : CarrySave port map(IN1 => Sum(1), IN2 => Carry(0), IN3 => Sum(0),S=>Sum(2) ,C=>Carry(2));
    CSA4 : CarrySave port map(IN1 => Carry(1), IN2 => PP(6), IN3 => PP(7),S=>Sum(3) ,C=>Carry(3));
    CSA5 : CarrySave port map(IN1 => Sum(2), IN2 => Carry(2), IN3 => Sum(3),S=>Sum(4) ,C=>Carry(4));
    CSA6 : CarrySave port map(IN1 => Carry(3), IN2 => Carry(4), IN3 => Sum(4),S=>Sum(5) ,C=>Carry(5));

    CLA  : CLA_16Bits port map(C_A => Carry(5), C_B => Sum(5), C_S => P_out, C_cin => '0'); 

    A <= x"00" & RA;
        
    Amala: Comp2 port map( MC => A, C_s => AN);
    P <= RB & '0'; -- Meter A como entrada

    -- Sign Handlement --
    SignP <= SignA xor SignB;

    Boot : for i in 0 to 7 generate
    Sel <= P(i+1 downto i);
    with Sel select 
    PP(i) <= 
        A(15-i downto 0) & (others => '0')            when "01",
        AN(15-i downto 0) & (others => '0')          when "10",
        x"0000"   when others;
    end generate Boot;

end juve3dstudio;