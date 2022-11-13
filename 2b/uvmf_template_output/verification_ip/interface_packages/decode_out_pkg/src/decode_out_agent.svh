//----------------------------------------------------------------------
// Created with uvmf_gen version 2019.4_2
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// DESCRIPTION: Protocol specific agent class definition
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class decode_out_agent  extends uvmf_parameterized_agent #(
                    .CONFIG_T(decode_out_configuration ),
                    .DRIVER_T(decode_out_driver ),
                    .MONITOR_T(decode_out_monitor ),
                    .COVERAGE_T(decode_out_transaction_coverage ),
                    .TRANS_T(decode_out_transaction )
                    );

  `uvm_component_utils( decode_out_agent )

// pragma uvmf custom class_item_additional begin
// pragma uvmf custom class_item_additional end

// ****************************************************************************
// FUNCTION : new()
// This function is the standard SystemVerilog constructor.
//
  function new( string name = "", uvm_component parent = null );
    super.new( name, parent );
  endfunction

// ****************************************************************************
  // FUNCTION: build_phase
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (configuration.active_passive == ACTIVE) begin
      // Place sequencer handle into configuration object
      // so that it may be retrieved from configuration 
      // rather than using uvm_config_db
      configuration.sequencer = this.sequencer;
    end
  endfunction
  
endclass
