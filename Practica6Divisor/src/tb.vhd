library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Divisor_tb is
end Divisor_tb;

architecture behavior of Divisor_tb is

    component Divisor8Bits
        port(
            N, ED : in std_logic_vector(7 downto 0);
            SN, SD : in std_logic;
            Quot,gbg: out std_logic_vector(7 downto 0);
				Sq : out std_logic
        );
    end component;

    -- Signals to connect to the UUT
    signal N, ED,Quot,gbg : std_logic_vector(7 downto 0);
    signal SN, SD : std_logic;
    signal Sq	 : std_logic;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Divisor8Bits
        port map (
            N => N,
            ED => ED,
            SN => SN,
            SD => SD,
            Quot => Quot,
            gbg => gbg,
				Sq => Sq
          
        );

    -- Stimulus process
    stim_proc: process
    begin 
        -- Initialize inputs
 
        N  <= x"F0";ED <= x"0A"; 
        SN<= '0'; SD <= '0'; 
        wait for 10 ns;
        
        N  <= x"27";ED <= x"03"; 
        SN<= '1'; SD <= '0'; 
        wait for 10 ns;
        
        N  <= x"0F";ED <= x"04"; 
        SN<= '1'; SD <= '1'; 
        wait for 10 ns;
        
        N  <= x"FF";ED <= x"01"; 
        SN<= '0'; SD <= '1'; 
        wait for 10 ns;
        
        wait;
    end process;

end behavior;