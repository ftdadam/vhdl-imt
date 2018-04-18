@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.1\\bin
call %xv_path%/xelab  -wto ec2ebf6a36e14c9b9314c960bb11de97 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_top_behav xil_defaultlib.tb_top -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
