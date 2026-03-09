----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
------ Floating Point ------
---- I date 29/05/2025 ----
---- C date 29/05/2025 ----
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
--------- Pin/out ---------
entity FloatingPoint is
	port
		(
		--	Val,fracBin: in std_logic_vector(31 downto 0);
		Val,Fract: in std_logic_vector(31 downto 0);
			Sign,clk,reset: in std_logic;
			SignO: out std_logic;
			Exp: out std_logic_vector(7 downto 0);
			Mantisa: out std_logic_vector(22 downto 0);
			IEEE : out  std_logic_vector(31 downto 0)
		);
end ;

architecture juve3dstudio of FloatingPoint is
constant ZERO: std_logic_vector(31 downto 0) := (others => '0');
signal clzExp,clzVal,clzFrac: integer range 0 to 32;
signal fracBin: std_logic_vector(31 downto 0);
signal Mantisa_d:  std_logic_vector(22 downto 0);
signal ZeroInt,ZeroFrac :std_logic;
signal realRST,apocosi : std_logic;

signal shifted_frac,shifted_val      : std_logic_vector(63 downto 0);  -- Extended to handle maximum shift
signal shift_amount,shift_amountV      : natural range 0 to 32;
component CLZ is
		port
		(
			Val: in std_logic_vector(31 downto 0);
            clz: out integer range 0 to 32
		);
    end component;
	
component b2f is
	port (
		clk, rst : in std_logic;
		Val   : in std_logic_vector(31 downto 0);
		Fract : out std_logic_vector(31 downto 0);
		done : out std_logic -- para saber cuando acaba
	);
end component;


begin
-- exp <= 127 + CLZ++31 31-clz+127
	clz_exp: CLZ port map ( Val => Val , clz =>  clzExp);
	Exp <= 
			(others => '0') when ZeroFrac = '1' else
			std_logic_vector(to_unsigned(158 - clzExp , 8)) when ZeroInt ='0' else
			std_logic_vector(to_unsigned(126 - ClzFrac, 8)) when ZeroInt = '1'; 

	clz_val: CLZ port map ( Val => Val, clz => clzVal);
	
	bin2frac : b2f port map(clk => clk, rst=> reset,Val => Fract, Fract => fracBin, done=> apocosi); -- yacabewe => apocosi

	clz_frac: CLZ port map ( Val => fracBin, clz => clzFrac);

	
    shift_amount <= clzFrac when ZeroInt = '1' and apocosi = '1' else 0;
	shift_amountV <= clzVal when ZeroInt = '1' and apocosi = '1' else 0;
	
    shifted_frac <= std_logic_vector(shift_left(unsigned(fracBin & x"00000000"), shift_amount));
    shifted_val <= std_logic_vector(shift_left(unsigned(Val & x"00000000"), shift_amountV));
    
    Mantisa <= 
			shifted_val(62 downto 40) when (clzVal<9 ) else 
			Val(30 - CLZVal downto 0) & fracBin(31 downto 40-CLZVal) when ZeroFrac = '0' and clzVal <= 30 else 
			fracBin(30 downto 8-CLZFrac) when ZeroInt = '1' and CLZFrac<9 else	
			shifted_frac(62 downto 40) when (ZeroInt = '1' and apocosi = '1') else 
			(others => '0');


	-- Control Signals --
	ZeroInt <= '1' when clzVal = 32 else '0';
	ZeroFrac <= '1' when ZeroInt='1' and clzFrac = 32 else '0';
	
	IEEE <= Sign & Exp &Mantisa; 

end juve3dstudio;