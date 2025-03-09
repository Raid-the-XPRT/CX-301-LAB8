class yapp_tx_monitor extends uvm_monitor;

`uvm_component_utils(yapp_tx_monitor);

//virtual alu_if vif_monitor;
yapp_packet item;

//uvm_analysis_port #(yapp_packet) mon_port;

function new(string name = "yapp_tx_monitor", uvm_component parent);
super.new(name,parent); 
`uvm_info("--MONITOR_CLASS--","INSIDE CONSTRUCTOR",UVM_HIGH);
endfunction

function void start_of_simulation_phase(uvm_phase phase);
super.start_of_simulation_phase(phase);

`uvm_info("--MONITOR_CLASS--","START OF SIMULATION PHASE",UVM_HIGH);
endfunction
/*
function void build_phase(uvm_phase phase);
super.build_phase(phase);
mon_port = new("mon_port",this);
 
`uvm_info("--MONITOR_CLASS--","INSIDE BUILD PHASE",UVM_HIGH);
//if(!(uvm_config_db #(virtual alu_if)::get(this,"*","vif",vif_monitor)))begin
//`uvm_error("--DRIVER CLASS--", "Failed to get vif from config db");
//end
endfunction



function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
`uvm_info("--MONITOR_CLASS--","INSIDE CONNECT PHASE",UVM_HIGH);
endfunction


task run_phase(uvm_phase phase);
super.run_phase(phase);
 `uvm_info("--MONITOR_CLASS--","INSIDE RUN PHASE",UVM_LOW);

forever begin
    item = yapp_packet::type_id::create("item");
 
    wait(vif_monitor.reset==0);

    @(posedge vif_monitor.clock);

    item.A = vif_monitor.A;
    item.B = vif_monitor.B;
    item.ALU_Sel=vif_monitor.ALU_Sel;
    

    @(posedge vif_monitor.clock);
    
    item.ALU_Out=vif_monitor.ALU_Out;
    item.CarryOut=vif_monitor.CarryOut;


    mon_port.write(item);
    
    end

endtask

*/
endclass: yapp_tx_monitor


