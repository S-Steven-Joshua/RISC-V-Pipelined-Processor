`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2025 10:44:45
// Design Name: 
// Module Name: IF_ID
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
//Instruction fetch/ Instruction Decode Pipeline Register

module IF_ID(address,clock,reset,ifid_write,flush,instruction,pip_inst,pip_add);
input logic [63:0] address;
input logic [31:0] instruction;
input logic clock,reset,flush,ifid_write;
output logic [63:0] pip_add;
output logic  [31:0] pip_inst;
always_ff@(posedge clock)
begin
    if(reset)
        begin
            pip_add<=64'd0;
            pip_inst<=32'd0;
       end
    else if(flush) 
        begin
            pip_add<=64'd0;
            pip_inst<=32'd0;
        end
    else if(ifid_write)
        begin
            pip_add<=address;
            pip_inst<=instruction;
        end
end
endmodule
