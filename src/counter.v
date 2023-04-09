module counter (input rst, input clk, output reg [2:0] count);
   always @(posedge clk, rst) begin
      if (rst == 1)
          begin
              count <= 0;
          end
      else
          begin
              count <= count + 1;
          end
   end
endmodule

