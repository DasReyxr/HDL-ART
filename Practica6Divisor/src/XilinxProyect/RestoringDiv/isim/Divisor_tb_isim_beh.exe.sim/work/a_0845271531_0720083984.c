/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/ise/HDL-ART/Practica6Divisor/T_divisorwoarray.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_3488768497506413324_503743352(char *, unsigned char , unsigned char );


static void work_a_0845271531_0720083984_p_0(char *t0)
{
    char t11[16];
    char t13[16];
    char *t1;
    char *t3;
    char *t4;
    int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned char t9;
    char *t10;
    char *t12;
    char *t14;
    char *t15;
    int t16;
    unsigned int t17;
    unsigned char t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;

LAB0:    xsi_set_current_line(43, ng0);

LAB3:    t1 = (t0 + 22442);
    t3 = (t0 + 1032U);
    t4 = *((char **)t3);
    t5 = (7 - 7);
    t6 = (t5 * -1);
    t7 = (1U * t6);
    t8 = (0 + t7);
    t3 = (t4 + t8);
    t9 = *((unsigned char *)t3);
    t12 = ((IEEE_P_2592010699) + 4000);
    t14 = (t13 + 0U);
    t15 = (t14 + 0U);
    *((int *)t15) = 0;
    t15 = (t14 + 4U);
    *((int *)t15) = 6;
    t15 = (t14 + 8U);
    *((int *)t15) = 1;
    t16 = (6 - 0);
    t17 = (t16 * 1);
    t17 = (t17 + 1);
    t15 = (t14 + 12U);
    *((unsigned int *)t15) = t17;
    t10 = xsi_base_array_concat(t10, t11, t12, (char)97, t1, t13, (char)99, t9, (char)101);
    t17 = (7U + 1U);
    t18 = (8U != t17);
    if (t18 == 1)
        goto LAB5;

LAB6:    t15 = (t0 + 14408);
    t19 = (t15 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t10, 8U);
    xsi_driver_first_trans_fast(t15);

LAB2:    t23 = (t0 + 13912);
    *((int *)t23) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t17, 0);
    goto LAB6;

}

static void work_a_0845271531_0720083984_p_1(char *t0)
{
    char t14[16];
    char t16[16];
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned char t12;
    char *t13;
    char *t15;
    char *t17;
    char *t18;
    int t19;
    unsigned int t20;
    unsigned char t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;

LAB0:    xsi_set_current_line(44, ng0);

LAB3:    t1 = (t0 + 4712U);
    t2 = *((char **)t1);
    t3 = (7 - 6);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 1032U);
    t7 = *((char **)t6);
    t8 = (6 - 7);
    t9 = (t8 * -1);
    t10 = (1U * t9);
    t11 = (0 + t10);
    t6 = (t7 + t11);
    t12 = *((unsigned char *)t6);
    t15 = ((IEEE_P_2592010699) + 4000);
    t17 = (t16 + 0U);
    t18 = (t17 + 0U);
    *((int *)t18) = 6;
    t18 = (t17 + 4U);
    *((int *)t18) = 0;
    t18 = (t17 + 8U);
    *((int *)t18) = -1;
    t19 = (0 - 6);
    t20 = (t19 * -1);
    t20 = (t20 + 1);
    t18 = (t17 + 12U);
    *((unsigned int *)t18) = t20;
    t13 = xsi_base_array_concat(t13, t14, t15, (char)97, t1, t16, (char)99, t12, (char)101);
    t20 = (7U + 1U);
    t21 = (8U != t20);
    if (t21 == 1)
        goto LAB5;

LAB6:    t18 = (t0 + 14472);
    t22 = (t18 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t13, 8U);
    xsi_driver_first_trans_fast(t18);

LAB2:    t26 = (t0 + 13928);
    *((int *)t26) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t20, 0);
    goto LAB6;

}

static void work_a_0845271531_0720083984_p_2(char *t0)
{
    char t14[16];
    char t16[16];
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned char t12;
    char *t13;
    char *t15;
    char *t17;
    char *t18;
    int t19;
    unsigned int t20;
    unsigned char t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;

LAB0:    xsi_set_current_line(45, ng0);

LAB3:    t1 = (t0 + 4872U);
    t2 = *((char **)t1);
    t3 = (7 - 6);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 1032U);
    t7 = *((char **)t6);
    t8 = (5 - 7);
    t9 = (t8 * -1);
    t10 = (1U * t9);
    t11 = (0 + t10);
    t6 = (t7 + t11);
    t12 = *((unsigned char *)t6);
    t15 = ((IEEE_P_2592010699) + 4000);
    t17 = (t16 + 0U);
    t18 = (t17 + 0U);
    *((int *)t18) = 6;
    t18 = (t17 + 4U);
    *((int *)t18) = 0;
    t18 = (t17 + 8U);
    *((int *)t18) = -1;
    t19 = (0 - 6);
    t20 = (t19 * -1);
    t20 = (t20 + 1);
    t18 = (t17 + 12U);
    *((unsigned int *)t18) = t20;
    t13 = xsi_base_array_concat(t13, t14, t15, (char)97, t1, t16, (char)99, t12, (char)101);
    t20 = (7U + 1U);
    t21 = (8U != t20);
    if (t21 == 1)
        goto LAB5;

