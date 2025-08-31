`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2025 18:10:05
// Design Name: 
// Module Name: hazard_detection
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


module hazard_detection(instruction,rd,mem_read,stall);
input logic [31:0] instruction;
input logic mem_read;
input logic [4:0] rd;
output logic stall;
always_comb
begin
    if(mem_read==1'b1 &&((rd==instruction[19:15])||(rd==instruction[24:20])))
        stall=1'b1;
    else
        stall=1'b0;
end
endmodule
