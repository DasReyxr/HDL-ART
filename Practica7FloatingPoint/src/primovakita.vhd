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
	port (
        clk,rst : in std_logic;
		Val   : in std_logic_vector(31 downto 0);
		Fract : out std_logic_vector(31 downto 0);
        done : out std_logic
	);
end ;

architecture juve3dstudio of b2f is
    constant Decimal : integer := 1000;
    constant precision : integer := 33; -- Precision of the fractional part
    signal counter_s, counter_a : unsigned(5 downto 0) := (others => '0');
    signal enable : std_logic := '0';
    signal Val_s, Val_a : unsigned(31 downto 0) := (others => '0');
    signal result, result_s : unsigned(31 downto 0) := (others => '0');
    signal stages_a, stages_s : unsigned(4 downto 0) := (others => '0');
    signal decimal_unsigned : unsigned(31 downto 0);
    constant    stage_shift : unsigned(1 downto 0) := "10";
    constant    stage_assign : unsigned(1 downto 0) := "01";
    constant    stage_mult : unsigned(1 downto 0) := "00";
begin
    -- Convert generic to unsigned for comparison
    decimal_unsigned <= to_unsigned(Decimal, 32);

    -- Stage control
    stages_s <= stages_a when rising_edge(clk);
    stages_a <= stages_s + 1 when stages_s < 2 and enable = '1'else 
            (others => '0');
    
    -- Counter logic
    counter_s <= counter_a when rising_edge(clk);
    counter_a <= (others => '0') when rst = '1' else
                counter_s + 1 when enable = '1' and stages_a = stage_mult else -- previous stage shift 
                counter_s;
    
    -- Value processing
    Val_s <= Val_a when rising_edge(clk);
    Val_a <= unsigned(Val) when counter_s = 0  else
            (Val_s(30 downto 0)& '0' ) - decimal_unsigned when 2*Val_s > decimal_unsigned and enable = '1' and stages_a = stage_mult else
            Val_s(30 downto 0) & '0' when Val_s < decimal_unsigned and enable = '1' and stages_a = stage_mult else
            Val_s;
    
    enable <= '1' when counter_s < precision and rst = '0' else '0';

    done <= '1' when counter_s = precision else '0';
    /*
    result_s <= result when rising_edge(clk);
    result <= (others => '0') when rst = '1' else
            result_s+1 when 2*Val_a >= decimal_unsigned and enable = '1' and stages_a = stage_assign else
            result_s(30 downto 0) & '0' when enable = '1' and (stages_a = stage_assign or 2*Val_a >= decimal_unsigned) else
            result_s;
*/
/*

    result_s <= unsigned(std_logic_vector(result(30 downto 0)) & '0') when rising_edge(clk);
    result <= (others => '0') when rst = '1' else
            result_s + 1 when Val_a >= decimal_unsigned and enable = '1' and stages_a = stage_assign else
--            result_s when enable = '1' and stages_a = stage_assign else
            result_s;
*/
    result_s <= result when rising_edge(clk);
    result<= (others => '0')  when rst ='1' else
            result_s(30 downto 0) & '1' when 2*Val_a >= decimal_unsigned and stages_a = stage_assign and enable = '1' else 
            result_s(30 downto 0) & '0' when stages_a = stage_assign and enable = '1' else
            result_s;

    Fract <= std_logic_vector(result) when counter_s = precision else (others => '0');
end juve3dstudio;