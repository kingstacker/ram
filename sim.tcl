#set testbench name;
set tb_name ram_tb
#set the sim home dir ;
set sim_home D:/work/ram_1
#set the src code home dir;
set src_home D:/work/ram_1
vlib ${sim_home}/work
vmap work ${sim_home}/work
vlog ${src_home}/ram.v  ${src_home}/ram_tb.v
vsim -novopt -t ns -L altera_ver -L altera_mf_ver -L cycloneive_ver -L sgate_ver -L lpm_ver work.${tb_name}
view wave
add wave *
run 800ns
#quit -f