LAB6:    t18 = (t0 + 14536);
    t22 = (t18 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t13, 8U);
    xsi_driver_first_trans_fast(t18);

LAB2:    t26 = (t0 + 13944);
    *((int *)t26) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t20, 0);
    goto LAB6;

}

static void work_a_0845271531_0720083984_p_3(char *t0)
{
    char t14[16];
    char t16[16];
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned char t12;
    char *t13;
    char *t15;
    char *t17;
    char *t18;
    int t19;
    unsigned int t20;
    unsigned char t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;

LAB0:    xsi_set_current_line(46, ng0);

LAB3:    t1 = (t0 + 5032U);
    t2 = *((char **)t1);
    t3 = (7 - 6);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 1032U);
    t7 = *((char **)t6);
    t8 = (4 - 7);
    t9 = (t8 * -1);
    t10 = (1U * t9);
    t11 = (0 + t10);
    t6 = (t7 + t11);
    t12 = *((unsigned char *)t6);
    t15 = ((IEEE_P_2592010699) + 4000);
    t17 = (t16 + 0U);
    t18 = (t17 + 0U);
    *((int *)t18) = 6;
    t18 = (t17 + 4U);
    *((int *)t18) = 0;
    t18 = (t17 + 8U);
    *((int *)t18) = -1;
    t19 = (0 - 6);
    t20 = (t19 * -1);
    t20 = (t20 + 1);
    t18 = (t17 + 12U);
    *((unsigned int *)t18) = t20;
    t13 = xsi_base_array_concat(t13, t14, t15, (char)97, t1, t16, (char)99, t12, (char)101);
    t20 = (7U + 1U);
    t21 = (8U != t20);
    if (t21 == 1)
        goto LAB5;

LAB6:    t18 = (t0 + 14600);
    t22 = (t18 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t13, 8U);
    xsi_driver_first_trans_fast(t18);

LAB2:    t26 = (t0 + 13960);
    *((int *)t26) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t20, 0);
    goto LAB6;

}

static void work_a_0845271531_0720083984_p_4(char *t0)
{
    char t14[16];
    char t16[16];
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned char t12;
    char *t13;
    char *t15;
    char *t17;
    char *t18;
    int t19;
    unsigned int t20;
    unsigned char t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;

LAB0:    xsi_set_current_line(47, ng0);

LAB3:    t1 = (t0 + 5192U);
    t2 = *((char **)t1);
    t3 = (7 - 6);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 1032U);
    t7 = *((char **)t6);
    t8 = (3 - 7);
    t9 = (t8 * -1);
    t10 = (1U * t9);
    t11 = (0 + t10);
    t6 = (t7 + t11);
    t12 = *((unsigned char *)t6);
    t15 = ((IEEE_P_2592010699) + 4000);
    t17 = (t16 + 0U);
    t18 = (t17 + 0U);
    *((int *)t18) = 6;
    t18 = (t17 + 4U);
    *((int *)t18) = 0;
    t18 = (t17 + 8U);
    *((int *)t18) = -1;
    t19 = (0 - 6);
    t20 = (t19 * -1);
    t20 = (t20 + 1);
    t18 = (t17 + 12U);
    *((unsigned int *)t18) = t20;
    t13 = xsi_base_array_concat(t13, t14, t15, (char)97, t1, t16, (char)99, t12, (char)101);
    t20 = (7U + 1U);
    t21 = (8U != t20);
    if (t21 == 1)
        goto LAB5;

LAB6:    t18 = (t0 + 14664);
    t22 = (t18 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t13, 8U);
    xsi_driver_first_trans_fast(t18);

LAB2:    t26 = (t0 + 13976);
    *((int *)t26) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t20, 0);
    goto LAB6;

}

