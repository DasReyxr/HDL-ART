----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
------ IEEE Converter ------
---- I date 26/05/2025 ----
---- C date 26/05/2025 ----
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
--------- Pin/out ---------
entity IEEEConv is
	port
		(
        IEEE: in std_logic_vector(31 downto 0);
        R7 	: in std_logic
            signa : out std_logic;
            Intg : out std_logic_vector(31 downto 0);
            Frac : out unsigned(15 downto 0) -- 0.0001
            );
end ;

architecture juve3dstudio of IEEEConv is
signal  tFrac : unsigned(47 downto 0);
signal  tIntg : std_logic_vector(31 downto 0);
signal Exp : integer range 0 to 128;
    begin
    
    Sign<= IEEE(31);
    Exp <= to_integer(unsigned(IEEE(29 downto 23))) when IEEE(30) = '1' else
           127 - to_integer(unsigned(IEEE(29 downto 23)))  when IEEE(30) = '0' else
           0; -- Denormalized or zero
           
    Intg <= ((31 downto 24 =>'0')& ('1' & IEEE(22 downto 0))) sll exp-22 when Exp>23 else 
    		 (31 downto 24 =>'0')&('1' & IEEE(22 downto 0)) srl 22-exp when IEEE(30) ='1' else 
             (others => '0'); -- Zero or denormalized number
    
    tFrac <=
    		unsigned('1' & IEEE(22 downto 0) sll exp+2)*10000 when IEEE(30) ='1' else
            unsigned('1' & IEEE(22 downto 0) srl exp-1)*10000 when IEEE(30) = '0' else
            (others => '0'); -- Zero or denormalized number
    Frac <= tFrac(39 downto 24)+1;

end juve3dstudio;