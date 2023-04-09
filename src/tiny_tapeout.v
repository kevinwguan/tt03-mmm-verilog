`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2023 12:42:47 AM
// Design Name: 
// Module Name: tiny_tapeout
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


module kevinwguan_tiny_tapeout(input [7:0] io_in, output [7:0] io_out);
    wire clk_out;
    wire left, right;
    wire [2:0] lcontrol, rcontrol;
    wire [2:0] trigger;
    
    osc osc_inst(io_in[2], clk_out);
    counter counter_inst(io_in[2], clk_out, trigger);
    fsm fsm_inst(io_in[0], io_in[1], clk_out, left, right);
    store store_left(io_in[2], clk_out, left, trigger, lcontrol);
    store store_right(io_in[2], clk_out, right, trigger, rcontrol);
    pwm_simple pwm_simple_linst(io_out[0], clk_out, trigger, lcontrol);
    pwm_simple pwm_simple_rinst(io_out[1], clk_out, trigger, rcontrol);
endmodule
