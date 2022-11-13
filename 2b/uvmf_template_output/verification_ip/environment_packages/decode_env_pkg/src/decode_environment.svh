//----------------------------------------------------------------------
// Created with uvmf_gen version 2019.4_2
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//                                          
// DESCRIPTION: This environment contains all agents, predictors and
// scoreboards required for the block level design.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class decode_environment  extends uvmf_environment_base #(
    .CONFIG_T( decode_env_configuration 
  ));
  `uvm_component_utils( decode_environment )





  typedef decode_in_agent  din_agent_agent_t;
  din_agent_agent_t din_agent;

  typedef decode_out_agent  dout_agent_agent_t;
  dout_agent_agent_t dout_agent;
  decode_env_configuration configuration;



  typedef decode_predictor #(
                .CONFIG_T(CONFIG_T)
                ) pred_t;
  pred_t pred;

  typedef uvmf_in_order_scoreboard #(.T(decode_out_transaction))  d_scbd_t;
  d_scbd_t d_scbd;


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
// FUNCTION: build_phase()
// This function builds all components within this environment.
//
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    din_agent = din_agent_agent_t::type_id::create("din_agent",this);
    din_agent.set_config(configuration.din_agent_config);
    dout_agent = dout_agent_agent_t::type_id::create("dout_agent",this);
    dout_agent.set_config(configuration.dout_agent_config);
    pred = pred_t::type_id::create("pred",this);
    pred.configuration = configuration;
    d_scbd = d_scbd_t::type_id::create("d_scbd",this);
    // pragma uvmf custom build_phase begin
    // pragma uvmf custom build_phase end
  endfunction

// ****************************************************************************
// FUNCTION: connect_phase()
// This function makes all connections within this environment.  Connections
// typically inclue agent to predictor, predictor to scoreboard and scoreboard
// to agent.
//
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    din_agent.monitored_ap.connect(pred.port_decode_in);
    pred.pred_out_dec.connect(d_scbd.expected_analysis_export);
    dout_agent.monitored_ap.connect(d_scbd.actual_analysis_export);
    // pragma uvmf custom reg_model_connect_phase begin
    // pragma uvmf custom reg_model_connect_phase end
  endfunction

endclass

