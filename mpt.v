`define TESTVECS 7
module tb_up_down_counter;
  reg clk;
  reg reset;
  reg up;
  wire [2:0] count;

  // Define the test vectors
  reg [2:0] test_vecs [0:(`TESTVECS-1)];
  integer i;

  // Instantiate the up_down_counter
  up_down_counter uut (
    .clk(clk),
    .reset(reset),
    .up(up),
    .count(count)
  );

  // Generate clock signal
  always #10 clk = ~clk;

  initial begin
    $dumpfile("counter.vcd");
    $dumpvars(0, tb_up_down_counter);

    // Initialize clock
    clk = 0;

    // Define the test vectors (reset, up)
    test_vecs[0] = 3'b100;  // reset = 1, up = 0 (initialize with reset)
    test_vecs[1] = 3'b000;  // reset = 0, up = 0 (count down)
    test_vecs[2] = 3'b001;  // reset = 0, up = 1 (count up)
    test_vecs[3] = 3'b000;  // reset = 0, up = 0 (count down)
    test_vecs[4] = 3'b100;  // reset = 1, up = 0 (reset while counting down)
    test_vecs[5] = 3'b001;  // reset = 0, up = 1 (count up after reset)
    test_vecs[6] = 3'b000;  // reset = 0, up = 0 (count down)

    // Initialize reset and up values
    {reset, up} = 0;

    // Apply test vectors
    for (i = 0; i < `TESTVECS; i = i + 1) begin
      #20 {reset, up} = test_vecs[i];
    end

    // Finish simulation
    #20 $finish;
  end
endmodule