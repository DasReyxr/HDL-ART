----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
---------- Guzzer ----------
-------- 10/09/2024 --------
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity GuzzerMatrix is
    port
    (
    CLK	: in std_logic;
    Buzzer : out std_logic ;
    --- Sequencer ---
    rowSelect: out std_logic_vector(3 downto 0);
      
    --- Matrix Keyboard ---
    ColumnBus : in std_logic_vector(3 downto 0)

    );
end GuzzerMatrix;

architecture juve3dstudio of GuzzerMatrix is
    signal Count2 : STD_LOGIC_VECTOR(1 downto 0) := "00"; 
    signal siguiente, actual : STD_LOGIC_VECTOR(17 downto 0) := "000000000000000000";
    signal mux : STD_LOGIC_VECTOR(16 downto 0) := "00000000000000000";
    signal SequencerBus      : std_logic_vector(3 downto 0) := "0000";
	----- Musical Variables -----
    -- half
        signal DoMicha :STD_LOGIC_VECTOR(16 downto 0) := "10111010101000100"; -- 191111
        signal DoSosMicha :STD_LOGIC_VECTOR(16 downto 0) := "10110000001010011"; -- 180390
        signal ReMicha :STD_LOGIC_VECTOR(16 downto 0) := "10100110010001101"; -- 170266
        signal ReSosMicha :STD_LOGIC_VECTOR(16 downto 0) := "10011100111100001"; -- 160706
        signal MiMicha :STD_LOGIC_VECTOR(16 downto 0) := "10010100001000100"; -- 151687
        signal FaMicha :STD_LOGIC_VECTOR(16 downto 0) := "10001011110100011"; -- 143174
        signal FaSosMicha :STD_LOGIC_VECTOR(16 downto 0) := "10000011111110010"; -- 135140
        signal SolMicha :STD_LOGIC_VECTOR(16 downto 0) := "01111100100100001"; -- 127553
        signal SolSosMicha :STD_LOGIC_VECTOR(16 downto 0) := "01110101100100110"; -- 120396
        signal LaMicha :STD_LOGIC_VECTOR(16 downto 0) := "01101110111110011"; -- 113638
        signal LaSosMicha :STD_LOGIC_VECTOR(16 downto 0) := "01101000101111111"; -- 107261
        signal SiMicha :STD_LOGIC_VECTOR(16 downto 0) := "01100010110111101"; -- 101241
    
begin
	Count2 <= Count2 + '1' when CLK'event and CLK = '1' and ColumnBus = "0000";

    with Count2 select
    rowSelect<= "1ZZZ" when "00",
                "Z1ZZ" when "01",
                "ZZ1Z" when "10",
                "ZZZ1" when "11",
                "ZZZZ" when others;

    
    SequencerBus <= "0000" when Count2 = "00" and ColumnBus = "0000" else  -- 0
            "0001" when Count2 = "00" and ColumnBus = "0001" else  -- 1 
            "0010" when Count2 = "00" and ColumnBus = "0010" else  -- 2
            "0011" when Count2 = "00" and ColumnBus = "0100" else  -- 3
            "0100" when Count2 = "00" and ColumnBus = "1000" else  -- 4
            
            "0101" when Count2 = "01" and ColumnBus = "0001" else  -- 5
            "0110" when Count2 = "01" and ColumnBus = "0010" else  -- 6
            "0111" when Count2 = "01" and ColumnBus = "0100" else  -- 7
            "1000" when Count2 = "01" and ColumnBus = "1000" else  -- 8
            
            "1001" when Count2 = "10" and ColumnBus = "0001" else  -- 9
            "1010" when Count2 = "10" and ColumnBus = "0010" else  -- 10
            "1011" when Count2 = "10" and ColumnBus = "0100" else  -- 11
            "1100" when Count2 = "10" and ColumnBus = "1000" else  -- 12
            
            "1101" when Count2 = "11" and ColumnBus = "0001" else  -- 13
            "1110" when Count2 = "11" and ColumnBus = "0010" else  -- 14
            "1111" when Count2 = "11" and ColumnBus = "0100" else  -- 15
            "ZZZZ";

    
    mux <= DoMicha    	when SequencerBus = "0000"  else  -- 0
            DoSosMicha 	when SequencerBus = "0001"  else  -- 1 
            ReMicha    	when SequencerBus = "0010"  else  -- 2
            ReSosMicha 	when SequencerBus = "0011"  else  -- 3
            MiMicha    	when SequencerBus = "0100"  else  -- 4
            
            FaMicha    	when SequencerBus = "0101"  else  -- 5
            FaSosMicha 	when SequencerBus = "0110"  else  -- 6
            SolMicha   	when SequencerBus = "0111"  else  -- 7
            SolSosMicha	when SequencerBus = "1000"  else  -- 8

            LaMicha 	when SequencerBus = "1001"  else  -- 9
            LaSosMicha 	when SequencerBus = "1010"  else  -- 10
            SiMicha 	when SequencerBus = "1011"  else  -- 11
            "00000000000000000";


	-- Memoria --
	actual <= siguiente when CLK'event and CLK = '1'; 
	-- Logica de estado Siguiente --
	siguiente <= actual + '1' when actual < mux & '0' else "000000000000000000";
	-- Logica de Salida --
	Buzzer <= '0' when actual < mux  and not(ColumnBus = "0000") else '1'; 
	
end juve3dstudio;

