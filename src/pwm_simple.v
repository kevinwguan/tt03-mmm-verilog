`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2023 01:18:12 PM
// Design Name: 
// Module Name: pwm
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

module pwm_simple (output wire pwm, input rst, clk, input [2:0] trigger, input [2:0] dc);
    
    wire set, reset, reset_tmp;
    wire is0, s_setup, r_setup;
    wire setd, clrd, pwm_pass;
    //wire [2:0] cnt;    
    
    // 1
    //counter counter_inst(.clk(clk), .count(cnt));
    
    // 2
    comparator cmp1(.a(3'b0), .b(trigger), .equal(setd));
    dff_cell ffe(.clk(clk), .d(setd), .q(set));
    dffsr_cell sr_inst(.s(s_setup), .r(r_setup), .q(pwm_pass));
    pass pass_rst(.x(rst), .y(pwm_pass), .f(pwm));
    
    // 3
    comparator cmp2(.a(trigger), .b(dc), .equal(clrd));
    dff_cell ff0(.clk(clk), .d(clrd), .q(reset_tmp));
    
    // 4
    comparator cmp3(.a(3'b0), .b(dc), .equal(is0));
    setup setup_inst(.s(set), .r(reset), .is0(is0), .s_setup(s_setup), .r_setup(r_setup));
    pass pass_sr(.x(set), .y(reset_tmp), .f(reset));
    
endmodule
