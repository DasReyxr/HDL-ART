----------- Code -----------
--------- Iker | Das ---------
------ Fractionary2Bin  ------
---- I date 30/05/2025 ----
---- C date 30/05/2025 ----
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
--------- Pin/out ---------
entity b2f is
	generic(Decimal : integer := 1000);
	port (
        clk,rst : in std_logic;
		Val   : in std_logic_vector(31 downto 0);
		Fract : out std_logic_vector(31 downto 0)
	);
end ;

architecture juve3dstudio of b2f is
    signal counter_s, counter_a : unsigned(4 downto 0) := (others => '0');
    signal enable : std_logic := '0';
    signal Val_s, Val_a : unsigned(31 downto 0) := (others => '0');
    signal result, result_s : unsigned(31 downto 0) := (others => '0');
    signal stages_a, stages_s : unsigned(4 downto 0) := (others => '0');
    signal decimal_unsigned : unsigned(31 downto 0);
    -- 0 x2
    -- 1 cmp 
    -- 2 sisi '1'
    -- 3 <<
    -- 4 +i
    constant    stage_mult   : unsigned(1 downto 0) := "00";
    constant    stage_cmp    : unsigned(1 downto 0) := "01";
    constant    stage_assign : unsigned(1 downto 0) := "10";
    constant    stage_shift  : unsigned(1 downto 0) := "11";
begin

    -- Convert generic to unsigned for comparison
    decimal_unsigned <= to_unsigned(Decimal, 32);

    -- Stage control
    stages_s <= stages_a when rising_edge(clk);
    stages_a <= stages_s + 1 when stages_s < 4 and enable = '1' else 
            (others => '0');
    
    -- Counter logic
    counter_s <= counter_a when rising_edge(clk);
    counter_a <= (others => '0') when rst = '1' else
                counter_s + 1 when enable = '1' and stages_s = stage_shift else 
                counter_s;
    
    -- Value processing
    Val_s <= Val_a when rising_edge(clk);
    Val_a <= unsigned(Val) when counter_s = 0  else
            Val_s(30 downto 0) & '0' when Val_s < decimal_unsigned and enable = '1' and stages_s = stage_mult else
            Val_s - decimal_unsigned when enable = '1' and stages_s = stage_mult else
            Val_s;
    
    enable <= '1' when counter_s < 31 else '0';

    Fract <= std_logic_vector(result) when counter_s = 31 else (others => '0');

-------------------------------------------------------------------------------------------------------------------------------
    -- ora si bien 


end juve3dstudio;