static void work_a_0845271531_0720083984_p_5(char *t0)
{
    char t14[16];
    char t16[16];
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned char t12;
    char *t13;
    char *t15;
    char *t17;
    char *t18;
    int t19;
    unsigned int t20;
    unsigned char t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;

LAB0:    xsi_set_current_line(48, ng0);

LAB3:    t1 = (t0 + 5352U);
    t2 = *((char **)t1);
    t3 = (7 - 6);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 1032U);
    t7 = *((char **)t6);
    t8 = (2 - 7);
    t9 = (t8 * -1);
    t10 = (1U * t9);
    t11 = (0 + t10);
    t6 = (t7 + t11);
    t12 = *((unsigned char *)t6);
    t15 = ((IEEE_P_2592010699) + 4000);
    t17 = (t16 + 0U);
    t18 = (t17 + 0U);
    *((int *)t18) = 6;
    t18 = (t17 + 4U);
    *((int *)t18) = 0;
    t18 = (t17 + 8U);
    *((int *)t18) = -1;
    t19 = (0 - 6);
    t20 = (t19 * -1);
    t20 = (t20 + 1);
    t18 = (t17 + 12U);
    *((unsigned int *)t18) = t20;
    t13 = xsi_base_array_concat(t13, t14, t15, (char)97, t1, t16, (char)99, t12, (char)101);
    t20 = (7U + 1U);
    t21 = (8U != t20);
    if (t21 == 1)
        goto LAB5;

LAB6:    t18 = (t0 + 14728);
    t22 = (t18 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t13, 8U);
    xsi_driver_first_trans_fast(t18);

LAB2:    t26 = (t0 + 13992);
    *((int *)t26) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t20, 0);
    goto LAB6;

}

static void work_a_0845271531_0720083984_p_6(char *t0)
{
    char t14[16];
    char t16[16];
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned char t12;
    char *t13;
    char *t15;
    char *t17;
    char *t18;
    int t19;
    unsigned int t20;
    unsigned char t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;

LAB0:    xsi_set_current_line(49, ng0);

LAB3:    t1 = (t0 + 5512U);
    t2 = *((char **)t1);
    t3 = (7 - 6);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 1032U);
    t7 = *((char **)t6);
    t8 = (1 - 7);
    t9 = (t8 * -1);
    t10 = (1U * t9);
    t11 = (0 + t10);
    t6 = (t7 + t11);
    t12 = *((unsigned char *)t6);
    t15 = ((IEEE_P_2592010699) + 4000);
    t17 = (t16 + 0U);
    t18 = (t17 + 0U);
    *((int *)t18) = 6;
    t18 = (t17 + 4U);
    *((int *)t18) = 0;
    t18 = (t17 + 8U);
    *((int *)t18) = -1;
    t19 = (0 - 6);
    t20 = (t19 * -1);
    t20 = (t20 + 1);
    t18 = (t17 + 12U);
    *((unsigned int *)t18) = t20;
    t13 = xsi_base_array_concat(t13, t14, t15, (char)97, t1, t16, (char)99, t12, (char)101);
    t20 = (7U + 1U);
    t21 = (8U != t20);
    if (t21 == 1)
        goto LAB5;

LAB6:    t18 = (t0 + 14792);
    t22 = (t18 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t13, 8U);
    xsi_driver_first_trans_fast(t18);

LAB2:    t26 = (t0 + 14008);
    *((int *)t26) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t20, 0);
    goto LAB6;

}

static void work_a_0845271531_0720083984_p_7(char *t0)
{
    char t14[16];
    char t16[16];
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned char t12;
    char *t13;
    char *t15;
    char *t17;
    char *t18;
    int t19;
    unsigned int t20;
    unsigned char t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;

LAB0:    xsi_set_current_line(50, ng0);

LAB3:    t1 = (t0 + 5672U);
    t2 = *((char **)t1);
    t3 = (7 - 6);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 1032U);
    t7 = *((char **)t6);
    t8 = (0 - 7);
    t9 = (t8 * -1);
    t10 = (1U * t9);
    t11 = (0 + t10);
    t6 = (t7 + t11);
    t12 = *((unsigned char *)t6);
    t15 = ((IEEE_P_2592010699) + 4000);
    t17 = (t16 + 0U);
    t18 = (t17 + 0U);
    *((int *)t18) = 6;
    t18 = (t17 + 4U);
    *((int *)t18) = 0;
    t18 = (t17 + 8U);
    *((int *)t18) = -1;
    t19 = (0 - 6);
    t20 = (t19 * -1);
    t20 = (t20 + 1);
    t18 = (t17 + 12U);
    *((unsigned int *)t18) = t20;
    t13 = xsi_base_array_concat(t13, t14, t15, (char)97, t1, t16, (char)99, t12, (char)101);
    t20 = (7U + 1U);
    t21 = (8U != t20);
    if (t21 == 1)
        goto LAB5;

LAB6:    t18 = (t0 + 14856);
    t22 = (t18 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t13, 8U);
    xsi_driver_first_trans_fast(t18);

LAB2:    t26 = (t0 + 14024);
    *((int *)t26) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t20, 0);
    goto LAB6;

}

