library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_FloatingPoint is
end tb_FloatingPoint;

architecture Direct of tb_FloatingPoint is
    component FloatingPoint is
        port (
            Val, Fract : in std_logic_vector(31 downto 0);
            Sign, clk, reset : in std_logic;
            SignO : out std_logic;
            Exp : out std_logic_vector(7 downto 0);
            Mantisa : out std_logic_vector(22 downto 0);
            IEEE : out std_logic_vector(31 downto 0)
        );
    end component;

    -- Clock signal
    signal clk : std_logic := '0';
    constant clk_period : time := 10 ns;
    
    -- Test case outputs
    signal SignO1, SignO2, SignO3, SignO4 : std_logic;
    signal Exp1, Exp2, Exp3, Exp4 : std_logic_vector(7 downto 0);
    signal Mantisa1, Mantisa2, Mantisa3, Mantisa4 : std_logic_vector(22 downto 0);
    signal IEEE1, IEEE2, IEEE3, IEEE4 : std_logic_vector(31 downto 0);
begin
    -- Clock generation
    clk <= not clk after clk_period/2;
    
    -- Test Case 1: Integer 10 (0xA)
    dut1: FloatingPoint port map (
        Val => x"00000000", 
        Fract => x"00000000",
        Sign => '1',
        clk => clk,
        reset => '0',
        SignO => SignO1,
        Exp => Exp1,
        Mantisa => Mantisa1,
        IEEE => IEEE1
    );
    

    -- Test Case 3: Fraction A (0.010)
    dut3: FloatingPoint port map (
        Val => x"00000101", --257
        Fract => x"00000000", -- A
        Sign => '0',
        clk => clk,
        reset => '0',
        SignO => SignO3,
        Exp => Exp3,
        Mantisa => Mantisa3,
        IEEE => IEEE3
    );
    
    -- Test Case 4: Fraction B (0.100)
    dut4: FloatingPoint port map (
        Val => x"00000000",
        Fract => x"00000001", -- B
        Sign => '0',
        clk => clk,
        reset => '0',
        SignO => SignO4,
        Exp => Exp4,
        Mantisa => Mantisa4,
        IEEE => IEEE4
    );
    
    -- Test Case 5: Zero value
    dut5: FloatingPoint port map (
        Val => x"00000000",
        Fract => x"00000000",
        Sign => '0',
        clk => clk,
        reset => '0',
        SignO => open,
        Exp => open,
        Mantisa => open,
        IEEE => open
    );
    
    -- Test Case 6: Max value
    dut6: FloatingPoint port map (
        Val => x"80000000", --2^31
        Fract => x"00000000",
        Sign => '0',
        clk => clk,
        reset => '0',
        SignO => open,
        Exp => open,
        Mantisa => open,
        IEEE => open
    );
end Direct;