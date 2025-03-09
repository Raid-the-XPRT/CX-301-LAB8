`timescale 1ns/1ps
`include "/home/Raid_Al-Tamimi/Verification/Labs/Lab8/Task1_uvc/sv/yapp_pkg.sv"
import uvm_pkg::*;

`include "uvm_macros.svh"


module top;
    
    logic clk=0;

//alu_if alu_intif(.clock(clk));


/*
alu DUT(
    .clock(alu_intif.clock),
    .reset(alu_intif.reset),
    .A(alu_intif.A),
    .B(alu_intif.B),
    .ALU_Sel(alu_intif.ALU_Sel),
    .ALU_Out(alu_intif.ALU_Out),
    .CarryOut(alu_intif.CarryOut)
    );  

*/

always #2 clk = ~clk; 

initial begin
    run_test("yapp_tx_test");
end

//initial begin
//uvm_config_db #(virtual alu_if)::set(null,"*","vif",alu_intif);
//end


initial begin
    #50000;
    $display("SYSTEM TIMEOUT!!!");
    $finish;
end



initial begin
    $dumpfile("d.vcd");
    $dumpvars();
end

endmodule: top