static void work_a_0845271531_0720083984_p_8(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(64, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 2152U);
    t3 = *((char **)t1);
    t1 = ((IEEE_P_2592010699) + 4000);
    t4 = xsi_vhdl_lessthanEqual(t1, t2, 8U, t3, 8U);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t10 = (t0 + 14920);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)2;
    xsi_driver_first_trans_delta(t10, 7U, 1, 0LL);

LAB2:    t15 = (t0 + 14040);
    *((int *)t15) = 1;

LAB1:    return;
LAB3:    t5 = (t0 + 14920);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_delta(t5, 7U, 1, 0LL);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_0845271531_0720083984_p_9(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(65, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 2312U);
    t3 = *((char **)t1);
    t1 = ((IEEE_P_2592010699) + 4000);
    t4 = xsi_vhdl_lessthanEqual(t1, t2, 8U, t3, 8U);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t10 = (t0 + 14984);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)2;
    xsi_driver_first_trans_delta(t10, 6U, 1, 0LL);

LAB2:    t15 = (t0 + 14056);
    *((int *)t15) = 1;

LAB1:    return;
LAB3:    t5 = (t0 + 14984);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_delta(t5, 6U, 1, 0LL);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_0845271531_0720083984_p_10(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 2472U);
    t3 = *((char **)t1);
    t1 = ((IEEE_P_2592010699) + 4000);
    t4 = xsi_vhdl_lessthanEqual(t1, t2, 8U, t3, 8U);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t10 = (t0 + 15048);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)2;
    xsi_driver_first_trans_delta(t10, 5U, 1, 0LL);

LAB2:    t15 = (t0 + 14072);
    *((int *)t15) = 1;

LAB1:    return;
LAB3:    t5 = (t0 + 15048);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_delta(t5, 5U, 1, 0LL);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_0845271531_0720083984_p_11(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(67, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 2632U);
    t3 = *((char **)t1);
    t1 = ((IEEE_P_2592010699) + 4000);
    t4 = xsi_vhdl_lessthanEqual(t1, t2, 8U, t3, 8U);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t10 = (t0 + 15112);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)2;
    xsi_driver_first_trans_delta(t10, 4U, 1, 0LL);

LAB2:    t15 = (t0 + 14088);
    *((int *)t15) = 1;

LAB1:    return;
LAB3:    t5 = (t0 + 15112);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_delta(t5, 4U, 1, 0LL);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_0845271531_0720083984_p_12(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(68, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 2792U);
    t3 = *((char **)t1);
    t1 = ((IEEE_P_2592010699) + 4000);
    t4 = xsi_vhdl_lessthanEqual(t1, t2, 8U, t3, 8U);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t10 = (t0 + 15176);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)2;
    xsi_driver_first_trans_delta(t10, 3U, 1, 0LL);

LAB2:    t15 = (t0 + 14104);
    *((int *)t15) = 1;

LAB1:    return;
LAB3:    t5 = (t0 + 15176);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_delta(t5, 3U, 1, 0LL);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_0845271531_0720083984_p_13(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(69, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 2952U);
    t3 = *((char **)t1);
    t1 = ((IEEE_P_2592010699) + 4000);
    t4 = xsi_vhdl_lessthanEqual(t1, t2, 8U, t3, 8U);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t10 = (t0 + 15240);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)2;
    xsi_driver_first_trans_delta(t10, 2U, 1, 0LL);

LAB2:    t15 = (t0 + 14120);
    *((int *)t15) = 1;

LAB1:    return;
LAB3:    t5 = (t0 + 15240);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_delta(t5, 2U, 1, 0LL);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_0845271531_0720083984_p_14(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(70, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 3112U);
    t3 = *((char **)t1);
    t1 = ((IEEE_P_2592010699) + 4000);
    t4 = xsi_vhdl_lessthanEqual(t1, t2, 8U, t3, 8U);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t10 = (t0 + 15304);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)2;
    xsi_driver_first_trans_delta(t10, 1U, 1, 0LL);

LAB2:    t15 = (t0 + 14136);
    *((int *)t15) = 1;

LAB1:    return;
LAB3:    t5 = (t0 + 15304);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_delta(t5, 1U, 1, 0LL);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_0845271531_0720083984_p_15(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(71, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 3272U);
    t3 = *((char **)t1);
    t1 = ((IEEE_P_2592010699) + 4000);
    t4 = xsi_vhdl_lessthanEqual(t1, t2, 8U, t3, 8U);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t10 = (t0 + 15368);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)2;
    xsi_driver_first_trans_delta(t10, 0U, 1, 0LL);

LAB2:    t15 = (t0 + 14152);
    *((int *)t15) = 1;

