

----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
---- Matrix Keyboard ----
-------- 25/08/2024 --------
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

--------- Pin/out ---------
entity TMATRICIAL is
    port
        (
            --- Sequencer ---
            CLK: in std_logic;         
            rowSelect: out std_logic_vector(3 downto 0);
      
            --- Matrix Keyboard ---
            ColumnBus : in std_logic_vector(3 downto 0);
            LEDS      : out std_logic_vector(3 downto 0)
        );
end TMATRICIAL;

architecture juve3dstudio of TMATRICIAL is
    signal Count2 : STD_LOGIC_VECTOR(1 downto 0) := "00"; 
    
begin
    Count2 <= Count2 + '1' when CLK'event and CLK = '1' and ColumnBus = "0000";

    with Count2 select
    rowSelect<= "1ZZZ" when "00",
                "Z1ZZ" when "01",
                "ZZ1Z" when "10",
                "ZZZ1" when "11",
                "ZZZZ" when others;

    
    LEDS <= "0000" when Count2 = "00" and ColumnBus = "0000" else  -- 0
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

    
end juve3dstudio;
