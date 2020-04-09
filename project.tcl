set_option -out_dir [file normalize .]
set_option -device GW1N-1-QFN48-6
set_option -pn GW1N-LV1QN48C6/I5
set_option -prj_name blinky

add_file -hdl [file normalize src/blinky.sv]
add_file -cst [file normalize src/blinky.cst]
add_file -sdc [file normalize src/blinky.sdc]
add_file -cfg [file normalize device.cfg]

run_synthesis -opt [file normalize synthesize.cfg]
run_pnr -timing