LAB1:    return;
LAB3:    t5 = (t0 + 15368);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_delta(t5, 0U, 1, 0LL);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_0845271531_0720083984_p_16(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    static char *nl0[] = {&&LAB6, &&LAB6, &&LAB6, &&LAB5, &&LAB6, &&LAB6, &&LAB6, &&LAB6, &&LAB6};

LAB0:    t1 = (t0 + 11112U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(74, ng0);
    t2 = (t0 + 5992U);
    t3 = *((char **)t2);
    t4 = (0 - 7);
    t5 = (t4 * -1);
    t6 = (1U * t5);
    t7 = (0 + t6);
    t2 = (t3 + t7);
    t8 = *((unsigned char *)t2);
    t9 = (char *)((nl0) + t8);
    goto **((char **)t9);

LAB4:    xsi_set_current_line(74, ng0);

LAB9:    t2 = (t0 + 14168);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB10;

LAB1:    return;
LAB5:    xsi_set_current_line(75, ng0);
    t10 = (t0 + 3432U);
    t11 = *((char **)t10);
    t10 = (t0 + 15432);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t11, 8U);
    xsi_driver_first_trans_fast(t10);
    goto LAB4;

LAB6:    xsi_set_current_line(75, ng0);
    t2 = (t0 + 2152U);
    t3 = *((char **)t2);
    t2 = (t0 + 15432);
    t9 = (t2 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 8U);
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB7:    t3 = (t0 + 14168);
    *((int *)t3) = 0;
    goto LAB2;

LAB8:    goto LAB7;

LAB10:    goto LAB8;

}

static void work_a_0845271531_0720083984_p_17(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    static char *nl0[] = {&&LAB6, &&LAB6, &&LAB6, &&LAB5, &&LAB6, &&LAB6, &&LAB6, &&LAB6, &&LAB6};

LAB0:    t1 = (t0 + 11360U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(78, ng0);
    t2 = (t0 + 5992U);
    t3 = *((char **)t2);
    t4 = (1 - 7);
    t5 = (t4 * -1);
    t6 = (1U * t5);
    t7 = (0 + t6);
    t2 = (t3 + t7);
    t8 = *((unsigned char *)t2);
    t9 = (char *)((nl0) + t8);
    goto **((char **)t9);

LAB4:    xsi_set_current_line(78, ng0);

LAB9:    t2 = (t0 + 14184);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB10;

LAB1:    return;
LAB5:    xsi_set_current_line(79, ng0);
    t10 = (t0 + 3592U);
    t11 = *((char **)t10);
    t10 = (t0 + 15496);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t11, 8U);
    xsi_driver_first_trans_fast(t10);
    goto LAB4;

LAB6:    xsi_set_current_line(79, ng0);
    t2 = (t0 + 2312U);
    t3 = *((char **)t2);
    t2 = (t0 + 15496);
    t9 = (t2 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 8U);
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB7:    t3 = (t0 + 14184);
    *((int *)t3) = 0;
    goto LAB2;

LAB8:    goto LAB7;

LAB10:    goto LAB8;

}

static void work_a_0845271531_0720083984_p_18(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    static char *nl0[] = {&&LAB6, &&LAB6, &&LAB6, &&LAB5, &&LAB6, &&LAB6, &&LAB6, &&LAB6, &&LAB6};

LAB0:    t1 = (t0 + 11608U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(82, ng0);
    t2 = (t0 + 5992U);
    t3 = *((char **)t2);
    t4 = (2 - 7);
    t5 = (t4 * -1);
    t6 = (1U * t5);
    t7 = (0 + t6);
    t2 = (t3 + t7);
    t8 = *((unsigned char *)t2);
    t9 = (char *)((nl0) + t8);
    goto **((char **)t9);

LAB4:    xsi_set_current_line(82, ng0);

LAB9:    t2 = (t0 + 14200);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB10;

LAB1:    return;
LAB5:    xsi_set_current_line(83, ng0);
    t10 = (t0 + 3752U);
    t11 = *((char **)t10);
    t10 = (t0 + 15560);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t11, 8U);
    xsi_driver_first_trans_fast(t10);
    goto LAB4;

LAB6:    xsi_set_current_line(83, ng0);
    t2 = (t0 + 2472U);
    t3 = *((char **)t2);
    t2 = (t0 + 15560);
    t9 = (t2 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 8U);
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB7:    t3 = (t0 + 14200);
    *((int *)t3) = 0;
    goto LAB2;

LAB8:    goto LAB7;

LAB10:    goto LAB8;

}

