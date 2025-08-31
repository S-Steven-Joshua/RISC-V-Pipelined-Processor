`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2025 08:28:54
// Design Name: 
// Module Name: control_unit
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


module control_unit(opcode,stall,branch,mem_read,mem_write,mem_to_reg,reg_write,alu_src,alu_op);
input logic [6:0] opcode;
input logic stall;
output logic branch,mem_read,mem_write,mem_to_reg,reg_write,alu_src;
output logic [1:0] alu_op;
always_comb
begin
    unique case(opcode)
     7'b0000011://Load
                begin
                    alu_src=1'b1;
                    mem_to_reg=1'b1;
                    reg_write=1'b1;
                    mem_read=1'b1;
                    mem_write=1'b0;
                    branch=1'b0;
                    alu_op=2'b00;
                end
     7'b0100011://Store
                begin
                    alu_src=1'b1;
                    mem_to_reg=1'bx;
                    reg_write=1'b0;
                    mem_read=1'b0;
                    mem_write=1'b1;
                    branch=1'b0;
                    alu_op=2'b00;
                end
    7'b0110011://R-Type
               begin
                    alu_src=1'b0;
                    mem_to_reg=1'b0;
                    reg_write=1'b1;
                    mem_read=1'b0;
                    mem_write=1'b0;
                    branch=1'b0;
                    alu_op=2'b10;
               end
    7'b1100011://BEQ
               begin
                    alu_src=1'b0;
                    mem_to_reg=1'bx;
                    reg_write=1'b0;
                    mem_read=1'b0;
                    mem_write=1'b0;
                    branch=1'b1;
                    alu_op=2'b01;
               end
    7'b0010011://I-Type
               begin
                   alu_src=1'b1;
                   mem_to_reg=1'b0;
                   reg_write=1'b1;
                   mem_read=1'b0;
                   mem_write=1'b0;
                   branch=1'b0;
                   alu_op=2'b00;
              end
    default:
            begin
                 alu_src=1'b0;
                 mem_to_reg=1'b0;
                 reg_write=1'b0;
                 mem_read=1'b0;
                 mem_write=1'b0;
                 branch=1'b0;
                 alu_op=2'b00;
            end
    endcase
    if(stall)
        begin
             alu_src=1'b0;
             mem_to_reg=1'b0;
             reg_write=1'b0;
             mem_read=1'b0;
             mem_write=1'b0;
             branch=1'b0;
             alu_op=2'b00;
        end
end        
endmodule
