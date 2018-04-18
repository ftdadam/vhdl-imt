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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/orcad/Downloads/carrefour/carrefour.srcs/sources_1/new/deco.vhd";



static void work_a_3854470293_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    char *t9;
    int t10;
    char *t11;
    int t13;
    char *t14;
    int t16;
    char *t17;
    int t19;
    char *t20;
    int t22;
    char *t23;
    int t25;
    char *t26;
    int t28;
    char *t29;
    int t31;
    char *t32;
    int t34;
    char *t35;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;

LAB0:    xsi_set_current_line(22, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(37, ng0);
    t1 = (t0 + 5261);
    t5 = (t0 + 3152);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 8U);
    xsi_driver_first_trans_fast_port(t5);

LAB3:    t1 = (t0 + 3072);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(23, ng0);
    t1 = (t0 + 1192U);
    t5 = *((char **)t1);
    t1 = (t0 + 5133);
    t7 = xsi_mem_cmp(t1, t5, 4U);
    if (t7 == 1)
        goto LAB6;

LAB17:    t8 = (t0 + 5137);
    t10 = xsi_mem_cmp(t8, t5, 4U);
    if (t10 == 1)
        goto LAB7;

LAB18:    t11 = (t0 + 5141);
    t13 = xsi_mem_cmp(t11, t5, 4U);
    if (t13 == 1)
        goto LAB8;

LAB19:    t14 = (t0 + 5145);
    t16 = xsi_mem_cmp(t14, t5, 4U);
    if (t16 == 1)
        goto LAB9;

LAB20:    t17 = (t0 + 5149);
    t19 = xsi_mem_cmp(t17, t5, 4U);
    if (t19 == 1)
        goto LAB10;

LAB21:    t20 = (t0 + 5153);
    t22 = xsi_mem_cmp(t20, t5, 4U);
    if (t22 == 1)
        goto LAB11;

LAB22:    t23 = (t0 + 5157);
    t25 = xsi_mem_cmp(t23, t5, 4U);
    if (t25 == 1)
        goto LAB12;

LAB23:    t26 = (t0 + 5161);
    t28 = xsi_mem_cmp(t26, t5, 4U);
    if (t28 == 1)
        goto LAB13;

LAB24:    t29 = (t0 + 5165);
    t31 = xsi_mem_cmp(t29, t5, 4U);
    if (t31 == 1)
        goto LAB14;

LAB25:    t32 = (t0 + 5169);
    t34 = xsi_mem_cmp(t32, t5, 4U);
    if (t34 == 1)
        goto LAB15;

LAB26:
LAB16:    xsi_set_current_line(34, ng0);
    t1 = (t0 + 5253);
    t5 = (t0 + 3152);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 8U);
    xsi_driver_first_trans_fast_port(t5);

LAB5:    goto LAB3;

LAB6:    xsi_set_current_line(24, ng0);
    t35 = (t0 + 5173);
    t37 = (t0 + 3152);
    t38 = (t37 + 56U);
    t39 = *((char **)t38);
    t40 = (t39 + 56U);
    t41 = *((char **)t40);
    memcpy(t41, t35, 8U);
    xsi_driver_first_trans_fast_port(t37);
    goto LAB5;

LAB7:    xsi_set_current_line(25, ng0);
    t1 = (t0 + 5181);
    t5 = (t0 + 3152);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 8U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB5;

LAB8:    xsi_set_current_line(26, ng0);
    t1 = (t0 + 5189);
    t5 = (t0 + 3152);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 8U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB5;

LAB9:    xsi_set_current_line(27, ng0);
    t1 = (t0 + 5197);
    t5 = (t0 + 3152);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 8U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB5;

LAB10:    xsi_set_current_line(28, ng0);
    t1 = (t0 + 5205);
    t5 = (t0 + 3152);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 8U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB5;

LAB11:    xsi_set_current_line(29, ng0);
    t1 = (t0 + 5213);
    t5 = (t0 + 3152);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 8U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB5;

LAB12:    xsi_set_current_line(30, ng0);
    t1 = (t0 + 5221);
    t5 = (t0 + 3152);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 8U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB5;

LAB13:    xsi_set_current_line(31, ng0);
    t1 = (t0 + 5229);
    t5 = (t0 + 3152);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 8U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB5;

LAB14:    xsi_set_current_line(32, ng0);
    t1 = (t0 + 5237);
    t5 = (t0 + 3152);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 8U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB5;

LAB15:    xsi_set_current_line(33, ng0);
    t1 = (t0 + 5245);
    t5 = (t0 + 3152);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 8U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB5;

LAB27:;
}


extern void work_a_3854470293_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3854470293_3212880686_p_0};
	xsi_register_didat("work_a_3854470293_3212880686", "isim/tb_top_isim_beh.exe.sim/work/a_3854470293_3212880686.didat");
	xsi_register_executes(pe);
}
