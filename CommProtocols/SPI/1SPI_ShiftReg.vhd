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
        sample_strobe, SCLK: out std_logic;
        MOSI : out std_logic
	);
end ;




architecture juve3dstudio of SPI_Clock is
        signal sclk_d, sclk_out : std_logic := '0';
        signal sample_strobe_d: std_logic := '0';
        signal rise, fall, spi_en : std_logic := '0';
        
        signal state, state_next : state_t := IDLE;
        
        type state_t is (
                IDLE,
                LOAD,
                SHIFT,
                DONE
                );

        
        signal shift_reg, shift_reg_n : std_logic_vector(FRAME_BITS-1 downto 0) := (others => '0');
        signal bit_cnt, bit_cnt_n    : integer range 0 to FRAME_BITS := 0;
        
        signal done_n, done_flag : std_logic := '0';
        signal MOSI_n : std_logic := '0';
        --- DEBUG SIGNALS ---
        signal mosi_dbg : std_logic_vector(1 downto 0) := (others => '0');
begin
        spi_en <= not NSS;

        process(clk)
        begin
        if rising_edge(clk) then
                sclk_d <= sclk_out;
        end if;
        end process;


        process(clk)
        begin
        if rising_edge(clk) then
                if spi_en = '1' then
                        sclk_out <= not sclk_out;
                else
                        sclk_out <= CPOL;  -- idle state
                end if;
        end if;
        end process;

        rise <= '1' when (sclk_out = '1' and sclk_d = '0') else '0';
        fall <= '1' when (sclk_out = '0' and sclk_d = '1') else '0';

        sample_strobe <= '1' when (
                spi_en = '1' and (
                (CPHA = '0' and rise = '1') or
                (CPHA = '1' and fall = '1')
        )) else '0';

        SCLK <= sclk_out;

        state_next <=   IDLE  when  spi_en = '0' else
                        LOAD  when (state = SHIFT and bit_cnt < FRAME_BITS) or (state = IDLE and bit_cnt = 0)  else
                        SHIFT when (state = LOAD  and bit_cnt < FRAME_BITS)  else
                        DONE  when (state = SHIFT and bit_cnt = FRAME_BITS) else
                        state;
        --- LOAD --
        MOSI_n  <= shift_reg(FRAME_BITS-1) when state = LOAD else
                '0' when state = IDLE or state = DONE
                else MOSI;
        --- SHIFT ---

        shift_reg_n <= shift_reg(FRAME_BITS-2 downto 0) & '0' when state = SHIFT else
                      DATAIN when state = LOAD and bit_cnt = 0 else
                      shift_reg;
        bit_cnt_n <= bit_cnt + 1 when bit_cnt<FRAME_BITS and  state = LOAD else
                     0 when state = IDLE or bit_cnt = FRAME_BITS else
                     bit_cnt;

        -- DONE --
        done_n <= '1' when state = DONE else '0';

        process(clk)
        begin
        if rising_edge(clk) then
                if sample_strobe = '1' then
                state     <= state_next;
                bit_cnt   <= bit_cnt_n;
                shift_reg <= shift_reg_n;
                MOSI      <= MOSI_n;
                done_flag   <= done_n;        
                end if;
        end if;
        end process;


        --- DEBUG SIGNALS ---
        mosi_dbg <= '0'&MOSI  ;
end juve3dstudio;