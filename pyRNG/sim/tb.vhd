library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_RNG is
end TB_RNG;

architecture sim of TB_RNG is

    signal clk_tb  : std_logic := '0';
    signal sw_tb   : std_logic := '0';
    signal LCD_D : std_logic_vector(7 downto 0);
	signal LCD_C : std_logic_vector(6 downto 5);
    component RNG
        port (
            clk  : in std_logic;
            sw   : in std_logic;
           			LCD_D	: out std_logic_Vector(7 downto 0);
        LCD_C : out std_logic_vector(6 downto 5)  -- Control signals for LCD

        );
    end component;

begin

    DUT: RNG
        port map (
            clk  => clk_tb,
            sw   => sw_tb,
            LCD_D => LCD_D,
            LCD_C => LCD_C
        );

    -- Clock process: 10ns period
    clk_process : process
    begin
            clk_tb <= '0';
            wait for 37 ns;
            clk_tb <= '1';
            wait for 37 ns;
        
    end process;

    -- Switch toggling process
    stim_proc: process
    begin
        wait for 2000 ns;
        sw_tb <= '1';
        wait for 10 ns;
        sw_tb <= '0';

        wait for 40 ns;
        sw_tb <= '1';
        wait for 10 ns;
        sw_tb <= '0';

        wait for 60 ns;
        sw_tb <= '1';
        wait for 10 ns;
        sw_tb <= '0';

        wait for 100 ns;
        sw_tb <= '1';
        wait for 10 ns;
        sw_tb <= '0';

        wait;
    end process;

end sim;
