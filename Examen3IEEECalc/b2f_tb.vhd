library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
entity b2f_tb is
end b2f_tb;

architecture sim of b2f_tb is
    component b2f
        port (
            clk,rst   : in  std_logic;
            Val   : in  std_logic_vector(13 downto 0);
            Fract : out std_logic_vector(39 downto 0);
            done : out std_logic
        );
    end component;

    signal clk,rst,done   : std_logic := '0';
    signal Val   : std_logic_vector(13 downto 0) := (others => '0');
    signal Fract : std_logic_vector(39 downto 0);
    
    constant CLK_PERIOD : time := 1 ns;
begin
    uut: b2f port map (clk,rst, Val, Fract,done);
    
    -- Clock generation
    clk <= not clk after CLK_PERIOD/2;
    
    -- Test stimulus
    process
    begin

        
        -- Test 4: 3 (should become 0xC0000000)
        Val <= std_logic_vector(to_unsigned(1, 14)); wait for 32 ns;
        
        wait;
    end process;
end sim;