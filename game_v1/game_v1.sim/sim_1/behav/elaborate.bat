@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.1\\bin
call %xv_path%/xelab  -wto 66e3c22a33694dfb935cccc3af844240 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_game_controller_behav xil_defaultlib.tb_game_controller -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
