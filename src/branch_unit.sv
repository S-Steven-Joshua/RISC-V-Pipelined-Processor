`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2025 16:23:34
// Design Name: 
// Module Name: branch_unit
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


module branch_unit(funct3,read_data1,b,mux_sel);
input logic [2:0] funct3;
input logic [63:0] read_data1,b;
output logic mux_sel;
always_comb
begin
    unique case(funct3)
        3'b000:
                begin
                    if(read_data1==b)
                            mux_sel=1'b1;
                     else
                        mux_sel=1'b0;
                 end
         3'b100:
                begin
                    if(read_data1<b)
                        mux_sel=1'b1;
                    else
                        mux_sel=1'b0;
                end
         3'b101:
                begin
                     if(read_data1>b)
                        mux_sel=1'b1;
                     else
                        mux_sel=1'b0;
                end
    endcase   
end                
endmodule
