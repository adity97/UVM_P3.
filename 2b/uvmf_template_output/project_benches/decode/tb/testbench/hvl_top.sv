import uvm_pkg::*;
import uvmf_base_pkg::*;
import decode_in_pkg::*;
import decode_out_pkg::*;	
import decode_test_pkg::*;
	
module hvl_top;

	

	initial begin
	run_test();		//phases start from here
	#0ns;
	end

endmodule