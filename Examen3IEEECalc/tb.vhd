library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FloatingPoint_tb is
end FloatingPoint_tb;

architecture behavior of FloatingPoint_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component FloatingPoint
	port
		(
		--	Val,fracBin: in std_logic_vector(31 downto 0);
		    Val,Fract: in std_logic_vector(31 downto 0);
			Sign,clk,reset: in std_logic;
			SignO: out std_logic;
			Exp: out std_logic_vector(7 downto 0);
			Mantisa: out std_logic_vector(22 downto 0);
			IEEE : out  std_logic_vector(31 downto 0)
		);
    end component;

    -- Signals
    signal Val, fracBin : std_logic_vector(31 downto 0);
    signal Sign, clk, reset : std_logic;
    signal SignO : std_logic;
    signal Exp : std_logic_vector(7 downto 0);
    signal Mantisa : std_logic_vector(22 downto 0);
    signal IEEE : std_logic_vector(31 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: FloatingPoint
        port map (
            Val => Val,
            Fract => fracBin,
            Sign => Sign,
            clk => clk,
            reset => reset,
            SignO => SignO,
            Exp => Exp,
            Mantisa => Mantisa,
            IEEE => IEEE
        );

    -- Clock process
    clk_process :process
    begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initialize
        reset <= '1';
        Sign <= '0';
        Val <= (others => '0');
        fracBin <= (others => '0');
        wait for 10 ns;

        reset <= '0';
        
        -- Test case 1: Val = 32, fracBin = 0.75 (binary 0.11 => 1100...0)
        Val <= std_logic_vector(to_unsigned(25, 32));  -- 000...00100000
        
        
        fracBin <= x"0000000A";  -- 0.010
        Sign <= '0';
        wait for 20 ns;

        Val <= std_logic_vector(to_unsigned(0, 32));  
        fracBin <= x"0000007F";  --127
        Sign <= '1';
        wait for 20 ns;
        
        -- Test case 2: Val = 0, fracBin = 0.5 (binary 0.1)
        Val <= (others => '0');
        fracBin <= x"000001F4";  -- binary 0.5
        Sign <= '1';
        wait for 20 ns;

        -- Test case 3: Val = 128, fracBin = 0
        Val <= std_logic_vector(to_unsigned(127, 32));
        fracBin <= (others => '0');
        Sign <= '0';
        wait for 20 ns;

        -- Test case 4: Val = 0, fracBin = 0
        Val <= (others => '0');
        fracBin <= (others => '0');
        Sign <= '0';
        wait for 20 ns;

        -- Done
        wait;
    end process;

end behavior;
