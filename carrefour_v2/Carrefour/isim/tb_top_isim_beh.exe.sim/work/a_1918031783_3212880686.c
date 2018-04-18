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
static const char *ng0 = "C:/Users/orcad/Downloads/carrefour/carrefour.srcs/sources_1/new/mux.vhd";



static void work_a_1918031783_3212880686_p_0(char *t0)
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
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    xsi_set_current_line(26, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(35, ng0);
    t1 = (t0 + 6205);
    t5 = (t0 + 3792);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 4U);
    xsi_driver_first_trans_fast_port(t5);

LAB3:    t1 = (t0 + 3712);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(27, ng0);
    t1 = (t0 + 1832U);
    t5 = *((char **)t1);
    t1 = (t0 + 6185);
    t7 = xsi_mem_cmp(t1, t5, 4U);
    if (t7 == 1)
        goto LAB6;

LAB11:    t8 = (t0 + 6189);
    t10 = xsi_mem_cmp(t8, t5, 4U);
    if (t10 == 1)
        goto LAB7;

LAB12:    t11 = (t0 + 6193);
    t13 = xsi_mem_cmp(t11, t5, 4U);
    if (t13 == 1)
        goto LAB8;

LAB13:    t14 = (t0 + 6197);
    t16 = xsi_mem_cmp(t14, t5, 4U);
    if (t16 == 1)
        goto LAB9;

LAB14:
LAB10:    xsi_set_current_line(32, ng0);
    t1 = (t0 + 6201);
    t5 = (t0 + 3792);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 4U);
    xsi_driver_first_trans_fast_port(t5);

LAB5:    goto LAB3;

LAB6:    xsi_set_current_line(28, ng0);
    t17 = (t0 + 1192U);
    t18 = *((char **)t17);
    t17 = (t0 + 3792);
    t19 = (t17 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t18, 4U);
    xsi_driver_first_trans_fast_port(t17);
    goto LAB5;

LAB7:    xsi_set_current_line(29, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 3792);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 4U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB5;

LAB8:    xsi_set_current_line(30, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 3792);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 4U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB5;

LAB9:    xsi_set_current_line(31, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 3792);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 4U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB5;

LAB15:;
}


extern void work_a_1918031783_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1918031783_3212880686_p_0};
	xsi_register_didat("work_a_1918031783_3212880686", "isim/tb_top_isim_beh.exe.sim/work/a_1918031783_3212880686.didat");
	xsi_register_executes(pe);
}