static void work_a_0845271531_0720083984_p_19(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    static char *nl0[] = {&&LAB6, &&LAB6, &&LAB6, &&LAB5, &&LAB6, &&LAB6, &&LAB6, &&LAB6, &&LAB6};

LAB0:    t1 = (t0 + 11856U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(86, ng0);
    t2 = (t0 + 5992U);
    t3 = *((char **)t2);
    t4 = (3 - 7);
    t5 = (t4 * -1);
    t6 = (1U * t5);
    t7 = (0 + t6);
    t2 = (t3 + t7);
    t8 = *((unsigned char *)t2);
    t9 = (char *)((nl0) + t8);
    goto **((char **)t9);

LAB4:    xsi_set_current_line(86, ng0);

LAB9:    t2 = (t0 + 14216);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB10;

LAB1:    return;
LAB5:    xsi_set_current_line(87, ng0);
    t10 = (t0 + 3912U);
    t11 = *((char **)t10);
    t10 = (t0 + 15624);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t11, 8U);
    xsi_driver_first_trans_fast(t10);
    goto LAB4;

LAB6:    xsi_set_current_line(87, ng0);
    t2 = (t0 + 2632U);
    t3 = *((char **)t2);
    t2 = (t0 + 15624);
    t9 = (t2 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 8U);
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB7:    t3 = (t0 + 14216);
    *((int *)t3) = 0;
    goto LAB2;

LAB8:    goto LAB7;

LAB10:    goto LAB8;

}

static void work_a_0845271531_0720083984_p_20(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    static char *nl0[] = {&&LAB6, &&LAB6, &&LAB6, &&LAB5, &&LAB6, &&LAB6, &&LAB6, &&LAB6, &&LAB6};

LAB0:    t1 = (t0 + 12104U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(90, ng0);
    t2 = (t0 + 5992U);
    t3 = *((char **)t2);
    t4 = (4 - 7);
    t5 = (t4 * -1);
    t6 = (1U * t5);
    t7 = (0 + t6);
    t2 = (t3 + t7);
    t8 = *((unsigned char *)t2);
    t9 = (char *)((nl0) + t8);
    goto **((char **)t9);

LAB4:    xsi_set_current_line(90, ng0);

LAB9:    t2 = (t0 + 14232);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB10;

LAB1:    return;
LAB5:    xsi_set_current_line(91, ng0);
    t10 = (t0 + 4072U);
    t11 = *((char **)t10);
    t10 = (t0 + 15688);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t11, 8U);
    xsi_driver_first_trans_fast(t10);
    goto LAB4;

LAB6:    xsi_set_current_line(91, ng0);
    t2 = (t0 + 2792U);
    t3 = *((char **)t2);
    t2 = (t0 + 15688);
    t9 = (t2 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 8U);
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB7:    t3 = (t0 + 14232);
    *((int *)t3) = 0;
    goto LAB2;

LAB8:    goto LAB7;

LAB10:    goto LAB8;

}

static void work_a_0845271531_0720083984_p_21(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    static char *nl0[] = {&&LAB6, &&LAB6, &&LAB6, &&LAB5, &&LAB6, &&LAB6, &&LAB6, &&LAB6, &&LAB6};

LAB0:    t1 = (t0 + 12352U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(94, ng0);
    t2 = (t0 + 5992U);
    t3 = *((char **)t2);
    t4 = (5 - 7);
    t5 = (t4 * -1);
    t6 = (1U * t5);
    t7 = (0 + t6);
    t2 = (t3 + t7);
    t8 = *((unsigned char *)t2);
    t9 = (char *)((nl0) + t8);
    goto **((char **)t9);

LAB4:    xsi_set_current_line(94, ng0);

LAB9:    t2 = (t0 + 14248);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB10;

LAB1:    return;
LAB5:    xsi_set_current_line(95, ng0);
    t10 = (t0 + 4232U);
    t11 = *((char **)t10);
    t10 = (t0 + 15752);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t11, 8U);
    xsi_driver_first_trans_fast(t10);
    goto LAB4;

LAB6:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 15752);
    t9 = (t2 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 8U);
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB7:    t3 = (t0 + 14248);
    *((int *)t3) = 0;
    goto LAB2;

LAB8:    goto LAB7;

LAB10:    goto LAB8;

}

static void work_a_0845271531_0720083984_p_22(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    static char *nl0[] = {&&LAB6, &&LAB6, &&LAB6, &&LAB5, &&LAB6, &&LAB6, &&LAB6, &&LAB6, &&LAB6};

LAB0:    t1 = (t0 + 12600U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(98, ng0);
    t2 = (t0 + 5992U);
    t3 = *((char **)t2);
    t4 = (6 - 7);
    t5 = (t4 * -1);
    t6 = (1U * t5);
    t7 = (0 + t6);
    t2 = (t3 + t7);
    t8 = *((unsigned char *)t2);
    t9 = (char *)((nl0) + t8);
    goto **((char **)t9);

LAB4:    xsi_set_current_line(98, ng0);

LAB9:    t2 = (t0 + 14264);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB10;

LAB1:    return;
LAB5:    xsi_set_current_line(99, ng0);
    t10 = (t0 + 4392U);
    t11 = *((char **)t10);
    t10 = (t0 + 15816);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t11, 8U);
    xsi_driver_first_trans_fast(t10);
    goto LAB4;

LAB6:    xsi_set_current_line(99, ng0);
    t2 = (t0 + 3112U);
    t3 = *((char **)t2);
    t2 = (t0 + 15816);
    t9 = (t2 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 8U);
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB7:    t3 = (t0 + 14264);
    *((int *)t3) = 0;
    goto LAB2;

LAB8:    goto LAB7;

LAB10:    goto LAB8;

}

