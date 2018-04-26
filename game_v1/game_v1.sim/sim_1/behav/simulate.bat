@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.1\\bin
call %xv_path%/xsim tb_game_controller_behav -key {Behavioral:sim_1:Functional:tb_game_controller} -tclbatch tb_game_controller.tcl -view D:/imt/vhdl-imt/game_v1/tb_game_controller_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0