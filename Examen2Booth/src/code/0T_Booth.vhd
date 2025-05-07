----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
------- Booth Wallace -------
-------- 14/04/2025 --------
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.ALL;

--------- Pin/out ---------
entity Multiplier is
	port
		(
        SignA,SignB : in std_logic;
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
    S,sCarry   : out std_logic_vector(15 downto 0));
end component;

component Comp2
    port (
        MC : in std_logic_vector(15 downto 0);
        C_S : out std_logic_vector(15 downto 0));
end component;

component CLA_16Bits 
	port
		(
		C_A, C_B : in std_logic_vector(15 downto 0);
		C_S : out std_logic_vector(15 downto 0);
        C_cin : in std_logic
        );
end component;

type array16 is array (0 to 6) of std_logic_vector(15 downto 0);
type array8 is array (0 to 8) of std_logic_vector(15 downto 0);
signal  PP : array8;
signal P_debug	: std_logic_vector (15 downto 0);
signal  Carry,Sum : array16;
signal  P : std_logic_vector (8 downto 0);
signal AN, A : std_logic_vector (15 downto 0);
begin
     -- Walas TRIIIIIII --
    CSA1 : CarrySave port map(IN1 => PP(0), IN2 => PP(1), IN3 => PP(2),S=>Sum(0) ,sCarry=>Carry(0));
    CSA2 : CarrySave port map(IN1 => PP(3), IN2 => PP(4), IN3 => PP(5),S=>Sum(1) ,sCarry=>Carry(1));
    CSA31 : CarrySave port map(IN1 => PP(6), IN2 => PP(7), IN3 => PP(8),S=> Sum(6) ,sCarry=>Carry(6));

    CSA3 : CarrySave port map(IN1 => Sum(1), IN2 => Carry(0), IN3 => Sum(0),S=>Sum(2) ,sCarry=>Carry(2));
    CSA4 : CarrySave port map(IN1 => Carry(1), IN2 => Sum(6), IN3 => Carry(6) ,S=>Sum(3) ,sCarry=>Carry(3));

    CSA5 : CarrySave port map(IN1 => Sum(2), IN2 => Carry(2), IN3 => Sum(3),S=>Sum(4) ,sCarry=>Carry(4));
    CSA6 : CarrySave port map(IN1 => Carry(3), IN2 => Carry(4), IN3 => Sum(4),S=>Sum(5) ,sCarry=>Carry(5));

    CLA  : CLA_16Bits port map(C_A => Carry(5), C_B => Sum(5), C_S => P_out, C_cin => '0'); 

    A <= x"00" & RA;
        
    Amala: Comp2 port map( MC => A, C_s => AN);
    P <= '0' & RB; -- Meter A como entrada

    -- Sign Handlement --
    SignP <= not(SignA xor SignB);

    with P(0) select 
    PP(0) <= AN         when '1',
				 x"0000"   when others;

	 with P(1 downto 0) select 
    PP(1) <= 
        A(14 downto 0)  & '0'     when "01",
        AN(14 downto 0) & '0'     when "10",
        x"0000"   when others;

    with P(2 downto 1) select 
    PP(2) <=
        A(13 downto 0)  & "00"     when "01",
        AN(13 downto 0) & "00"     when "10",
        x"0000"   when others;

    with P(3 downto 2) select 
    PP(3) <=
        A(12 downto 0)  & "000"     when "01",
        AN(12 downto 0) & "000"     when "10",
        x"0000"   when others;

    with P(4 downto 3) select 
    PP(4) <=
        A(11 downto 0)  & "0000"     when "01",
        AN(11 downto 0) & "0000"     when "10",
        x"0000"   when others;
    
    with P(5 downto 4) select 
    PP(5) <=
        A(10 downto 0)  & "00000"     when "01",
        AN(10 downto 0) & "00000"     when "10",
        x"0000"   when others;
    
    with P(6 downto 5) select 
    PP(6) <=
        A(9 downto 0)  & "000000"     when "01",
        AN(9 downto 0) & "000000"     when "10",
        x"0000"   when others;
    
    with P(7 downto 6) select 
    PP(7) <=
        A(8 downto 0)  & "0000000"     when "01",
        AN(8 downto 0) & "0000000"     when "10",
        x"0000"   when others;
	
	with P(8 downto 7) select 
    PP(8) <=
        A(7 downto 0)  & "00000000"     when "01",
        AN(7 downto 0) & "00000000"     when "10",
        x"0000"   when others;
    
       P_debug <= std_logic_vector(unsigned(PP(0)) + unsigned(PP(1))+ unsigned(PP(2)) + unsigned(PP(3)) + unsigned(PP(4)) + unsigned(PP(5)) + unsigned(PP(6)) + unsigned(PP(7))+ unsigned(PP(8)));
end juve3dstudio;