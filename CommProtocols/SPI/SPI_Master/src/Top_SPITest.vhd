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
entity Top_SPITest is
	port (
        clk : in std_logic;
        SCLK: out std_logic;
        MOSI : out std_logic;
        done : out std_logic
	);
end ;



architecture juve3dstudio of Top_SPITest is
	

        component SPI_Clock is
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
        end component;

        type array8 is array (1 to 256) of std_logic_vector(7 downto 0);
        constant VROMIN : array8 := (x"57",
                x"01", x"50", x"45", x"50", -- Data values for addresses 0 to 3
                x"45", x"50", x"45", x"50", -- Data values for addresses 4 to 7
                x"45", x"50", x"45", x"50", -- Data values for addresses 8 to 11
                x"45", x"50", x"45", x"50",  -- Data values for addresses 12 to 15
                x"46", x"50", x"46", x"50",
                x"46", x"50", x"46", x"50",
                x"46", x"50", x"46", x"50",
                x"46", x"50",x"46", x"50",x"44" ,
        others => x"FF" -- Remaining addresses 16 to 255 filled with zeros
        );
begin

    U0: SPI_Clock port map(
        clk => clk,
        NSS => '0',
        CPOL => '0',
        CPHA => '0',
        DATAIN => x"27",
        SCLK => SCLK,
        MOSI => MOSI,
        done_flag => done
    );
--    MOSI <= '1';

end juve3dstudio;