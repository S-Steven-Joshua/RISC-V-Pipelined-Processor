`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2025 20:35:42
// Design Name: 
// Module Name: instruction_parser
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


module instruction_parser(instruction,opcode,rd,func3,rs1,rs2,func7);
input logic [31:0] instruction;
output logic [6:0] opcode;
output logic [4:0] rd;
output logic [2:0] func3;
output logic [4:0] rs2;
output logic [4:0] rs1;
output logic [6:0] func7;
assign opcode=instruction[6:0];
assign rd=instruction[11:7];
assign func3=instruction[14:12];
assign rs1=instruction[19:15];
assign rs2=instruction[24:20];
assign func7=instruction[31:25];
endmodule
