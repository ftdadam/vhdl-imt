@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.1\\bin
call %xv_path%/xelab  -wto 113b1efd00b849a7831faebaed347f4d -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_top_behav xil_defaultlib.tb_top -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
