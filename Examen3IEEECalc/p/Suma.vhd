library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Sumador is
    port (
        Val1, Val2 : in  std_logic_vector(31 downto 0);
        R7Sum      : out std_logic_vector(31 downto 0)
    );
end Sumador;

architecture bobostudio of Sumador is

    signal sign1, sign2     : std_logic;
    signal signR            : std_logic;
    signal exp1, exp2       : unsigned(7 downto 0);
    signal mant1, mant2     : unsigned(23 downto 0);
    signal mant1_shifted, mant2_shifted : unsigned(23 downto 0);
    signal exp_diff         : integer range -32 to 32;
    signal expR             : unsigned(7 downto 0);
    signal mant_sum_signed  : signed(24 downto 0);
    signal mant_sum_abs     : unsigned(24 downto 0);

    signal shift_count : integer range 0 to 25;
    signal mant_norm   : unsigned(23 downto 0);
    signal exp_norm    : unsigned(7 downto 0);

begin

    sign1 <= Val1(31);
    sign2 <= Val2(31);

    exp1 <= unsigned(Val1(30 downto 23));
    exp2 <= unsigned(Val2(30 downto 23));

    mant1 <= unsigned('1' & Val1(22 downto 0));
    mant2 <= unsigned('1' & Val2(22 downto 0));

    exp_diff <= to_integer(exp1) - to_integer(exp2);

    mant1_shifted <= (mant1)       when exp_diff >= 0 else shift_right(mant1, -exp_diff);
    mant2_shifted <= (mant2)       when exp_diff < 0 else shift_right(mant2, exp_diff);
    expR          <= exp1        when exp_diff >= 0 else exp2;

    mant_sum_signed <=
        signed('0' & mant1_shifted) + signed('0' & mant2_shifted) when sign1 = sign2 else
        signed('0' & mant1_shifted) - signed('0' & mant2_shifted);
-- 5 - 3 
    signR <= sign1 when mant1_shifted >= mant2_shifted else sign2;

    mant_sum_abs <= unsigned(mant_sum_signed) when mant1_shifted >= mant2_shifted else unsigned(-mant_sum_signed);
    --mant_sum_abs <= unsigned(mant_sum_signed);
    shift_count <=
        0  when mant_sum_abs(23) = '1' else
        1  when mant_sum_abs(22) = '1' else
        2  when mant_sum_abs(21) = '1' else
        3  when mant_sum_abs(20) = '1' else
        4  when mant_sum_abs(19) = '1' else
        5  when mant_sum_abs(18) = '1' else
        6  when mant_sum_abs(17) = '1' else
        7  when mant_sum_abs(16) = '1' else
        8  when mant_sum_abs(15) = '1' else
        9  when mant_sum_abs(14) = '1' else
        10 when mant_sum_abs(13) = '1' else
        11 when mant_sum_abs(12) = '1' else
        12 when mant_sum_abs(11) = '1' else
        13 when mant_sum_abs(10) = '1' else
        14 when mant_sum_abs(9) = '1' else
        15 when mant_sum_abs(8)  = '1' else
        16 when mant_sum_abs(7)  = '1' else
        17 when mant_sum_abs(6)  = '1' else
        18 when mant_sum_abs(5)  = '1' else
        19 when mant_sum_abs(4)  = '1' else
        20 when mant_sum_abs(3)  = '1' else
        21 when mant_sum_abs(2)  = '1' else
        22 when mant_sum_abs(1)  = '1' else
        23 when mant_sum_abs(0)  = '1' else
        24;

    mant_norm <=
        mant_sum_abs(24 downto 1) when mant_sum_abs(24) = '1' else
        mant_sum_abs(23 downto 0) sll shift_count;

    exp_norm <=
        expR + 1 when mant_sum_abs(24) = '1' else
        expR - to_unsigned(shift_count, 8);

    R7Sum <= signR & std_logic_vector(exp_norm) & std_logic_vector(mant_norm(22 downto 0));

end bobostudio;
