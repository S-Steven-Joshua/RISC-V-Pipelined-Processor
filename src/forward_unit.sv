`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2025 18:15:28
// Design Name: 
// Module Name: forward_unit
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


module forward_unit(rs1,rs2,rd_mem,rd_wb,reg_write_wb,reg_write_mem,for_A,for_B);
input logic [4:0] rs1,rs2,rd_mem,rd_wb;
input logic reg_write_wb,reg_write_mem;
output logic [1:0] for_A,for_B;
always_comb
begin
    if((rd_mem==rs1)&(reg_write_mem!=0 & rd_mem!=0))
            for_A=2'b10;
    else
        begin
            if((rd_wb==rs1)&(reg_write_wb!=0 & rd_wb!=0)&~((rd_mem==rs1)&(reg_write_mem!=0 & rd_mem!=0)))
                for_A=2'b01;
            else
                for_A=2'b00;
        end
    if((rd_mem==rs2)&(reg_write_mem!=0 & rd_mem!=0))
        for_B=2'b10;
    else
        begin
            if((rd_wb==rs2)&(reg_write_wb!=0 & rd_wb!=0)&~((rd_mem==rs2)&(reg_write_mem!=0 & rd_mem!=0)))
                for_B=2'b01;
            else
                for_B=2'b00;
        end 
end        
endmodule
