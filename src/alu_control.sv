`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2025 08:53:58
// Design Name: 
// Module Name: alu_control
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


module alu_control(alu_op,func,operation);
input logic [1:0] alu_op;
input logic [3:0] func;
output logic [3:0] operation;
always@(*)
begin
    operation=4'bxxxx;
    if(alu_op==2'b01)
        begin
            operation=4'b0110;
        end
    else if(alu_op==2'b00)
        begin
            operation=4'b0010;
        end
    else if(alu_op==2'b10)
        unique case(func)
                4'b0000:operation=4'b0010;
                4'b0111:operation=4'b0000;
                4'b1000:operation=4'b0110;
                4'b0110:operation=4'b0001;
                default:operation=4'bxxxx;
        endcase
end
endmodule
