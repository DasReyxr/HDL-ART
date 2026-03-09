----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
-------- LedMatrix --------
-------- 05/12/2024 --------
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

--------- Pin/out ---------
entity LedMatrix is
	port
		(
		CLK,SW	: in std_logic;
		CS, CLK2, DIN	: out std_logic
		);
end LedMatrix;

architecture juve3dstudio of LedMatrix is
    -- Main Machine --
    signal actual, siguiente : std_logic_vector (6 downto 0) :=  "0000000" ;
    -- Program Counter --
    signal PC,PC_H : std_logic_vector (4 downto 0) := "00000";
    signal EN_PC : std_logic ;
    -- 1 Second Counter --
    signal c, cplus : std_logic_vector(24 downto 0) := (others => '0'); -- 25 Bits 
    signal d : std_logic_vector (1 downto 0) := "00";

    -- DIN --
    signal Qsig, Qs, BUSS: std_logic_vector (15 downto 0):= "0000000000000000";

    -- Data --
    signal ADDRESS : std_logic_vector (3 downto 0):= "0000";    
    signal DATA : std_logic_vector (7 downto 0) := "00000000";
    signal TRANS : STD_LOGIC_VECTOR (2 downto 0) := "000"; -- 5
    signal DATA1, DATA2 ,DATA3, DATA4, DATA5, DATA6, DATA7, DATA8 : std_logic_vector (7 downto 0) := "00000000";
    constant m : integer := 1;
    constant tim : integer := 33554431;

begin
    ----- 1 Second Counter ----- 
    -- Memoria --
    c <= cplus when clk'event and clk='1';
    -- Logica de estado Siguiente --
    cplus <= c+'1' when (c <= tim) else (others => '0');
    -- Logica de Salida --
    TRANS <= TRANS + '1' when c = tim and clk'event and clk = '1';
    --TRANS <= TRANS + '1' when SW'event and SW = '0';

    ----- Main Machine -----  
    -- Memoria --
    actual <= siguiente when CLK'event and CLK = '1'; 
    -- Logica de estado Siguiente --
    siguiente <= actual + '1' when actual < 67  else (others => '0') ;
    -- Logica de Salida --
    CS<= '0' when actual>=0 and actual< 66 else '1' ;

    CLK2 <=  actual(1);
	

    --------- Data ---------
    -- 0x00,0x24,0x00,0x42,0x42,0x3C,0x00,0x00,
    -- 0x00,0x24,0x00,0x00,0x7E,0x00,0x00,0x00,
    -- 0x07,0x27,0x01,0x00,0x3C,0x42,0x42,0x00,
    -- 0x3F,0x3F,0x0F,0x07,0x3F,0x41,0x41,0x00,
    
    -- 0xFF,0xFF,0xFF,0x7F,0x3F,0x5F,0x4F,0x07,
    -- 0x90,0x12,0xBC,0x7C,0x7D,0x38,0x31,0x84,
    -- 0x00,0xA5,0x42,0xA5,0x00,0x3C,0x0C,0x00,
    
    DATA1 <= 
        x"00" when TRANS < 3 and TRANS >0 else
        x"07" when TRANS = 3 else
        x"3F" when TRANS = 4 else
        x"FF" when TRANS = 5 else
        x"90" when TRANS = 6 else
        x"00" when TRANS = 7 else
        x"00";
        
    DATA2 <= 
        x"24" when TRANS < 3 and TRANS >0 else
        x"27" when TRANS = 3 else
        x"3F" when TRANS = 4 else
        x"FF" when TRANS = 5 else
        x"12" when TRANS = 6 else
        x"A5" when TRANS = 7 else
        x"00";
        
    DATA3 <= 
        x"00" when TRANS < 3 and TRANS >0 else
        x"01" when TRANS = 3 else
        x"0F" when TRANS = 4 else
        x"FF" when TRANS = 5 else
        x"BC" when TRANS = 6 else
        x"42" when TRANS = 7 else
        x"00";
        
    DATA4 <= 
        x"42" when TRANS = 1 else
        x"00" when TRANS = 2 or TRANS = 3  else
        x"07" when TRANS = 4 else
        x"7F" when TRANS = 5 else
        x"7C" when TRANS = 6 else
        x"A5" when TRANS = 7 else
        x"00";
        
    DATA5 <= 
        x"42" when TRANS = 1 else
        x"7E" when TRANS = 2 else
        x"3C" when TRANS = 3 else
        x"3F" when TRANS = 4  else
        x"7D" when TRANS = 6 else
        x"00" when TRANS = 7 else
        x"00";
        
    DATA6 <= 
        x"3C" when TRANS = 1 else
        x"00" when TRANS = 2 else
        x"42" when TRANS = 3 else
        x"41" when TRANS = 4 else
        x"5F" when TRANS = 5 else
        x"38" when TRANS = 6 else
        x"3C" when TRANS = 7 else
        x"00";
        
    DATA7 <= 
        x"00" when TRANS < 3 and TRANS >0 else
        x"42" when TRANS = 3 else
        x"41" when TRANS = 4 else
        x"4F" when TRANS = 5 else 
        x"31" when TRANS = 6 else
        x"0C" when TRANS = 7 else
        x"00";

    DATA8 <= 
        x"00" when TRANS < 5 else
        x"07" when TRANS = 5 else 
        x"84" when TRANS = 6 else
        x"00" when TRANS = 7 else
        x"00";



    ------ Program Counter ------
    ADDRESS <= 
        x"C" when PC = 0 else
        x"A" when PC = 1 else
        x"B" when PC = 2 else
        unsigned(PC(3 downto 0)) - 2;

    PC <= PC_H  when EN_PC = '1' and clk'event and clk = '1';
    PC_H <= PC + '1' when  PC < 10 else "00000";

    EN_PC <= '1' when (actual = 65) else '0'; -- numero maximo de estados

    DATA <= 
        x"01" when PC = 0 else
        x"00" when PC = 1 else
        x"07" when PC = 2 else
        DATA1 when PC = 3 else
        DATA2 when PC = 4 else
        DATA3 when PC = 5 else
        DATA4 when PC = 6 else
        DATA5 when PC = 7 else
        DATA6 when PC = 8 else
        DATA7 when PC = 9 else
        DATA8 when PC = 10 else
        x"00";

    BUSS <= "0000" & ADDRESS (3 downto 0) & DATA (7 downto 0) ;        
    

    -------- Shift Register --------


    -- Estado siguiente
    Qsig <= 
        BUSS when actual <  4 else -- Load Mode
        Qs(14 downto 0) & '0';
    -- Registro
    Qs <= Qsig when Clk'event and CLK = '1' and actual(1 downto 0) = "01";
    -- Salida
    DIN <= Qs(15); 

end juve3dstudio;



