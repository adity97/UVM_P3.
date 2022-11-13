//----------------------------------------------------------------------
// Created with uvmf_gen version 2019.4_2
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//
//----------------------------------------------------------------------
//
// DESCRIPTION: This analysis component contains analysis_exports for receiving
//   data and analysis_ports for sending data.
// 
//   This analysis component has the following analysis_exports that receive the 
//   listed transaction type.
//   
//   port_decode_in receives transactions of type  decode_in_transaction  
//
//   This analysis component has the following analysis_ports that can broadcast 
//   the listed transaction type.
//
//  pred_out_dec broadcasts transactions of type decode_out_transaction 
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class decode_predictor #(
  type CONFIG_T
  ) extends uvm_component;

  // Factory registration of this class
  `uvm_component_param_utils( decode_predictor #(
                              CONFIG_T
                              ))


  // Instantiate a handle to the configuration of the environment in which this component resides
  CONFIG_T configuration;

  
  // Instantiate the analysis exports
  uvm_analysis_imp_port_decode_in #(decode_in_transaction, decode_predictor #(
                              .CONFIG_T(CONFIG_T)
                              )) port_decode_in;

  
  // Instantiate the analysis ports
  uvm_analysis_port #(decode_out_transaction) pred_out_dec;


  // Transaction variable for predicted values to be sent out pred_out_dec
  typedef decode_out_transaction pred_out_dec_output_transaction_t;
  pred_out_dec_output_transaction_t pred_out_dec_output_transaction;
  // Code for sending output transaction out through pred_out_dec
  // pred_out_dec.write(pred_out_dec_output_transaction);

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // FUNCTION: new
  function new(string name, uvm_component parent);
     super.new(name,parent);
  endfunction

  // FUNCTION: build_phase
  virtual function void build_phase (uvm_phase phase);

    port_decode_in = new("port_decode_in", this);
    pred_out_dec =new("pred_out_dec", this );
  endfunction

  // FUNCTION: write_port_decode_in
  // Transactions received through port_decode_in initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_port_decode_in(decode_in_transaction t);
    // pragma uvmf custom port_decode_in_predictor begin
    `uvm_info("PRED", "Transaction Received through port_decode_in", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    // Construct one of each output transaction type.
    pred_out_dec_output_transaction = pred_out_dec_output_transaction_t::type_id::create("pred_out_dec_output_transaction");
    //  UVMF_CHANGE_ME: Implement predictor model here.  
	
	decode_model(t.instruction,t.npc_in,
					pred_out_dec_output_transaction.IR,
pred_out_dec_output_transaction.npc_out,
pred_out_dec_output_transaction.E_Control,
pred_out_dec_output_transaction.W_Control,
pred_out_dec_output_transaction.Mem_Control					
										);
	

    //`uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
    //`uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "UVMF_CHANGE_ME: The decode_predictor::write_port_decode_in function needs to be completed with DUT prediction model",UVM_NONE)
    //`uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
 
    // Code for sending output transaction out through pred_out_dec
    pred_out_dec.write(pred_out_dec_output_transaction);
    // pragma uvmf custom port_decode_in_predictor end
  endfunction


endclass 
