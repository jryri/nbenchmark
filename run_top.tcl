set init_verilog /home/edaworker/spef_w_layer/des/log2/test.v
set init_lef_file {/home/edaworker/asap7nm/asap7sc7p5t_28/techlef_misc/asap7_tech_1x_201209.lef /home/edaworker/asap7nm/asap7sc7p5t_28/LEF/asap7sc7p5t_28_R_1x_220121a.lef}
set init_top_cell top
set init_pwr_net VDD
set init_gnd_net VSS
init_design

puts "=== floorPlan ==="
floorPlan -r 1.0 0.7 10 10 10 10

puts "=== place_opt_design ==="
place_opt_design

puts "=== globalRoute ==="
globalRoute

puts "=== routeDesign ==="
routeDesign

puts "=== extractRC ==="
setExtractRCMode -engine postRoute -effortLevel low
extractRC

puts "=== rcOut ==="
rcOut -spef /home/edaworker/spef_w_layer/des/log2/top_rvt_gr.spef

puts "=== saveNetlist ==="
saveNetlist -flat -removePowerGround -flattenBus /home/edaworker/spef_w_layer/des/log2/top_rvt_gr.v

puts "=== defOut ==="
defOut -netlist -earlyGlobalRoute /home/edaworker/spef_w_layer/des/log2/top_rvt_gr.def

puts "=== Done! ==="
exit
