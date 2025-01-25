module t_flip_flop (
  input t, clk, reset,
  output reg q
);
  always @(posedge clk or posedge reset) begin
    if (reset)
      q <= 0;
    else if (t)
      q <= ~q;
  end
endmodule

module up_down_counter (
  input clk, reset, up,
  output [2:0] count
);
  wire t0, t1, t2;
  wire q0, q1, q2;

  // T flip-flop logic for the counter
  assign t0 = 1;  // LSB toggles on every clock cycle
  assign t1 = (up) ? q0 : ~q0;  // Middle bit toggle logic based on up/down
  assign t2 = (up) ? (q0 & q1) : (~q0 & ~q1);  // MSB toggle logic based on up/down

  // Instantiate T flip-flops
  t_flip_flop ff0 (.t(t0), .clk(clk), .reset(reset), .q(q0));
  t_flip_flop ff1 (.t(t1), .clk(clk), .reset(reset), .q(q1));
  t_flip_flop ff2 (.t(t2), .clk(clk), .reset(reset), .q(q2));

  // Combine flip-flop outputs for the 3-bit count output
  assign count = {q2, q1, q0};
endmodule