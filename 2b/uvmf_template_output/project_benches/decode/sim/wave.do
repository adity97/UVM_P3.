onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /hdl_top/dif/clock
add wave -noupdate /hdl_top/dif/reset
add wave -noupdate /hdl_top/dif/enable_decode
add wave -noupdate /hdl_top/dif/dout
add wave -noupdate /hdl_top/dif/npc_in
add wave -noupdate /uvm_root/uvm_test_top/d_env/din_agent/din_agent_monitor/txn_stream
add wave -noupdate /uvm_root/uvm_test_top/d_env/dout_agent/dout_agent_monitor/txn_stream
add wave -noupdate /hdl_top/dif/clock
add wave -noupdate /hdl_top/dif/reset
add wave -noupdate /hdl_top/dif/enable_decode
add wave -noupdate /hdl_top/dif/dout
add wave -noupdate /hdl_top/dif/npc_in
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {14887 ns}
