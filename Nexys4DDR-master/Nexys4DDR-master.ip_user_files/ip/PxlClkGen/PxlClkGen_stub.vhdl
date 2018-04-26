-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.1 (win64) Build 1538259 Fri Apr  8 15:45:27 MDT 2016
-- Date        : Thu Apr 19 10:16:32 2018
-- Host        : DESKTOP-8T38IV2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/imt/vhdl-imt/Nexys4DDR-master/Nexys4DDR-master.srcs/sources_1/ip/PxlClkGen/PxlClkGen_stub.vhdl
-- Design      : PxlClkGen
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PxlClkGen is
  Port ( 
    CLK_IN1 : in STD_LOGIC;
    CLK_OUT1 : out STD_LOGIC;
    LOCKED : out STD_LOGIC
  );

end PxlClkGen;

architecture stub of PxlClkGen is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK_IN1,CLK_OUT1,LOCKED";
begin
end;
