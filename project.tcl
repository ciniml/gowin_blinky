set_option -out_dir [file normalize .]
set_option -device GW1N-4-LQ100-6
set_option -pn GW1N-LV4LQ100C6/I5
set_option -prj_name blinky

add_file -hdl [file normalize src/blinky.sv]
add_file -cst [file normalize src/blinky.cst]
add_file -sdc [file normalize src/blinky.sdc]

run_synthesis -opt [file normalize synthesize.cfg]
run_pnr -timing