static void work_a_0845271531_0720083984_p_23(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    static char *nl0[] = {&&LAB6, &&LAB6, &&LAB6, &&LAB5, &&LAB6, &&LAB6, &&LAB6, &&LAB6, &&LAB6};

LAB0:    t1 = (t0 + 12848U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(102, ng0);
    t2 = (t0 + 5992U);
    t3 = *((char **)t2);
    t4 = (7 - 7);
    t5 = (t4 * -1);
    t6 = (1U * t5);
    t7 = (0 + t6);
    t2 = (t3 + t7);
    t8 = *((unsigned char *)t2);
    t9 = (char *)((nl0) + t8);
    goto **((char **)t9);

LAB4:    xsi_set_current_line(102, ng0);

LAB9:    t2 = (t0 + 14280);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB10;

LAB1:    return;
LAB5:    xsi_set_current_line(103, ng0);
    t10 = (t0 + 4552U);
    t11 = *((char **)t10);
    t10 = (t0 + 15880);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t11, 8U);
    xsi_driver_first_trans_fast(t10);
    goto LAB4;

LAB6:    xsi_set_current_line(103, ng0);
    t2 = (t0 + 3272U);
    t3 = *((char **)t2);
    t2 = (t0 + 15880);
    t9 = (t2 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 8U);
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB7:    t3 = (t0 + 14280);
    *((int *)t3) = 0;
    goto LAB2;

LAB8:    goto LAB7;

LAB10:    goto LAB8;

}

static void work_a_0845271531_0720083984_p_24(char *t0)
{
    char t16[16];
    char t26[16];
    char t36[16];
    char t46[16];
    char t56[16];
    char t66[16];
    char t76[16];
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    char *t8;
    char *t9;
    int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned char t14;
    char *t15;
    char *t17;
    char *t18;
    char *t19;
    int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned char t24;
    char *t25;
    char *t27;
    char *t28;
    char *t29;
    int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned char t34;
    char *t35;
    char *t37;
    char *t38;
    char *t39;
    int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned char t44;
    char *t45;
    char *t47;
    char *t48;
    char *t49;
    int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned char t54;
    char *t55;
    char *t57;
    char *t58;
    char *t59;
    int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned char t64;
    char *t65;
    char *t67;
    char *t68;
    char *t69;
    int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned char t74;
    char *t75;
    char *t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned char t85;
    char *t86;
    char *t87;
    char *t88;
    char *t89;
    char *t90;
    char *t91;

LAB0:    xsi_set_current_line(108, ng0);

LAB3:    t1 = (t0 + 5992U);
    t2 = *((char **)t1);
    t3 = (0 - 7);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t0 + 5992U);
    t9 = *((char **)t8);
    t10 = (1 - 7);
    t11 = (t10 * -1);
    t12 = (1U * t11);
    t13 = (0 + t12);
    t8 = (t9 + t13);
    t14 = *((unsigned char *)t8);
    t17 = ((IEEE_P_2592010699) + 4000);
    t15 = xsi_base_array_concat(t15, t16, t17, (char)99, t7, (char)99, t14, (char)101);
    t18 = (t0 + 5992U);
    t19 = *((char **)t18);
    t20 = (2 - 7);
    t21 = (t20 * -1);
    t22 = (1U * t21);
    t23 = (0 + t22);
    t18 = (t19 + t23);
    t24 = *((unsigned char *)t18);
    t27 = ((IEEE_P_2592010699) + 4000);
    t25 = xsi_base_array_concat(t25, t26, t27, (char)97, t15, t16, (char)99, t24, (char)101);
    t28 = (t0 + 5992U);
    t29 = *((char **)t28);
    t30 = (3 - 7);
    t31 = (t30 * -1);
    t32 = (1U * t31);
    t33 = (0 + t32);
    t28 = (t29 + t33);
    t34 = *((unsigned char *)t28);
    t37 = ((IEEE_P_2592010699) + 4000);
    t35 = xsi_base_array_concat(t35, t36, t37, (char)97, t25, t26, (char)99, t34, (char)101);
    t38 = (t0 + 5992U);
    t39 = *((char **)t38);
    t40 = (4 - 7);
    t41 = (t40 * -1);
    t42 = (1U * t41);
    t43 = (0 + t42);
    t38 = (t39 + t43);
    t44 = *((unsigned char *)t38);
    t47 = ((IEEE_P_2592010699) + 4000);
    t45 = xsi_base_array_concat(t45, t46, t47, (char)97, t35, t36, (char)99, t44, (char)101);
    t48 = (t0 + 5992U);
    t49 = *((char **)t48);
    t50 = (5 - 7);
    t51 = (t50 * -1);
    t52 = (1U * t51);
    t53 = (0 + t52);
    t48 = (t49 + t53);
    t54 = *((unsigned char *)t48);
    t57 = ((IEEE_P_2592010699) + 4000);
    t55 = xsi_base_array_concat(t55, t56, t57, (char)97, t45, t46, (char)99, t54, (char)101);
    t58 = (t0 + 5992U);
    t59 = *((char **)t58);
    t60 = (6 - 7);
    t61 = (t60 * -1);
    t62 = (1U * t61);
    t63 = (0 + t62);
    t58 = (t59 + t63);
    t64 = *((unsigned char *)t58);
    t67 = ((IEEE_P_2592010699) + 4000);
    t65 = xsi_base_array_concat(t65, t66, t67, (char)97, t55, t56, (char)99, t64, (char)101);
    t68 = (t0 + 5992U);
    t69 = *((char **)t68);
    t70 = (7 - 7);
    t71 = (t70 * -1);
    t72 = (1U * t71);
    t73 = (0 + t72);
    t68 = (t69 + t73);
    t74 = *((unsigned char *)t68);
    t77 = ((IEEE_P_2592010699) + 4000);
    t75 = xsi_base_array_concat(t75, t76, t77, (char)97, t65, t66, (char)99, t74, (char)101);
    t78 = (1U + 1U);
    t79 = (t78 + 1U);
    t80 = (t79 + 1U);
    t81 = (t80 + 1U);
    t82 = (t81 + 1U);
    t83 = (t82 + 1U);
    t84 = (t83 + 1U);
    t85 = (8U != t84);
    if (t85 == 1)
        goto LAB5;

