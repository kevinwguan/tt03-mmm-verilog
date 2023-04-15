`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2023 03:48:17 PM
// Design Name: 
// Module Name: osc
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


module osc(input clk1, output clk_out);
    wire tmp0, tmp1, tmp2, tmp3, tmp4;
    //wire clk2, feed;
    
    // D1
    mux_cell mux1(.out(tmp0), .a(clk_out), .b(clk1), .sel(clk1));
    
    // Chain
    inv inv1(.in(tmp0), .out(tmp1));
    inv inv2(.in(tmp1), .out(tmp2));
    inv inv3(.in(tmp2), .out(tmp3));
    inv inv4(.in(tmp3), .out(tmp4));
    inv inv5(.in(tmp4), .out(clk_out));
    
    // Feedback
    //store store1(.in(clk_out), .out(feed));
    //inv inv_d(.in(clk1), .out(clk2));
    //dlatch d_inst(.clk(clk2), .d(clk_out), .q(feed));
    //buffer buffer1(.in(clk_out), .out(feed));

endmodule
