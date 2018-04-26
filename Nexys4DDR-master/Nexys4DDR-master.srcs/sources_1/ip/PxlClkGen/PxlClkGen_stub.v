// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.1 (win64) Build 1538259 Fri Apr  8 15:45:27 MDT 2016
// Date        : Thu Apr 19 10:16:32 2018
// Host        : DESKTOP-8T38IV2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/imt/vhdl-imt/Nexys4DDR-master/Nexys4DDR-master.srcs/sources_1/ip/PxlClkGen/PxlClkGen_stub.v
// Design      : PxlClkGen
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module PxlClkGen(CLK_IN1, CLK_OUT1, LOCKED)
/* synthesis syn_black_box black_box_pad_pin="CLK_IN1,CLK_OUT1,LOCKED" */;
  input CLK_IN1;
  output CLK_OUT1;
  output LOCKED;
endmodule
