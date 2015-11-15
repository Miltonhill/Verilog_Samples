/* 
 * P. Heinonen 2015
 *
 * compiler: 
 * Icarus Verilog 0.9.7
 * with GTKWave
 *
 */


/* 
 * T flip flop
 * digital counter up to 2^n where 
 * n is the number of flip flops.
 */

module tff(
  output reg q,
  input clk,
  input reset);
  
  always @(posedge reset or negedge clk) begin
    if(reset) begin
      q <= 1'b0;
    end else begin
      q <= ~q;
    end
  end
endmodule


/*
 * Four-bit binary Ripple Counter
 * Chaining four tff together
 * Applications
 * -Frequency dividing circuits
 * -Time delay circuits
 * -Control counters
 * Same model like MC74HC393A
 */
module ripple_carry_counter(
  output [3:0] q,
  input clk,
  input reset);
  
  // Gates in each flip flop creates propagation delays
  // this is called "clock ripple".
  // in each falling clk edge the clk negation is passed to next tff 
  tff tff0(q[0], clk, reset);
  tff tff1(q[1], q[0], reset);
  tff tff2(q[2], q[1], reset);
  tff tff3(q[3], q[2], reset);
  
endmodule
