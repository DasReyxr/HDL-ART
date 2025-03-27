library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MultiplierSigned_tb is
end MultiplierSigned_tb;

architecture test of MultiplierSigned_tb is
    signal signQ, signM : std_logic;
    signal RQ, RM : std_logic_vector(7 downto 0);
    signal Sign : std_logic;
    signal P : std_logic_vector(15 downto 0);

    component MultiplierSigned
        Port (
            signQ, signM : in std_logic;
            RQ, RM : in STD_LOGIC_VECTOR(7 downto 0);
            Sign : out std_logic;
            P : out std_logic_VECTOR(15 downto 0)
        );
    end component;

begin
    UUT: MultiplierSigned port map (
        signQ => signQ,
        signM => signM,
        RQ => RQ,
        RM => RM,
        Sign => Sign,
        P => P
    );

    process
    begin
        -- Test Case 1: 5 * 3 = 15
        signQ <= '1';  RQ <= x"32"; 
        signM <= '0';  RM <= x"01";
        wait for 10 ns;
        
        -- Test Case 2: -5 * 3 = -15
        signQ <= '0';  RQ <= x"32"; 
        signM <= '1';  RM <= x"01";
        wait for 10 ns;
        
        -- Test Case 3: 5 * -3 = -15
        signQ <= '0';  RQ <= x"01"; 
        signM <= '1';  RM <= x"01";
        wait for 10 ns;
        
        -- Test Case 4: -5 * -3 = 15
        signQ <= '1';  RQ <= x"01"; 
        signM <= '1';  RM <= x"01";
        wait for 10 ns;
        
        -- Test Case 5: -128 * 1 = -128
        signQ <= '1';  RQ <= "10000000"; 
        signM <= '0';  RM <= "00000001";
        wait for 10 ns;
        
        -- Test Case 6: 127 * 2 = 254
        signQ <= '0';  RQ <= "01111111"; 
        signM <= '0';  RM <= "00000010";
        wait for 10 ns;
        
        -- End Simulation
        wait;
    end process;

end test;
