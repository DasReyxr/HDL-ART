----------- Code -----------
--------- Iker | Das ---------
------ TOP twenty one  ------
---- I date 18/06/2025 ----
---- C date 18/06/2025 ----
------- Main Library -------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
--------- Pin/out ---------
entity CALC is
	port
		(
			Intg1,Intg2: in std_logic_vector(31 downto 0);
			Fract1,Fract2 : in std_logic_vector (13 downto 0);
			Sign1,Sign2,clk,reset, selector: in std_logic;
			IntgOut : out  std_logic_vector(31 downto 0);
			FractOut : out std_logic_vector(13 downto 0);
			SignOut : out std_logic
		);
end ;

architecture bobostudio of CALC is

-- METER 2 IEEE el archivo es floating point

	component Markiplier
		port (
			Val1, Val2 : in  std_logic_vector(31 downto 0);
			R7Mult     : out std_logic_vector(31 downto 0)
		);
	end component;

	component Sumador
		port (
			Val1, Val2 : in  std_logic_vector(31 downto 0);
			R7Sum      : out std_logic_vector(31 downto 0)
		);
	end component;

	component FloatingPoint is 
		port
		(
			Intg: in std_logic_vector(31 downto 0);
			Fract : in std_logic_vector (13 downto 0);
			Sign,clk,reset: in std_logic;
			IEEE : out  std_logic_vector(31 downto 0)
		);
	end component;
	
	component IEEEConv is
	port
		(
			IEEE: in std_logic_vector(31 downto 0);
     		sign : out std_logic;
            Intg : out std_logic_vector(31 downto 0);
            Frac : out unsigned(15 downto 0) 
            );
	end component;
	
	signal R7Mult, R7Sum,R7 : std_logic_vector(31 downto 0);
	signal Val1, Val2 : std_logic_vector(31 downto 0);
	signal R7 std_logic_vector(31 downto 0)

-- Instanciar convertidor

begin
	
	IEEEVal1 : FloatingPoint (Intg => Intg1, Fract => Fract1, Sign => Sign1,clk => clk, reset=>reset ,IEEE => Val1)
	IEEEVal2 : FloatingPoint (Intg => Intg1, Fract => Fract2, Sign => Sign2,clk => clk, reset=>reset ,IEEE => Val2)
	
	Multiplicacion: Markiplier port map (
		Val1 => Val1,
		Val2 => Val2,
		R7Mult => R7Mult
	);

	Suma: Sumador port map (
		Val1 => Val1,
		Val2 => Val2,
		R7Sum => R7Sum
	);

	with Selector select
		R7 <= R7Sum  when '1',
		      R7Mult when others;

	FinalVal : IEEEConv (IEEE => R7, sign => SignOut, Intg => IntgOut, Frac => FractOut, clk => clk, reset => reset, IEEE => );	
end architecture;


