
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity LCD is
    Port ( 	btnr:	in std_logic;									--use BTNR as reset input
            clk:	in std_logic;									--100 MHz clock input				
            DOUT:	out std_logic_vector(7 downto 0);		--output bus, used for data transfer (DB)
            JB:	out std_logic_vector (6 downto 4)  
			);		
end LCD;
architecture FSM_Concurrent of LCD is
    -- State encoding (4 bits for up to 16 states)
    constant stPowerOn_Delay      : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    constant stFunctionSet        : STD_LOGIC_VECTOR(3 downto 0) := "0001";
    constant stFunctionSet_Delay  : STD_LOGIC_VECTOR(3 downto 0) := "0010";
    constant stDisplayCtrlSet     : STD_LOGIC_VECTOR(3 downto 0) := "0011";
    constant stDisplayCtrlSet_Delay: STD_LOGIC_VECTOR(3 downto 0) := "0100";
    constant stDisplayClear       : STD_LOGIC_VECTOR(3 downto 0) := "0101";
    constant stDisplayClear_Delay : STD_LOGIC_VECTOR(3 downto 0) := "0110";
    constant stInitDne            : STD_LOGIC_VECTOR(3 downto 0) := "0111";
    constant stActWr              : STD_LOGIC_VECTOR(3 downto 0) := "1000";
    constant stCharDelay          : STD_LOGIC_VECTOR(3 downto 0) := "1001";

    -- FSM signals
    signal stCur, stNext : STD_LOGIC_VECTOR(3 downto 0) := stPowerOn_Delay;
    signal count, next_count : STD_LOGIC_VECTOR(20 downto 0) := (others => '0');
    signal clkCount, next_clkCount : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
    signal oneUSClk, next_oneUSClk : STD_LOGIC := '0';
    signal lcd_cmd_ptr, next_lcd_cmd_ptr : integer range 0 to 23 := 0;
    signal delayOK : STD_LOGIC;
    signal writeDone : STD_LOGIC;

    type LCD_CMDS_T is array(0 to 23) of STD_LOGIC_VECTOR(8 downto 0);
    constant LCD_CMDS : LCD_CMDS_T := (
        '0'&X"3C", '0'&X"0C", '0'&X"01", '0'&X"02",
        '1'&X"48", '1'&X"65", '1'&X"6C", '1'&X"6C",
        '1'&X"6F", '1'&X"20", '1'&X"46", '1'&X"72",
        '1'&X"6F", '1'&X"6D", '1'&X"20", '1'&X"44",
        '1'&X"69", '1'&X"67", '1'&X"69", '1'&X"6C",
        '1'&X"65", '1'&X"6E", '1'&X"74", '0'&X"18"
    );

begin



    stCur       <= stPowerOn_Delay when btnr = '0' else
                   stNext          when oneUSClk'event and oneUSClk = '1' else
                   stCur;

    count       <= (others => '0') when btnr = '0' else
                   next_count      when oneUSClk'event and oneUSClk = '1' else
                   count;

    lcd_cmd_ptr <= 0               when btnr = '0' else
                   next_lcd_cmd_ptr when oneUSClk'event and oneUSClk = '1' else
                   lcd_cmd_ptr;
    -- Clock divider (puede ser otro proceso o lógica concurrente)
    -- Divisor de reloj 1us (estilo concurrente, sin process)
    
    next_clkCount <= clkCount when clk'event and clk='1';
    clkCount  <= (others => '0') when next_clkCount = "11010" 
                 else std_logic_vector(unsigned(next_clkCount) + 1);

    next_oneUSclk <= oneUSClk when clk'event and clk='1';
    oneUSClk  <= not next_oneUSClk when clkCount = "11010";

    -- NEXT STATE LOGIC (concurrente)
    stNext <= stFunctionSet         when (stCur = stPowerOn_Delay and delayOK = '1') else
              stPowerOn_Delay       when (stCur = stPowerOn_Delay) else
              stFunctionSet_Delay   when (stCur = stFunctionSet) else
              stDisplayCtrlSet      when (stCur = stFunctionSet_Delay and delayOK = '1') else
              stFunctionSet_Delay   when (stCur = stFunctionSet_Delay) else
              stDisplayCtrlSet_Delay when (stCur = stDisplayCtrlSet) else
              stDisplayClear        when (stCur = stDisplayCtrlSet_Delay and delayOK = '1') else
              stDisplayCtrlSet_Delay when (stCur = stDisplayCtrlSet_Delay) else
              stDisplayClear_Delay  when (stCur = stDisplayClear) else
              stInitDne             when (stCur = stDisplayClear_Delay and delayOK = '1') else
              stDisplayClear_Delay  when (stCur = stDisplayClear_Delay) else
              stActWr               when (stCur = stInitDne) else
              stCharDelay           when (stCur = stActWr) else
              stInitDne             when (stCur = stCharDelay and delayOK = '1') else
              stCharDelay;

    -- DelayOK logic (concurrente)
    delayOK <= '1' when (stCur = stPowerOn_Delay       and count = "111101000010010000000")  or --2000000
                       (stCur = stFunctionSet_Delay    and count = "000000000111110100000")  or --4000
                       (stCur = stDisplayCtrlSet_Delay and count = "000000000111110100000")  or --4000
                       (stCur = stDisplayClear_Delay   and count = "000100111000100000000")  or --160000
                       (stCur = stCharDelay            and count = "000111111011110100000")      --260000
               else '0';

    -- writeDone logic (concurrente)
    writeDone <= '1' when lcd_cmd_ptr = 23 else '0';

    -- next_count y next_lcd_cmd_ptr (concurrente)
    next_count <= (others => '0') when delayOK = '1' else std_logic_vector(unsigned(count) + 1);
    next_lcd_cmd_ptr <= 0 when stCur = stPowerOn_Delay else
                        lcd_cmd_ptr + 1 when ((stCur = stInitDne or stCur = stDisplayCtrlSet or stCur = stDisplayClear) and writeDone = '0') else
                        lcd_cmd_ptr;

    -- OUTPUT LOGIC (concurrente)
    JB(4) <= LCD_CMDS(lcd_cmd_ptr)(8);
    --JB(5) <= LCD_CMDS(lcd_cmd_ptr)(8);
    DOUT    <= LCD_CMDS(lcd_cmd_ptr)(7 downto 0);
    JB(6) <= '1' when stCur = stFunctionSet or stCur = stDisplayCtrlSet or stCur = stDisplayClear or stCur = stActWr
             else '0';

end FSM_Concurrent;