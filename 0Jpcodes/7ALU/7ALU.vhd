----------- Code -----------
------ Orlando Reyes ------
--------- Auf Das ---------
--------- Pipeline ---------
---- I date 02/06/2025 ----
---- C date 02/06/2025 ----
------- Main Library -------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD_UNSIGNED.all;
--------- Pin/out ---------
entity ALU is
	port
		(
		opA1, opB1	: in std_logic_vector(3 downto 0); --instruccion 1 
        opA2, opB2	: in std_logic_vector(3 downto 0); --instruccion 2
        opCode1, opcode2 : in std_logic_vector(2 downto 0); --opcode de la instruccion
		result	: out std_logic_vector(3 downto 0) --resultado de la operacion
		);
end ALU;

architecture juve3dstudio of ALU is
signal result_temp,result_temp2 : std_logic_vector(3 downto 0) := (others => '0');
signal resultfwd : std_logic_vector(3 downto 0) := (others => '0');

begin
    result_temp <= opA1 or opB1 when opcode1 ="11" else
                     opA1 and opB1 when opcode1 ="10" else
                     opA1 - opB1 when opcode1 ="01" else
                     opA1 + opB1 ; -- Default case

    resultfwd <= result_temp;

    result_temp <= resultfwd or opB1 when opcode1 ="11" else
                     resultfwd and opB1 when opcode1 ="10" else
                     resultfwd - opB1 when opcode1 ="01" else
                     resultfwd + opB1 ; -- Default case

    end juve3dstudio;