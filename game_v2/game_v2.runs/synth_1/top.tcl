# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir D:/imt/vhdl-imt/game_v2/game_v2.cache/wt [current_project]
set_property parent.project_path D:/imt/vhdl-imt/game_v2/game_v2.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:nexys4_ddr:part0:1.1 [current_project]
read_vhdl -library xil_defaultlib {
  D:/imt/vhdl-imt/game_v2/game_v2.srcs/sources_1/imports/new/bin2bcd.vhd
  D:/imt/vhdl-imt/game_v2/game_v2.srcs/sources_1/imports/new/score.vhd
  D:/imt/vhdl-imt/game_v2/game_v2.srcs/sources_1/imports/new/board_matrix.vhd
  D:/imt/vhdl-imt/game_v2/game_v2.srcs/sources_1/imports/new/prbs.vhd
  D:/imt/vhdl-imt/game_v2/game_v2.srcs/sources_1/imports/new/player_vector.vhd
  D:/imt/vhdl-imt/game_v2/game_v2.srcs/sources_1/imports/new/collision.vhd
  D:/imt/vhdl-imt/game_v2/game_v2.srcs/sources_1/imports/new/vga_controller.vhd
  D:/imt/vhdl-imt/game_v2/game_v2.srcs/sources_1/imports/new/game_controller.vhd
  D:/imt/vhdl-imt/game_v2/game_v2.srcs/sources_1/imports/new/clk_wiz_v3_6.vhd
  D:/imt/vhdl-imt/game_v2/game_v2.srcs/sources_1/imports/new/tick_generator.vhd
  D:/imt/vhdl-imt/game_v2/game_v2.srcs/sources_1/imports/new/tdm_displays.vhd
  D:/imt/vhdl-imt/game_v2/game_v2.srcs/sources_1/imports/new/top.vhd
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/imt/vhdl-imt/game_v2/game_v2.srcs/constrs_1/imports/game_v1/Nexys-4-DDR-Master.xdc
set_property used_in_implementation false [get_files D:/imt/vhdl-imt/game_v2/game_v2.srcs/constrs_1/imports/game_v1/Nexys-4-DDR-Master.xdc]


synth_design -top top -part xc7a100tcsg324-1


write_checkpoint -force -noxdef top.dcp

catch { report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb }