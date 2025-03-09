class yapp_tx_driver extends uvm_driver #(yapp_packet);

`uvm_component_utils(yapp_tx_driver);

yapp_packet item;

function new(string name="yapp_driver", uvm_component parent);
super.new(name,parent);
`uvm_info("--DRIVER_CLASS--","INSIDE CONSTRUCTOR",UVM_HIGH);
endfunction


function void build_phase(uvm_phase phase);
super.build_phase(phase);
`uvm_info("--DRIVER_CLASS--","INSIDE BUILD PHASE",UVM_HIGH);
item = yapp_packet::type_id::create("item"); ///need to edit

//if(!(uvm_config_db #(virtual alu_if)::get(this,"*","vif",vif_driver)))begin
//`uvm_error("DRIVER CLASS", "Failed to get vif from config db");
//end
endfunction

function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
`uvm_info("--DRIVER_CLASS--","INSIDE CONNECT PHASE",UVM_HIGH);
endfunction


task run_phase(uvm_phase phase);
super.run_phase(phase);
`uvm_info("--DRIVER_CLASS--","INSIDE RUN PHASE",UVM_HIGH);

forever begin
    seq_item_port.get_next_item(item);
    send_to_dut(item);
    seq_item_port.item_done();
end
endtask

task send_to_dut(yapp_packet item);
/*
@(posedge vif_driver.clock)
vif_driver.reset <=item.reset;
vif_driver.A <=item.A;
vif_driver.B <=item.B;
vif_driver.ALU_Sel <=item.ALU_Sel;
`uvm_info($sformatf("Packet is \n%s",item.sprint()),UVM_LOW);
#10ns;
*/
endtask

endclass: yapp_tx_driver