----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
-------- LedMatrixDas --------
-------- 24/04/2025 --------
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
--------- Pin/out ---------
entity LedMatrixDas is
	port
		(
		CLK	: in std_logic;
		CS, CLK2, DIN	: out std_logic
		);
end LedMatrixDas;

architecture juve3dstudio of LedMatrixDas is
    -- Counters --
    signal PC,PC_H : unsigned (4 downto 0) := "00000";
    --
    signal CCLK2, EN_PC, LOAD, SIMON : std_logic ;
    signal actual, siguiente : unsigned (6 downto 0) :=  "0000000" ;
    signal c, cplus : unsigned(24 downto 0) := "0000000000000000000000000"; -- 25 Bits 
    signal d : std_logic_vector (1 downto 0) := "00";

    signal Qsig, Qs, BUSS: std_logic_vector (15 downto 0):= "0000000000000000";
  
    signal ADDRESS : unsigned (3 downto 0):= "0000";
    -- Data --
    
    signal DATA : std_logic_vector (7 downto 0) := "00000000";
    signal ANGEL : unsigned (2 downto 0) := "000"; -- 5
    type array8 is array (1 to 8) of std_logic_vector(7 downto 0);
    signal DATAx : array8 ; 
    


begin
    
    c <= cplus when clk'event and clk='1';
    cplus <= c+ 1 when (c < 270000001) else "0000000000000000000000000";
    ANGEL <= ANGEL + 1 when c = 270000000 and clk'event and clk='1';

    -- Memoria --
    actual <= siguiente when CLK'event and CLK = '1'; 
    -- Logica de estado Siguiente --
    siguiente <= actual + 1 when actual < 67  else (others => '0') ;
    -- Logica de Salida --
    CS<= '0' when actual>=0 and actual< 66 else '1' ;
    --CS <= '0' when (actual < 64)  else '1';


    CCLK2 <=  actual(1);
	CLK2 <= CCLK2;

    --------- Configuration ---------
    DATAx(1) <= x"00";
    DATAx(2) <= x"00";
    DATAx(3) <= x"24";
    DATAx(4) <= x"00";
    
    DATAx(5) <= 
            x"42" when ANGEL = 0 else
            x"00" ;
    
    DATAx(6) <= 
            x"3C" when ANGEL = 0 else
            x"7E" when ANGEL = 1 else
            x"3C";
    
    DATAx(7) <= 
            x"00" when ANGEL <3 else
            
            x"42";
    
    DATAx(8) <= x"00";

    --  1     2   
    -- 0x00,0x00,0x24,0x00,0x42,0x3C,0x00,0x00,
    -- 0x00,0x00,0x24,0x00,0x00,0x7E,0x00,0x00,
    -- 0x00,0x00,0x24,0x00,0x00,0x3C,0x42,0x00,

    ------ Program Counter
    ADDRESS <= 
        x"C" when (PC = 0) else
        x"B" when (PC = 1) else
        x"A" when (PC = 2) else
        x"F" when PC = 3 else
        unsigned(PC(3 downto 0)) - 3;

    PC <= PC_H  when EN_PC = '1' and clk'event and clk = '1';
    PC_H <= PC + 1 when  PC < 11 else "00000";

    EN_PC <= '1' when (actual = 65) else '0'; -- numero maximo de estados

    DATA <= 
        x"01" when PC_H = 0 else
        x"07" when PC_H = 1 else
        x"0F" when PC_H = 2 else
        x"00" when PC_H = 3 else
        DATAx(1) when PC_H = 4 else
        DATAx(2) when PC_H = 5 else
        DATAx(3) when PC_H = 6 else
        DATAx(4) when PC_H = 7 else
        DATAx(5) when PC_H = 8 else
        DATAx(6) when PC_H = 9 else
        DATAx(7) when PC_H = 10 else
        DATAx(8) when PC_H = 11 else
        x"00";


    BUSS <= "0000" & std_logic_vector(ADDRESS (3 downto 0)) & DATA (7 downto 0) ;        
    

    -------- PISO MOMENT --------

    SIMON <= '1' when actual(1 downto 0) = "01" else '0';

    LOAD <= '0' when actual <  4 else '1'; -- Load Mode
    -- Estado siguiente
    Qsig <= 
        BUSS when LOAD = '0' else
        Qs(14 downto 0) & '0';
    -- Registro
    Qs <= Qsig when Clk'event and CLK = '1' and SIMON = '1';
    -- Salida
    
    DIN <= Qs(15); 

end juve3dstudio;



