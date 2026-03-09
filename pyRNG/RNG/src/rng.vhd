
----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
----------- RNG -----------
---- I date 31/05/2025 ----
---- C date 31/05/2025 ----
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
--------- Pin/out ---------
entity RNG is
	port
		(
		clk,sw,rst,done	: in std_logic;
		LCD_D	: out std_logic_Vector(7 downto 0);
        LCD_C : out std_logic_vector(6 downto 5)  -- Control signals for LCD
		);
end RNG;

architecture juve3dstudio of RNG is
    -- A to T J
    signal count_s, count_a : unsigned(8 downto 0):= (others => '0'); --2^8 256
    signal reg_s,reg_a : std_logic_vector(8 downto 0):= (others => '0');
    signal card,card_s : std_logic_vector(7 downto 0) := x"20";
    signal sw_counter,sw_counter_s : unsigned (2 downto 0) := (others => '0'); 
    signal ran,shift7,shift3,shift4 : std_logic_vector(10 downto 0):= (others => '0');
    signal dlr_s,done_s:std_logic:= '0';
component LCD
    Port ( clk,dlr,btnr:	in std_logic;										--use BTNR as reset input
            DATA : in std_logic_vector(7 downto 0);		--input bus, used for data transfer (DB)
            RS : in std_logic;					--register selection pin (RS)
            DOUT:	out std_logic_vector(7 downto 0);		--output bus, used for data transfer (DB)
            ControlS:	out std_logic_vector (6 downto 5)  
			);		
end component;
    begin

    count_s <= count_a when rising_edge(clk);
    count_a <= count_s + 1 when count_s < 255 and rst = '1' else (others => '0') ;    
    --unsigned(shift4 xor shift3)
    
    reg_s <= reg_a when rising_edge(clk);
    reg_a <= std_logic_vector(count_a) when rising_edge(sw);
    
    -- reg<<7 
    shift7 <= "0"&reg_s(3) &"0"& reg_a(8 downto 5) & "0100";
    --shift3 <= "010" & reg_s(3 downto 0)& "0" & reg_a(8) & "00";
    shift4 <= reg_s(4 downto 0) & "001" & reg_s(7 downto 5);
    ran <= shift7 xor shift4; 
    --reg>>3
    card <= 
            x"54" when ran(10 downto 9) ="11" else -- T
            x"39" when ran(9 downto 8) = "10" else
            x"38" when ran(8 downto 6) = "110" else
            x"37" when ran(7 downto 6) = "10" else
            x"36" when ran(6 downto 5) = "01" else
            x"35" when ran(5 downto 4) = "11" else
            x"34" when ran(4 downto 3) = "10" else
            x"33" when ran(3 downto 2) = "01" else
            x"4A" when ran(3 downto 1) = "111" else -- THE ICONIC JUAN???
            x"41" when ran(1 downto 0) = "01" else
            x"32";        
    sw_counter <= sw_counter_s  when rising_edge(sw);
    sw_counter_s <= (others => '0') when rst = '0' else
                    sw_counter + 1 when sw_counter <6 else sw_counter;

    --card_s <= x"20" when sw_counter > 5 else card; 
    done_s <= '1' when done = '1' or sw_counter >5 else '0';
    --xor
    LCD_inst: LCD
        port map (
            DATA => card,
            clk => clk,
            dlr => done_s,
            btnr => rst,
            RS => '1',  -- Assuming RS is always high for data transfer
            DOUT => LCD_D,  
            ControlS => LCD_C  
        );
    
end juve3dstudio;