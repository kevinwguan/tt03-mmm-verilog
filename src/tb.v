`default_nettype none
`timescale 1ns/1ps

/*
this testbench just instantiates the module and makes some convenient wires
that can be driven / tested by the cocotb test.py
*/

module tb (
    // testbench is controlled by test.py
    input rst,
    input sel,
    input ext_clk,
    input r_sens,
    input l_sens,
    input [2:0] dc,
    output clk_out,
    output dut_fsm_r,
    output dut_fsm_l,
    output pwm_r,
    output pwm_l,
    output [2:0] counter
   );

    // this part dumps the trace to a vcd file that can be viewed with GTKWave
    initial begin
        $dumpfile ("tb.vcd");
        $dumpvars (0, tb);
        #1;
    end

    // wire up the inputs and outputs
    wire [7:0] inputs = {rst, dc[2], dc[1], dc[0], sel, ext_clk, r_sens, l_sens};
    wire [7:0] outputs;
    assign clk_out = outputs[7];
    assign counter = outputs[6:4];
    assign dut_fsm_r = outputs[3];
    assign dut_fsm_l = outputs[2];
    assign pwm_r = outputs[1];
    assign pwm_l = outputs[0];

    // instantiate the DUT
    kevinwguan_tiny_tapeout kevinwguan_tiny_tapeout(
    //seven_segment_seconds seven_segment_seconds(
        `ifdef GL_TEST
            .vccd1( 1'b1),
            .vssd1( 1'b0),
        `endif
        .io_in  (inputs),
        .io_out (outputs)
        );

endmodule
