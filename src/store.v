`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2023 12:13:33 AM
// Design Name: 
// Module Name: store
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


module store(input rst, clk, current, [2:0] trigger, output reg [2:0] dc_control);
    always @(posedge clk || rst) begin
        if (rst == 1) begin
            dc_control <= 0;
        end
        else if (trigger == 0) begin
            if (current == 1) 
                begin
                    if (dc_control != 3'b111)
                        begin
                            dc_control <= dc_control + current;
                        end
                end
            else
                begin
                    dc_control <= 0;
                end
        end
    end
endmodule
