class test_top extends uvm_test;

 	`uvm_component_utils(test_top)  //factory registration

		
	decode_in_random_sequence d_seq;
        decode_environment d_env;
        decode_env_configuration configuration;

		
	//print_component print_all;

	string interface_names[]={"decode_in_if","decode_out_if"};
        uvmf_active_passive_t activity[]= {ACTIVE,PASSIVE};


	function new(string name="",uvm_component parent = null);
 		super.new(name,parent);
	endfunction
	

	virtual function void build_phase(uvm_phase phase);

		//d_agent = decode_in_agent::type_id::create("d_agent",this);  //create agent

		//d_config = decode_in_configuration::type_id::create("d_config");  //create config
		d_seq=decode_in_random_sequence::type_id::create("d_seq",this);

                configuration=decode_env_configuration::type_id::create("configuration",this);
                d_env=decode_environment::type_id::create("d_env",this);
                d_env.configuration=configuration;
                configuration.initialize(BLOCK,"uvm_test_top.d_env",interface_names,null,activity);
		//d_config.initialize(ACTIVE,"uvm_test_top.d_env","decode_in_if");
		//d_config.initiator_responder=INITIATOR;


		//do_agent = decode_out_agent::type_id::create("do_agent",this);  //create agent

		//do_config = decode_out_configuration::type_id::create("do_config");  //create config
		//do_seq=decode_out_random_sequence::type_id::create("do_seq",this);
		//do_config.initialize(ACTIVE,"uvm_test_top.d_env","decode_out_if");
		//do_config.initiator_responder=RESPONDER;

		//print_all=print_component::type_id::create("print_all",this);

		//if(!uvm_config_db#(virtual decode_in_driver_bfm)::get(this,"","decode_in_driver_bfm",d_config.d_bfm_interface))   //handle from config file
  		//	`uvm_fatal(get_full_name(),{"virtual interface must be set for:","decode_in_driver_bfm"});   //driver bfm
 
		//if(!uvm_config_db#(virtual decode_in_monitor_bfm)::get(this,"","decode_in_monitor_bfm",d_config.m_bfm_interface))
  		//	`uvm_fatal(get_full_name(),{"virtual interface must be set for:","decode_in_monitor_bfm"});  // monitor bfm

		//if(!uvm_config_db#(virtual decode_in_if)::get(this,"","decode_in_if",d_config.d_interface))
  		//	`uvm_fatal(get_full_name(),{"virtual interface must be set for:","decode_in_if"});   // decode_in_interface

  		super.build_phase(phase);
		//$display("TEST TOP***************");

  		//uvm_config_db #(decode_in_configuration)::set(this,"*","decode_in_configuration",d_config); //set agent wrt config

  	endfunction

	//virtual function void connect_phase(uvm_phase phase);
	//super.connect_phase(phase);
	//d_agent.monitored_ap.connect(print_all.export_in);
	//do_agent.monitored_ap.connect(print_all.export_out);

	//endfunction


	virtual task run_phase(uvm_phase phase);

  	
   		//repeat(25)
		//begin
   		super.run_phase(phase);
   		phase.raise_objection(this);
		repeat(25)
   		d_seq.start(d_env.din_agent.sequencer);
   		//#10;
   		phase.drop_objection(this);
		//end

	endtask
endclass
