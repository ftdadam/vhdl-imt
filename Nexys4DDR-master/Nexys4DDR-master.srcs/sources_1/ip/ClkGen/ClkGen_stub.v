// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.1 (win64) Build 1538259 Fri Apr  8 15:45:27 MDT 2016
// Date        : Thu Apr 19 10:16:50 2018
// Host        : DESKTOP-8T38IV2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/imt/vhdl-imt/Nexys4DDR-master/Nexys4DDR-master.srcs/sources_1/ip/ClkGen/ClkGen_stub.v
// Design      : ClkGen
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module ClkGen(clk_100MHz_i, clk_100MHz_o, clk_200MHz_o, reset_i, locked_o)
/* synthesis syn_black_box black_box_pad_pin="clk_100MHz_i,clk_100MHz_o,clk_200MHz_o,reset_i,locked_o" */;
  input clk_100MHz_i;
  output clk_100MHz_o;
  output clk_200MHz_o;
  input reset_i;
  output locked_o;
endmodule
