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
static const char *ng0 = "C:/Users/orcad/Downloads/carrefour/carrefour.srcs/sim_1/new/tb_top.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );


static void work_a_3622719947_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    int64 t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;

LAB0:    xsi_set_current_line(44, ng0);

LAB3:    t1 = (t0 + 3048U);
    t2 = *((char **)t1);
    t3 = *((int64 *)t2);
    t1 = (t0 + 1032U);
    t4 = *((char **)t1);
    t5 = *((unsigned char *)t4);
    t6 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t5);
    t1 = (t0 + 4928);
    t7 = (t1 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = t6;
    xsi_driver_first_trans_delta(t1, 0U, 1, t3);
    t11 = (t0 + 4928);
    xsi_driver_intertial_reject(t11, t3, t3);

LAB2:    t12 = (t0 + 4848);
    *((int *)t12) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3622719947_3212880686_p_1(char *t0)
{
    int64 t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(45, ng0);

LAB3:    t1 = (100 * 1000LL);
    t2 = (t0 + 4992);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_delta(t2, 0U, 1, t1);
    t7 = (t0 + 4992);
    xsi_driver_intertial_reject(t7, t1, t1);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3622719947_3212880686_p_2(char *t0)
{
    int64 t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;

LAB0:    xsi_set_current_line(46, ng0);

LAB3:    t1 = (200 * 1000LL);
    t2 = (t0 + 5056);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_delta(t2, 0U, 1, t1);
    t7 = (600 * 1000LL);
    t8 = (t0 + 5056);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_subsequent_trans_delta(t8, 0U, 1, t7);
    t13 = (t0 + 5056);
    xsi_driver_intertial_reject(t13, t1, t1);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3622719947_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3622719947_3212880686_p_0,(void *)work_a_3622719947_3212880686_p_1,(void *)work_a_3622719947_3212880686_p_2};
	xsi_register_didat("work_a_3622719947_3212880686", "isim/tb_top_isim_beh.exe.sim/work/a_3622719947_3212880686.didat");
	xsi_register_executes(pe);
}
