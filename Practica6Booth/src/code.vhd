----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
------- BoothWallace -------
-------- 04/04/2025 --------
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.ALL;

--------- Pin/out ---------
entity Multiplier is
	port
		(
        SignA,SignB : in std_logic;
        clk     : in std_logic;
        RA, RB	: in std_logic_vector(7 downto 0);
		P_out	: out std_logic_vector (16-1 downto 0);
		SignP   : out std_logic
        );
end Multiplier;

architecture juve3dstudio of Multiplier is
component Comp 
    port (
        MC : in std_logic_vector(7 downto 0);
        C_S : out std_logic_vector(7 downto 0));
end component;

component Adder16Bits
    port (
        A, B : in std_logic_vector(7 downto 0);
        P : out std_logic_vector(16 downto 0));
end component;
type MEMORY is array (0 to 7) of std_logic_vector(7 downto 0);
signal RAM : MEMORY;
signal Atemp,signeA : std_logic_vector (15 downto 0);
signal sB,sbMUX,sB_S : std_logic_vector(16 downto 0);
signal  P, P_S,Btemp : std_logic_vector (16 downto 0) := (others => '0');
signal counter_a,counter_s,counter_ff : unsigned(3 downto 0) := "0000";
signal sel : std_logic_vector(1 downto 0);
begin

    ---- Shift Register ----
    P_S <= P(16) & P(16 downto 1) when clk'event and clk = '1' and counter_ff < "1000" ;
    
    sB_S <= sBMUX(15 downto 1) when clk'event and clk = '1' and counter_ff < "1000" ;
    
    -- P <= A +P_S ;
    AN: Comp port map( MC => RA, C_s => SigneA);
    P <= Atemp;

    
	with counter_ff select
    P_out <= P_S(15 downto 0) when "1000",
    		x"0000" when others;
    
    with counter_ff select
    sbMUX <= RB & '0' when "0000",
             sB_S      when others;
    
    with sB_S(1 downto 0) select
    Atemp <= 
        x"00" & RA       when "01",
        signeA  when "10",
        x"0000"   when others;


    -- Sign Handlement --
    SignP <= SignA xor SignB;

    -- Memoria --
    counter_a  <= counter_ff  when clk'event and clk='1';
    -- Logica de estado Siguiente --
    counter_s  <= counter_a  + 1 when counter_a < "1000";
    counter_ff <= counter_s when clk'event and clk = '1';
    -- Logica de Salida --

    RAM(to_integer(counter_ff)) <= P_S when clk'event and clk = '1' ;

    P_out <= RAM(0) + RAM(1)+ RAM(2) + RAM(3) + RAM(4) + RAM(5) + RAM(6) + RAM(7);


end juve3dstudio;