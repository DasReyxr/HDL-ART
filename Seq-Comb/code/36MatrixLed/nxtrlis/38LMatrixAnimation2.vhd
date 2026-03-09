library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 



entity PROYECTO is
	port
		(
		CLK,SW	: in std_logic;
		CS, CLK2, DIN	: out std_logic
		);
end PROYECTO;

architecture BEHAVIORAL of PROYECTO is
    -- Main Machine --
    signal actual, siguiente : std_logic_vector (6 downto 0) :=  "0000000" ;
    -- Program Counter --
    signal PC,PC_H : std_logic_vector (4 downto 0) := "00000";
    signal EN_PC : std_logic ;
    -- 1 Second Counter --
    signal c, cplus : std_logic_vector(26 downto 0) := (others => '0');  
    signal d : std_logic_vector (1 downto 0) := "00";

    -- DIN --
    signal Qsig, Qs, BUSS: std_logic_vector (15 downto 0):= "0000000000000000";

    -- Data --
    signal DATA : std_logic_vector (11 downto 0) := "000000000000";
    signal transition : STD_LOGIC_VECTOR (1 downto 0) := "00"; 
   signal DATA1, DATA2 ,DATA3, DATA4, DATA5, DATA6, DATA7, DATA8 : std_logic_vector (7 downto 0) := "00000000";
    
begin
    
    c <= cplus when clk'event and clk='1';
    cplus <= c+'1' when (c <= 33554431) else (others => '0');
    transition <= transition + '1' when c = 33554431 and clk'event and clk = '1';
    
    ----- Main Machine -----  
    actual <= siguiente when CLK'event and CLK = '1'; 
    siguiente <= actual + '1' when actual < 67  else (others => '0') ;
    CS<= '0' when actual>=0 and actual< 66 else '1' ;
    CLK2 <=  actual(1);
	
    
-- escena 1-    
-- 0x10,0x10,0x13,0xD4, 0xF8,0xD4,0x13,0x20,
-- 0x00,0x20,0x13,0xD4, 0xF8,0xD4,0x13,0x20,
-- 0x00,0x20,0x13,0xD4, 0xF8,0xD4,0x13,0x10,
-- 0x10,0x10,0x13,0xD4, 0xF8,0xD4,0x13,0x10,    


    with transition select
    DATA1 <= 
        x"10" when "00",
        x"00" when "01",
        x"00" when "10",
        x"10" when "11" ,
        x"00" when others;

    with transition select
    DATA2 <= 
        x"10" when "00",
        x"20" when "01",
        x"20" when "10",
        x"10" when "11" ,
        x"00" when others;
    
    with transition select
    DATA3 <= 
        x"13" when "00",
        x"13" when "01",
        x"13" when "10",
        x"13" when "11" ,
        x"00" when others;

    with transition select
    DATA4 <= 
        x"D4" when "00",
        x"D4" when "01",
        x"D4" when "10",
        x"D4" when "11" ,
        x"00" when others;

    with transition select
    DATA5 <= 
        x"F8" when "00",
        x"F8" when "01",
        x"F8" when "10",
        x"F8" when "11" ,
        x"00" when others;
    DATA6 <= DATA4;
    DATA7 <= DATA3;
    with transition select
    DATA8 <= 
        x"20" when "00",
        x"20" when "01",
        x"10" when "10",
        x"10" when "11" ,
        x"00" when others;


    PC <= PC_H  when EN_PC = '1' and clk'event and clk = '1';
    PC_H <= PC + '1' when  PC < 10 else "00000";

    EN_PC <= '1' when (actual = 65) else '0'; -- numero maximo de estados

    DATA <= 
        x"C01" when PC = 0 else
        x"A00" when PC = 1 else
        x"B07" when PC = 2 else
        "0001" & DATA1 when PC = 3 else
        "0010" & DATA2 when PC = 4 else
        "0011" & DATA3 when PC = 5 else
        "0100" & DATA4 when PC = 6 else
        "0101" & DATA5 when PC = 7 else
        "0110" & DATA6 when PC = 8 else
        "0111" & DATA7 when PC = 9 else
        "1000" & DATA8 when PC = 10 else
        x"000";

    BUSS <= "0000" & DATA (11 downto 0) ;        
    
    Qsig <= 
        BUSS when actual <  4 else -- Load Mode
        Qs(14 downto 0) & '0';
    Qs <= Qsig when Clk'event and CLK = '1' and actual(1 downto 0) = "01";
    DIN <= Qs(15); 

end BEHAVIORAL;