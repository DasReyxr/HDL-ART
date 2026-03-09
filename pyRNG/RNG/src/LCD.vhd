----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
----------- LCD -----------
---- I date 07/06/2025 ----
---- C date 07/06/2025 ----
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity LCD is
    Port ( 	clk,dlr,btnr:	in std_logic;									--use BTNR as reset input
            DATA : in std_logic_vector(7 downto 0);		--input bus, used for data transfer (DB)
            RS : in std_logic;					--register selection pin (RS)
            DOUT:	out std_logic_vector(7 downto 0);		--output bus, used for data transfer (DB)
            ControlS:	out std_logic_vector (6 downto 5)  
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
    signal prev_data,new_data : std_logic_vector(7 downto 0) := (others => '0');
    signal write_data : std_logic;
   
   
    signal stCur, stNext : STD_LOGIC_VECTOR(3 downto 0) := stPowerOn_Delay;
    signal count, next_count : STD_LOGIC_VECTOR(20 downto 0) := (others => '0');
    signal clkCount, next_clkCount : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
    signal oneUSClk, next_oneUSClk : STD_LOGIC := '0';
    signal lcd_cmd_ptr, next_lcd_cmd_ptr : integer range 0 to 23 := 0;
    signal lcd_cmd_ptr2 : std_logic := '0';
    signal delayOK,writeDone,RSclocked : STD_LOGIC;

    signal DATAclocked,DATAS : std_logic_vector(7 downto 0) := (others => '0');
    type LCD_CMDS_T is array(0 to 3) of STD_LOGIC_VECTOR(8 downto 0);
    constant LCD_CMDS : LCD_CMDS_T := (
        '0'&X"3C", '0'&X"0C", '0'&X"01", '0'&X"02" -- end configuration commands"
    );
    
signal tenMsCount : std_logic_vector(17 downto 0) := (others => '0'); -- 18 bits for up to 262143
signal tenMsClk : std_logic := '0';

begin



    stCur       <= stPowerOn_Delay when btnr = '0' else
                   stNext          when oneUSClk'event and oneUSClk = '1' else
                   stCur;


    -- Clock divider (puede ser otro proceso o lógica concurrente)
    -- Divisor de reloj 1us (estilo concurrente, sin process)
    
    next_clkCount <= clkCount when clk'event and clk='1';
    clkCount  <= (others => '0') when next_clkCount = "11010" 
                 else std_logic_vector(unsigned(next_clkCount) + 1);

    next_oneUSclk <= oneUSClk when clk'event and clk='1';
    oneUSClk  <= not next_oneUSClk when clkCount = "11010";


tenMsCount <= (others => '0') when tenMsCount = std_logic_vector(to_unsigned(269999, tenMsCount'length)) and clk'event and clk = '1'
           else std_logic_vector(unsigned(tenMsCount) + 1) when clk'event and clk = '1'
           else tenMsCount;

tenMsClk <= not tenMsClk when tenMsCount = std_logic_vector(to_unsigned(269999, tenMsCount'length)) and clk'event and clk = '1'
         else tenMsClk;
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
    count       <= (others => '0') when btnr = '0' else
                next_count      when oneUSClk'event and oneUSClk = '1' else
                count;

    next_lcd_cmd_ptr <= 0 when stCur = stPowerOn_Delay else
                        lcd_cmd_ptr + 1 when ((stCur = stInitDne or stCur = stDisplayCtrlSet or stCur = stDisplayClear) and writeDone = '0') else
                        lcd_cmd_ptr;
    lcd_cmd_ptr <= --0               when btnr = '0' else
                   next_lcd_cmd_ptr when oneUSClk'event and oneUSClk = '1' else
                   lcd_cmd_ptr;
    lcd_cmd_ptr2 <= '1' when rising_edge(oneUSClk) and dlr = '1' else lcd_cmd_ptr2;

    -- OUTPUT LOGIC (concurrente)
    prev_data <= DATA when write_data = '1' and oneUSClk'event and oneUSClk = '1' else prev_data;
    DATAclocked     <= prev_data;
    write_data <= '1' when (stCur = stActWr and DATA /= prev_data) else '0';


    RSclocked <= RS when oneUSClk'event and oneUSClk = '1';


    ControlS(5) <= '0' when lcd_cmd_ptr < 3 or(dlr= '1' and lcd_cmd_ptr2 = '0')  else
          7   RSclocked; 
    DOUT    <= x"C0" when dlr= '1' and lcd_cmd_ptr2 = '0' else 
             LCD_CMDS(lcd_cmd_ptr)(7 downto 0) when lcd_cmd_ptr < 3 else
             DATAclocked; -- Use DATA input for commands beyond the initial configuration

    ControlS(6) <= '1' when (stCur = stFunctionSet or stCur = stDisplayCtrlSet or stCur = stDisplayClear) else
               write_data;

end FSM_Concurrent;
