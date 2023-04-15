`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2023 10:25:24 PM
// Design Name: 
// Module Name: dc_control
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


module dc_control(input rst, clk, motor, input [2:0] duty, input [2:0] counter, output reg [2:0] dc);
    reg [2:0] store;
    always @(posedge clk or posedge rst) begin
        if (rst == 1) begin
            store <= duty;
            dc <= 0;    
        end
        else if (motor == 1) begin
            if (duty == 0) begin
                dc <= store;
            end
            else begin
                dc <= duty;
            end
        end
        else if (counter == 0) begin
            dc <= 0;
        end
    end
endmodule
