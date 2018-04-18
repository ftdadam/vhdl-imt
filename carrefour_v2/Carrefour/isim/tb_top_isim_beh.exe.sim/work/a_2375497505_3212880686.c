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
static const char *ng0 = "C:/Users/orcad/Downloads/carrefour/carrefour.srcs/sources_1/new/counter_1s.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

unsigned char ieee_p_1242562249_sub_1781471956_1035706684(char *, char *, char *, int );
unsigned char ieee_p_1242562249_sub_1781507893_1035706684(char *, char *, char *, int );
char *ieee_p_1242562249_sub_1919365254_1035706684(char *, char *, char *, char *, int );
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_2375497505_3212880686_p_0(char *t0)
{
    char t13[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    unsigned int t14;
    unsigned int t15;
    unsigned char t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;

LAB0:    xsi_set_current_line(24, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1312U);
    t3 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 3640);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(25, ng0);
    t1 = xsi_get_transient_memory(5U);
    memset(t1, 0, 5U);
    t5 = t1;
    memset(t5, (unsigned char)2, 5U);
    t6 = (t0 + 3736);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 5U);
    xsi_driver_first_trans_fast(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(27, ng0);
    t2 = (t0 + 1032U);
    t5 = *((char **)t2);
    t4 = *((unsigned char *)t5);
    t11 = (t4 == (unsigned char)3);
    if (t11 != 0)
        goto LAB7;

LAB9:    xsi_set_current_line(34, ng0);
    t1 = xsi_get_transient_memory(5U);
    memset(t1, 0, 5U);
    t2 = t1;
    memset(t2, (unsigned char)2, 5U);
    t5 = (t0 + 3736);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 5U);
    xsi_driver_first_trans_fast(t5);

LAB8:    goto LAB3;

LAB7:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 1672U);
    t6 = *((char **)t2);
    t2 = (t0 + 6024U);
    t12 = ieee_p_1242562249_sub_1781471956_1035706684(IEEE_P_1242562249, t6, t2, 20);
    if (t12 != 0)
        goto LAB10;

LAB12:    xsi_set_current_line(31, ng0);
    t1 = xsi_get_transient_memory(5U);
    memset(t1, 0, 5U);
    t2 = t1;
    memset(t2, (unsigned char)2, 5U);
    t5 = (t0 + 3736);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 5U);
    xsi_driver_first_trans_fast(t5);

LAB11:    goto LAB8;

LAB10:    xsi_set_current_line(29, ng0);
    t7 = (t0 + 1672U);
    t8 = *((char **)t7);
    t7 = (t0 + 6024U);
    t9 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t13, t8, t7, 1);
    t10 = (t13 + 12U);
    t14 = *((unsigned int *)t10);
    t15 = (1U * t14);
    t16 = (5U != t15);
    if (t16 == 1)
        goto LAB13;

LAB14:    t17 = (t0 + 3736);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t9, 5U);
    xsi_driver_first_trans_fast(t17);
    goto LAB11;

LAB13:    xsi_size_not_matching(5U, t15, 0);
    goto LAB14;

}

static void work_a_2375497505_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
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

LAB0:    xsi_set_current_line(39, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 6024U);
    t3 = ieee_p_1242562249_sub_1781507893_1035706684(IEEE_P_1242562249, t2, t1, 20);
    if (t3 != 0)
        goto LAB3;

LAB4:
LAB5:    t9 = (t0 + 3800);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t9);

LAB2:    t14 = (t0 + 3656);
    *((int *)t14) = 1;

LAB1:    return;
LAB3:    t4 = (t0 + 3800);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t4);
    goto LAB2;

LAB6:    goto LAB2;

}


extern void work_a_2375497505_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2375497505_3212880686_p_0,(void *)work_a_2375497505_3212880686_p_1};
	xsi_register_didat("work_a_2375497505_3212880686", "isim/tb_top_isim_beh.exe.sim/work/a_2375497505_3212880686.didat");
	xsi_register_executes(pe);
}
