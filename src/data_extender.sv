`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2025 22:09:41
// Design Name: 
// Module Name: data_extender
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


module data_extender(instruction,imm_data);
input logic [31:0] instruction;
output logic [63:0] imm_data;

always_comb
begin
    unique case(instruction[6:5])
    2'b00:
        begin
            imm_data[11:0]=instruction[31:20];
        end
    2'b01:
         begin
            imm_data[11:0]={instruction[31:25],instruction[11:7]};
         end
     2'b11:
        begin
            imm_data[11:0]={instruction[31],instruction[7],instruction[30:25],instruction[11:8]};
        end
     endcase
     imm_data={{52{imm_data[11]}},{imm_data[11:0]}};
end     
endmodule

