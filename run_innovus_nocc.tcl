set init_verilog /home/edaworker/spef_w_layer/log2/test.v
set init_lef_file {/home/edaworker/asap7nm/asap7sc7p5t_28/techlef_misc/asap7_tech_1x_201209.lef /home/edaworker/asap7nm/asap7sc7p5t_28/LEF/asap7sc7p5t_28_R_1x_220121a.lef}
set init_top_cell top
set init_pwr_net VDD
set init_gnd_net VSS
init_design

puts "=== Reading routed DEF ==="
defIn /home/edaworker/spef_w_layer/log2/top_rvt_gr.def

puts "=== extractRC (no coupling) ==="
setExtractRCMode -engine postRoute -effortLevel low -coupled false
extractRC

puts "=== rcOut ==="
rcOut -spef /home/edaworker/spef_w_layer/log2/log2_top_rvt_gr_innovus_nocc.spef

puts "=== Done! ==="
exit
