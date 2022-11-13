`uvm_analysis_imp_decl(_dec_in)
`uvm_analysis_imp_decl(_dec_out)

class print_component extends uvm_component;
`uvm_component_utils(print_component)
uvm_analysis_imp_dec_in #(decode_in_transaction,print_component) export_in;
uvm_analysis_imp_dec_out #(decode_out_transaction,print_component) export_out;


 function new( string name = "", uvm_component parent = null );
    super.new( name, parent );
     export_in=new("export_in",this);
     export_out=new("export_out",this);
  endfunction

virtual function void build_phase(uvm_phase phase);

 super.build_phase(phase);
 
endfunction

 function void write_dec_in(input decode_in_transaction tin);

 `uvm_info("Decode_in", {"Transactions:",tin.convert2string()},UVM_MEDIUM)

endfunction


 function void write_dec_out(input decode_out_transaction tout);

 `uvm_info("Decode_out", {"Transactions:",tout.convert2string()},UVM_MEDIUM)

endfunction
endclass