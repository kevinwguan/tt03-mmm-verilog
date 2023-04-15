module counter (input rst, clk, output reg [2:0] count);
   always @(posedge clk or posedge rst) begin
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
