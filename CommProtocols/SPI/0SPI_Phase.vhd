----------- Code -----------
---------  Das ---------
------ SPI_Clock  ------
---- I date 20/06/2026 ----
---- C date 25/06/2026 ----
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
--------- Pin/out ---------
entity SPI_Clock is
	port (
        clk, NSS : in std_logic;
        CPOL, CPHA : in std_logic;
        sample_strobe, SCLK: out std_logic
	);
end ;




architecture juve3dstudio of SPI_Clock is
     
        signal sclk_d, sclk_out : std_logic := '0';
        signal sample_strobe_d: std_logic := '0';
        signal rise, fall, spi_en : std_logic := '0';
begin

        process(clk)
        begin
        if rising_edge(clk) then
                sclk_d <= sclk_out;
                spi_en <= not NSS;
                sample_strobe_d <= sample_strobe;
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
end juve3dstudio;


--        clk_cpol <=     clk     when CPOL = '0' else
--                        not clk when CPOL = '1';
--      CPOL
--  CLK  0   |  clk_cpol
-- !CLK  1   | !clk_cpol
-- clk_cpol <= (CLK & !CPOL) OR (!CLK & CPOL) 
                               
-- CLK Phase doesnt affect the Wave form, only affects the FSM

