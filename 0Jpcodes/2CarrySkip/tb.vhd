
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CarrySkip
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         S : OUT  std_logic_vector(3 downto 0);
         cin : IN  std_logic;
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal cin : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(3 downto 0);
   signal cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CarrySkip PORT MAP (
          A => A,
          B => B,
          S => S,
          cin => cin,
          cout => cout
        );


   -- Stimulus process
   stim_proc: process
   begin		
    cin <= '0'; 
    wait for 1 us;	
    A <= "0101"; B<= "1010";

    wait for 1 us;	
    A <= "1101"; B<= "1010";
    
    wait for 1 us;	
    A <= "0000"; B<= "0000";

    wait for 1 us;	
    A <= "1111"; B<= "1111";

    wait for 1 us;	
    A <= "1011"; B<= "0010";


      wait;
   end process;

END;
