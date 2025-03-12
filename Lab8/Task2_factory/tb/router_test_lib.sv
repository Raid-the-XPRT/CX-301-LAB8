class yapp_tx_test extends uvm_test;

`uvm_component_utils(yapp_tx_test);

yapp_tx_env env;


//alu_base_sequence base1;
//alu_test_sequence test1;

function new(string name = "yapp_tx_test", uvm_component parent);
super.new(name,parent);
`uvm_info("TEST_CLASS","INSIDE CONSTRUCTOR",UVM_HIGH);
endfunction

function void start_of_simulation_phase(uvm_phase phase);
super.start_of_simulation_phase(phase);

`uvm_info("--TEST_CLASS--","START OF SIMULATION PHASE",UVM_HIGH);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
`uvm_info("TEST_CLASS","INSIDE BUILD PHASE",UVM_HIGH);

 //uvm_config_wrapper::set(this, "env.agent.sequencer.run_phase",
 //                               "default_sequence",
 //                               yapp_5_packets::get_type());

                                

env = yapp_tx_env::type_id::create("env",this);

uvm_config_int::set(this,"*","recording_detail",1);



endfunction

function void check_phase(uvm_phase phase);
super.check_phase(phase);
check_config_usage();
endfunction

function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
`uvm_info("TEST_CLASS","INSIDE CONNECT PHASE",UVM_HIGH);

//connect monitor with scoreboard

endfunction


task run_phase(uvm_phase phase);
super.run_phase(phase);
`uvm_info("TEST_CLASS","INSIDE RUN PHASE",UVM_HIGH);

/*
phase.raise_objection(this);

//start the sequences
base1= alu_base_sequence::type_id::create("base1");
base1.start(env.agent.sequencer);

repeat (100) begin
test1=alu_test_sequence::type_id::create("test1");
test1.start(env.agent.sequencer);
end


phase.drop_objection(this);
*/
    uvm_top.print_topology();

//LOGIC
endtask

endclass: yapp_tx_test

class short_yapp_tx_test extends yapp_tx_test;

`uvm_component_utils(short_yapp_tx_test);

//yapp_tx_env env;


//alu_base_sequence base1;
//alu_test_sequence test1;

function new(string name = "short_yapp_tx_test", uvm_component parent);
super.new(name,parent);
`uvm_info("TEST_CLASS","INSIDE CONSTRUCTOR",UVM_HIGH);
endfunction

//function void start_of_simulation_phase(uvm_phase phase);
//super.start_of_simulation_phase(phase);

//`uvm_info("--TEST_CLASS--","START OF SIMULATION PHASE",UVM_HIGH);
//endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
`uvm_info("TEST_CLASS","INSIDE BUILD PHASE",UVM_HIGH);


set_type_override_by_type(yapp_packet::get_type(),short_yapp_packet::get_type());


// uvm_config_wrapper::set(this, "env.agent.sequencer.run_phase",
//                                "default_sequence",
//                                yapp_5_packets::get_type());

                                

//env = yapp_tx_env::type_id::create("env",this);

//uvm_config_int::set(this,"*","recording_detail",1);

endfunction

//function void check(uvm_phase phase);
//super.check(phase);
//check_config_usage();
//endfunction

///function void connect_phase(uvm_phase phase);
//super.connect_phase(phase);
//`uvm_info("TEST_CLASS","INSIDE CONNECT PHASE",UVM_HIGH);

//connect monitor with scoreboard

//endfunction


//task run_phase(uvm_phase phase);
//super.run_phase(phase);
//`uvm_info("TEST_CLASS","INSIDE RUN PHASE",UVM_HIGH);

/*
phase.raise_objection(this);

//start the sequences
base1= alu_base_sequence::type_id::create("base1");
base1.start(env.agent.sequencer);

repeat (100) begin
test1=alu_test_sequence::type_id::create("test1");
test1.start(env.agent.sequencer);
//                                "default_sequence",
//                                yapp_5_packets::get_type());

uvm_config_int::set(this,"*agent*","is_active",UVM_PASSIVE);
                                

//env = yapp_tx_env::type_id::create("env",this);

//uvm_config_int::set(this,"*","recording_detail",1);

endfunction

//function void check(uvm_phase phase);
//super.check(phase);
//check_config_usage();
//endfunction
end


phase.drop_objection(this);
*/
//    uvm_top.print_topology();

//LOGIC
//endtask

endclass: short_yapp_tx_test

class configuration_test extends short_yapp_tx_test;

`uvm_component_utils(configuration_test);

//yapp_tx_env env;


//alu_base_sequence base1;
//alu_test_sequence test1;

function new(string name = "configuration_test", uvm_component parent);
super.new(name,parent);
`uvm_info("--TEST_CLASS--","INSIDE CONSTRUCTOR",UVM_HIGH);
endfunction

//function void start_of_simulation_phase(uvm_phase phase);
//super.start_of_simulation_phase(phase);

//`uvm_info("--TEST_CLASS--","START OF SIMULATION PHASE",UVM_HIGH);
//endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
`uvm_info("--TEST_CLASS--","INSIDE BUILD PHASE",UVM_HIGH);


set_type_override_by_type(yapp_packet::get_type(),short_yapp_packet::get_type());


 uvm_config_wrapper::set(this, "env.agent.sequencer.run_phase",
                                "default_sequence",
                                yapp_5_packets::get_type());

uvm_config_int::set(this,"*agent*","is_active",UVM_ACTIVE);
                                

//env = yapp_tx_env::type_id::create("env",this);

//uvm_config_int::set(this,"*","recording_detail",1);

endfunction

//function void check(uvm_phase phase);
//super.check(phase);
//check_config_usage();
//endfunction

///function void connect_phase(uvm_phase phase);
//super.connect_phase(phase);
//`uvm_info("TEST_CLASS","INSIDE CONNECT PHASE",UVM_HIGH);

//connect monitor with scoreboard

//endfunction


//task run_phase(uvm_phase phase);
//super.run_phase(phase);
//`uvm_info("TEST_CLASS","INSIDE RUN PHASE",UVM_HIGH);

/*
phase.raise_objection(this);

//start the sequences
base1= alu_base_sequence::type_id::create("base1");
base1.start(env.agent.sequencer);

repeat (100) begin
test1=alu_test_sequence::type_id::create("test1");
test1.start(env.agent.sequencer);
end


phase.drop_objection(this);
*/
//    uvm_top.print_topology();

//LOGIC
//endtask

endclass: configuration_test