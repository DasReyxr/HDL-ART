----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
-------- CarrySkip4 --------
-------- 10/02/2025 --------
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb is
end tb;

architecture testbench of tb is

    component Adder16CS
        port (
            A, B  : in  std_logic_vector(15 downto 0);
            Cout  : out std_logic;
            S     : out std_logic_vector(15 downto 0)
        );
    end component;

    signal A_tb, B_tb  : std_logic_vector(15 downto 0);
    signal S_tb        : std_logic_vector(15 downto 0);
    signal Cout_tb     : std_logic;

begin
    UUT: Adder16CS port map (
        A    => A_tb,
        B    => B_tb,
        S    => S_tb,
        Cout => Cout_tb
    );

    process
    begin
        -- Test case 1: 0 + 0
        A_tb <= (others => '0'); B_tb <= (others => '0');
        wait for 10 ns;
        
        -- Test case 2: 1 + 1
        A_tb <= "0000000000000001"; B_tb <= "0000000000000001";
        wait for 10 ns;
        
        -- Test case 3: Maximum values
        A_tb <= "1111111111111111"; B_tb <= "1111111111111111";
        wait for 10 ns;
        
        -- Test case 4: Random values
        A_tb <= "1010101010101010"; B_tb <= "0101010101010101";
        wait for 10 ns;
        
        -- Stop simulation
        wait;
    end process;

end testbench;
