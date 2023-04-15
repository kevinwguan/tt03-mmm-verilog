module sr_latch (input s, input r, output q);

  reg Q_reg;
  //reg Qn_reg;

  always @(S, R) begin
    if (S && ~R) begin
      Q_reg <= 1'b1;
      //Qn_reg <= 1'b0;
    end else if (R && ~S) begin
      Q_reg <= 1'b0;
      //Qn_reg <= 1'b1;
    end else begin
      Q_reg <= Q_reg;
      //Qn_reg <= Qn_reg;
    end
  end

  assign Q = Q_reg;
  //assign Qn = Qn_reg;

endmodule


