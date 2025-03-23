--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:16:32 09/10/2024
-- Design Name:   
-- Module Name:   /home/ise/Vm/Guzzer/Guzzer/tb.vhd
-- Project Name:  Guzzer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Guzzer
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Guzzer
    PORT(
         CLK : IN  std_logic;
         Enable : IN  std_logic;
         OUTPUT : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal Enable : std_logic := '0';

 	--Outputs
   signal OUTPUT : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Guzzer PORT MAP (
          CLK => CLK,
          Enable => Enable,
          OUTPUT => OUTPUT
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		Enable <= '1';
		wait for 1600 us;
		Enable <= '0';
		wait for 800 us;		
		Enable <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;
