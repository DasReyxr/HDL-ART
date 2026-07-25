----------- Code -----------
---------  Das ---------
------ SPI_Clock  ------
---- I date 25/06/2026 ----
---- C date 25/06/2026 ----
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
--------- Pin/out ---------
entity SPI_Clock is
    generic (
        FRAME_BITS : integer := 8
    );
	port (
        clk, NSS : in std_logic;
        CPOL, CPHA : in std_logic;
        DATAIN : in std_logic_vector(FRAME_BITS-1 downto 0);
        SCLK: out std_logic;
        MOSI : out std_logic;
        done_flag : out std_logic
	);
end ;
---- TODO: Add DONE Flag --



architecture juve3dstudio of SPI_Clock is
        constant SCLK_DIV : integer := 4; -- Divides system clock by 4 for SPI clock
        signal clk_div_cnt : integer range 0 to SCLK_DIV-1 := 0;
        signal sclk_tick : std_logic := '0';
        
        signal sclk_d, sclk_out : std_logic := '0';
        signal rise, fall, spi_en : std_logic := '0';
        signal update_strobe : std_logic := '0';
        
        type state_t is (
                IDLE,
                WAIT_HALF,
                SHIFT,
                DONE
        );

        signal state : state_t := IDLE;
        signal shift_reg : std_logic_vector(FRAME_BITS-1 downto 0) := (others => '0');
        signal bit_cnt : integer range 0 to FRAME_BITS := 0;
        signal sclk_enable : std_logic := '0';
        
begin
        spi_en <= not NSS;

        -- Clock divider for SCLK generation
        process(clk)
        begin
        if rising_edge(clk) then
                if sclk_enable = '1' then
                        if clk_div_cnt = SCLK_DIV-1 then
                                clk_div_cnt <= 0;
                                sclk_tick <= '1';
                        else
                                clk_div_cnt <= clk_div_cnt + 1;
                                sclk_tick <= '0';
                        end if;
                else
                        clk_div_cnt <= 0;
                        sclk_tick <= '0';
                end if;
        end if;
        end process;

        -- Delayed SCLK for edge detection
        process(clk)
        begin
        if rising_edge(clk) then
                sclk_d <= sclk_out;
        end if;
        end process;

        -- SCLK generation
        process(clk)
        begin
        if rising_edge(clk) then
                if sclk_enable = '0' then
                        sclk_out <= CPOL;  -- idle state
                elsif sclk_tick = '1' then
                        sclk_out <= not sclk_out;
                end if;
        end if;
        end process;

        rise <= '1' when (sclk_out = '1' and sclk_d = '0') else '0';
        fall <= '1' when (sclk_out = '0' and sclk_d = '1') else '0';

        -- For CPHA=0: update on falling edge (after slave samples on rising edge)
        -- For CPHA=1: update on rising edge (after slave samples on falling edge)
        update_strobe <= '1' when (
                (CPHA = '0' and fall = '1') or
                (CPHA = '1' and rise = '1')
        ) else '0';

        SCLK <= sclk_out;

        -- Main state machine and data path
        process(clk)
        begin
        if rising_edge(clk) then
                if spi_en = '0' then
                        state <= IDLE;
                        bit_cnt <= 0;
                        shift_reg <= (others => '0');
                        MOSI <= '0';
                        done_flag <= '0';
                        sclk_enable <= '0';
                else
                        case state is
                                when IDLE =>
                                        -- Load data and output first bit
                                        shift_reg <= DATAIN;
                                        MOSI <= DATAIN(FRAME_BITS-1);
                                        bit_cnt <= 0;
                                        done_flag <= '0';
                                        sclk_enable <= '1';  -- Enable SCLK
                                        state <= WAIT_HALF;
                                
                                when WAIT_HALF =>
                                        -- Wait for first SCLK edge before entering SHIFT
                                        if (CPHA = '0' and rise = '1') or (CPHA = '1' and fall = '1') then
                                                state <= SHIFT;
                                        end if;
                                        
                                when SHIFT =>
                                        if update_strobe = '1' then
                                                if bit_cnt < FRAME_BITS-1 then
                                                        -- Shift and output next bit
                                                        shift_reg <= shift_reg(FRAME_BITS-2 downto 0) & '0';
                                                        MOSI <= shift_reg(FRAME_BITS-2);
                                                        bit_cnt <= bit_cnt + 1;
                                                else
                                                        -- All bits transmitted
                                                        MOSI <= '0';
                                                        done_flag <= '1';
                                                        sclk_enable <= '0';  -- Stop SCLK
                                                        state <= DONE;
                                                end if;
                                        end if;
                                        
                                when DONE =>
                                        done_flag <= '1';
                                        MOSI <= '0';
                                        sclk_enable <= '0';
                                        -- Stay in DONE state until NSS goes high
                                        
                        end case;
                end if;
        end if;
        end process;
        
end juve3dstudio;