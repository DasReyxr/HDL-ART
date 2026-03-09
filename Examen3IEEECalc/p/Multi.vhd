library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
--------- Pin/out ---------

entity Markiplier is
	port
		(
            Val1,Val2: in std_logic_vector(31 downto 0);
			R7Mult : out  std_logic_vector(31 downto 0)
		);
end ;

architecture bobostudio of Markiplier is

signal Exp1, Exp2: std_logic_vector(7 downto 0);
signal ExpResult      : std_logic_vector(7 downto 0);
signal SumTemp      : unsigned(8 downto 0);
signal Carry : std_logic;
signal Mant1, Mant2 : std_logic_vector(23 downto 0); 
signal MantResult : std_logic_vector(22 downto 0);
signal ProdMant     : unsigned(47 downto 0);          -- producto de 24x24 bits
signal NormMant     : unsigned(23 downto 0);

signal SignMul : std_logic;

begin

    --Signo
        SignMul <= Val1(31) XOR Val2(31);


    --Exponente
        Exp1 <= Val1(30 downto 23);
        Exp2 <= Val2(30 downto 23);


        -- Sumar y restar el 127
        SumTemp <= resize(unsigned(Exp1), 9) + resize(unsigned(Exp2), 9) - to_unsigned(127, 9);

        -- Asignar resultado final (8 bits)
        ExpResult <= std_logic_vector(SumTemp(7 downto 0)+1) when ProdMant(47)='1' else std_logic_vector(SumTemp(7 downto 0));


    --Mantisa
        
        -- Agregar el 1 implícito en la mantisa 
        Mant1 <= '1' & Val1(22 downto 0);
        Mant2 <= '1' & Val2(22 downto 0);


        -- Multiplicación
        ProdMant <= unsigned(Mant1) * unsigned(Mant2);

        -- Normalización:
        -- Si el bit 47 es 1 → resultado mayor que 2 → shift y aumentar exponente.
        -- Si es 0 → ya está normalizado (valor entre 1.0 y 2.0)
        Carry <= ProdMant(47);  -- bit más significativo

        -- Tomar los bits normalizados: si hubo carry tomamos [46:24], si no, [45:23]
        -- Para simplificar, tomamos los bits correspondientes a ambas posibilidades:

        with ProdMant(47) select
            NormMant <= ProdMant(47 downto 24) when '1',  -- hubo carry, se recorta a la izquierda
                         ProdMant(46 downto 23) when others; -- no hubo carry

        -- Guardar los 23 bits de la mantisa final
        MantResult <= std_logic_vector(NormMant(22 downto 0));

        R7Mult <= SignMul & ExpResult & MantResult;

end bobostudio;