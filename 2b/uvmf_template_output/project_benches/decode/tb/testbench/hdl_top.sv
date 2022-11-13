module hdl_top;

bit clk;
bit rst;
//bit enable_decode;


initial begin

 forever begin

  #5 clk<= ~clk;		//generate clock
  
  end
end

initial begin
 rst=1;
 #10ns;				//generate reset
 rst=0;
end

decode_in_if dif(.clock(clk), .reset(rst));		//instantiate Interface
decode_in_driver_bfm dbfm(dif);				//instantiate driver bfm Interface
decode_in_monitor_bfm mbfm(dif);			//instantiate monitor bfm Interface

decode_out_if dof(.clock(clk), .reset(rst));		//instantiate Interface
decode_out_driver_bfm dobfm(dof);				//instantiate driver bfm Interface
decode_out_monitor_bfm mobfm(dof);			//instantiate monitor bfm Interface

Decode dut_d(.clock(clk),.reset(rst),.enable_decode(dif.enable_decode),.npc_in(dif.npc_in),.dout(dif.dout),.W_Control(dof.W_Control),.Mem_Control(dof.Mem_Control),
					.E_Control(dof.E_Control),.IR(dof.IR),.npc_out(dof.npc_out));

initial begin
 
 import uvm_pkg::uvm_config_db;
 uvm_config_db#(virtual decode_in_if)::set(null,"*","decode_in_if",dif);		//setting interfaces

 uvm_config_db#(virtual decode_in_driver_bfm)::set(null,"*","decode_in_if",dbfm);

 uvm_config_db#(virtual decode_in_monitor_bfm)::set(null,"*","decode_in_if",mbfm);

	
 uvm_config_db#(virtual decode_out_if)::set(null,"*","decode_out_if",dof);		//setting interfaces

 uvm_config_db#(virtual decode_out_driver_bfm)::set(null,"*","decode_out_if",dobfm);

 uvm_config_db#(virtual decode_out_monitor_bfm)::set(null,"*","decode_out_if",mobfm);


end

endmodule

