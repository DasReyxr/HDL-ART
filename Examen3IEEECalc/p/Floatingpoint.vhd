library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
--------- Pin/out ---------
entity FloatingPoint is
	port
		(
			Intg: in std_logic_vector(31 downto 0);
			Fract : in std_logic_vector (13 downto 0);
			Sign,clk,reset: in std_logic;
			IEEE : out  std_logic_vector(31 downto 0)
		);
end ;

architecture juve3dstudio of FloatingPoint is

signal SignO:  std_logic;
signal Exp: std_logic_vector(7 downto 0);
signal Mantisa: std_logic_vector(22 downto 0);
			

constant ZERO: std_logic_vector(31 downto 0) := (others => '0');
signal clzExp,clzIntg,clzFrac: integer range 0 to 32;
signal fracBin: std_logic_vector(39 downto 0);
signal Mantisa_d:  std_logic_vector(22 downto 0);
signal ZeroIntg,ZeroFrac :std_logic;
signal realRST,apocosi : std_logic;

signal shifted_frac,Mantisa40      : std_logic_vector(39 downto 0);  -- Extended to handle maximum shift
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
        clk,rst : in std_logic;
        Val   : in std_logic_vector(13 downto 0);
        Fract : out std_logic_vector(39 downto 0);
        done : out std_logic
	);
end component;


begin
-- exp <= 127 + CLZ++31 31-clz+127
	clz_exp: CLZ port map ( Val => Intg , clz =>  clzExp);
	Exp <= 
			(others => '0') when ZeroFrac = '1' else
			std_logic_vector(to_unsigned(158 - clzExp , 8)) when ZeroIntg ='0' else
			std_logic_vector(to_unsigned(126 - ClzFrac, 8)) when ZeroIntg = '1'; 

	clz_val: CLZ port map ( Val => Intg, clz => clzIntg);
	
	bin2frac : b2f port map(clk => clk, rst=> reset,Val => Fract, Fract => fracBin, done=> apocosi); -- yacabewe => apocosi

	clz_frac: CLZ port map ( Val => fracBin(39 downto 8), clz => clzFrac);

	
    shift_amount <= clzFrac when ZeroIntg = '1' and apocosi = '1' else 0;
	shift_amountV <= clzIntg when ZeroIntg = '1' and apocosi = '1' else 0;

	Mantisa40 <= 
--				(Intg sll (clzIntg+1)) & x"00" when ZeroIntg= '0' else
				(fracBin sll (clzFrac+1)) when ZeroIntg = '1' and apocosi = '1' else
			
            (Intg sll (clzIntg+1)) & x"00" or (fracBin sll clzFrac) srl (33-clzFrac-clzIntg) when ZeroFrac = '0' else
				(others => '0');
	Mantisa <= 
			Mantisa40(39 downto 17);			--23 -29 39-26=29 13=29

	-- Control Signals --
	ZeroIntg <= '1' when clzIntg = 32 else '0';
	ZeroFrac <= '1' when ZeroIntg='1' and clzFrac = 32 else '0';
	
	IEEE <= Sign & Exp &Mantisa; 

end juve3dstudio;