LAB6:    t86 = (t0 + 15944);
    t87 = (t86 + 56U);
    t88 = *((char **)t87);
    t89 = (t88 + 56U);
    t90 = *((char **)t89);
    memcpy(t90, t75, 8U);
    xsi_driver_first_trans_fast_port(t86);

LAB2:    t91 = (t0 + 14296);
    *((int *)t91) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t84, 0);
    goto LAB6;

}

static void work_a_0845271531_0720083984_p_25(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(109, ng0);

LAB3:    t1 = (t0 + 5832U);
    t2 = *((char **)t1);
    t1 = (t0 + 16008);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 14312);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0845271531_0720083984_p_26(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(110, ng0);

LAB3:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 1512U);
    t4 = *((char **)t1);
    t5 = *((unsigned char *)t4);
    t6 = ieee_p_2592010699_sub_3488768497506413324_503743352(IEEE_P_2592010699, t3, t5);
    t1 = (t0 + 16072);
    t7 = (t1 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = t6;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t11 = (t0 + 14328);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_0845271531_0720083984_init()
{
	static char *pe[] = {(void *)work_a_0845271531_0720083984_p_0,(void *)work_a_0845271531_0720083984_p_1,(void *)work_a_0845271531_0720083984_p_2,(void *)work_a_0845271531_0720083984_p_3,(void *)work_a_0845271531_0720083984_p_4,(void *)work_a_0845271531_0720083984_p_5,(void *)work_a_0845271531_0720083984_p_6,(void *)work_a_0845271531_0720083984_p_7,(void *)work_a_0845271531_0720083984_p_8,(void *)work_a_0845271531_0720083984_p_9,(void *)work_a_0845271531_0720083984_p_10,(void *)work_a_0845271531_0720083984_p_11,(void *)work_a_0845271531_0720083984_p_12,(void *)work_a_0845271531_0720083984_p_13,(void *)work_a_0845271531_0720083984_p_14,(void *)work_a_0845271531_0720083984_p_15,(void *)work_a_0845271531_0720083984_p_16,(void *)work_a_0845271531_0720083984_p_17,(void *)work_a_0845271531_0720083984_p_18,(void *)work_a_0845271531_0720083984_p_19,(void *)work_a_0845271531_0720083984_p_20,(void *)work_a_0845271531_0720083984_p_21,(void *)work_a_0845271531_0720083984_p_22,(void *)work_a_0845271531_0720083984_p_23,(void *)work_a_0845271531_0720083984_p_24,(void *)work_a_0845271531_0720083984_p_25,(void *)work_a_0845271531_0720083984_p_26};
	xsi_register_didat("work_a_0845271531_0720083984", "isim/Divisor_tb_isim_beh.exe.sim/work/a_0845271531_0720083984.didat");
	xsi_register_executes(pe);
}
