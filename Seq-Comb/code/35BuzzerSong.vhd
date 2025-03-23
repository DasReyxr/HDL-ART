----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
--------- Cancion ---------
-------- 22/10/2024 --------
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

--------- Pin/out ---------
entity Cancion is
	port
		(
		CLK	: in std_logic;
        BuzzerOUT    : out std_logic
		);
end Cancion;

architecture juve3dstudio of Cancion is
    signal silencio, nxtSong, muxSil : std_logic;
    -- Counters --
    signal CountNotas : std_logic_vector (4 downto 0) := "00000";
    -- Maquinas --
    signal siguiente, actual : STD_LOGIC_VECTOR(17 downto 0) := "000000000000000000";
    signal CountSeg,siguiente2, actual2 : STD_LOGIC_VECTOR(28 downto 0) := (others => '0') ;
    ----- Musical Variables -----
    -- half
    signal DoMicha :STD_LOGIC_VECTOR(14 downto 0) := "100010100100000"; -- 17696

    signal DomMicha :STD_LOGIC_VECTOR(14 downto 0) := "100000100111111"; -- 16703
    
    signal ReMicha :STD_LOGIC_VECTOR(14 downto 0) := "011110110010110"; -- 15766
    
    signal RemMicha :STD_LOGIC_VECTOR(14 downto 0) := "011101000100001"; -- 14881
    
    signal MiMicha :STD_LOGIC_VECTOR(14 downto 0) := "011011011011101"; -- 14045
    
    signal FaMicha :STD_LOGIC_VECTOR(14 downto 0) := "011001111001001"; -- 13257
    
    signal FamMicha :STD_LOGIC_VECTOR(14 downto 0) := "011000011100001"; -- 12513
    
    signal SolMicha :STD_LOGIC_VECTOR(14 downto 0) := "010111000100011"; -- 11811
    
    signal SolmMicha :STD_LOGIC_VECTOR(14 downto 0) := "010101110001100"; -- 11148
    
    signal LaMicha :STD_LOGIC_VECTOR(14 downto 0) := "010100100011010"; -- 10522
    
    signal LamMicha :STD_LOGIC_VECTOR(14 downto 0) := "010011011001100"; -- 9932
    
    signal SiMicha :STD_LOGIC_VECTOR(14 downto 0) := "010010010011110"; -- 9374

    
    signal mux : STD_LOGIC_VECTOR(14 downto 0) := "000000000000000";
    signal Sil :STD_LOGIC := '1';
    
begin

    CountNotas <= CountNotas + '1' when CLK'event and CLK = '1' and nxtSong = '1'; 
    --CountN being n the number of notes

    -- 1001101110001011000011 Tiempo total 0.20 
    -- 100110111000101100001 nota .55/8


    --
    ------- Maquina de estados 2 ------- 
    -- Memoria --
	CountSeg <= siguiente2 when CLK'event and CLK = '1'; 
	-- Logica de estado Siguiente2 --
	siguiente2 <= CountSeg + '1' when CountSeg < 5096838 else (others => '0') ; --Tiempo total (1/16+1/32) 
	-- Logica de Salida --
	
    nxtSong <= '1' when CountSeg = 5096838  else '0'; --0.8 segundos
    silencio <= '1' when CountSeg >  1274209 and muxSil = '1' else '0' ; -- 1/32 segundos

    ------- Maquina de estados 1 -------

    mux <= 
        DoMicha when CountNotas = "00000" else 
        DoMicha when CountNotas = "00001" else 
        ReMicha when CountNotas = "00010" else 
        DoMicha when CountNotas = "00011" else 

        LaMicha when CountNotas = "00100" else 
        LaMicha when CountNotas = "00101" else 
        SolMicha when CountNotas = "00110" else 
        SolMicha when CountNotas = "00111" else 
        
        DoMicha when CountNotas = "01000" else 
        DoMicha when CountNotas = "01001" else 
        ReMicha when CountNotas = "01010" else 
        DoMicha when CountNotas = "01011" else 
        
        SolMicha when CountNotas = "01100" else 
        SolMicha when CountNotas = "01101" else 
        FaMicha when CountNotas = "01110" else 
        FaMicha when CountNotas = "01111" else 
        
        DoMicha when CountNotas = "10000" else 
        DoMicha when CountNotas = "10001" else 
        ReMicha when CountNotas = "10010" else 
        DoMicha when CountNotas = "10011" else 
        
        FaMicha when CountNotas = "10100" else 
        SolMicha when CountNotas = "10101" else 
        MiMicha when CountNotas = "10110" else 
        ReMicha when CountNotas = "10111" else 
        
        DoMicha when CountNotas = "11000" else 
        DoMicha when CountNotas = "11001" else 
        DoMicha when CountNotas = "11010" else 
        SolMicha when CountNotas = "11011" else 
        FaMicha when CountNotas = "11100" else 


            "000000000000000";


      
    muxSil <= 
            '0' when CountNotas = "00111" else
            '0' when CountNotas = "01110" else
            '0' when CountNotas = "11001" else 
            Sil;


    -- Memoria --
    actual <= siguiente when CLK'event and CLK = '1'; 
    -- Logica de estado Siguiente --
    siguiente <= actual + '1' when actual < (mux & '0') and silencio = '0'  else "000000000000000000";
    -- Logica de Salida --
    BuzzerOUT <= '1' when actual < mux   else '0'; 

end juve3dstudio;