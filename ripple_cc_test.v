/* 
 * P. Heinonen 2015
 *
 * compiler: 
 * Icarus Verilog 0.9.7
 * with GTKWave
 *
 * Four-bit binary Ripple Counter testbench
 */


module test;
  
  reg clk, reset;
  wire [3:0] q;
  
  // instantiate design
  ripple_carry_counter rcc(q, clk, reset);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, test);
  end
  
  // free running clock
  always #5 clk = ~clk;
  
  initial begin
    clk = 1'b0;
    reset = 1'b1;
    #10 reset = 1'b0;
    
    #200;
    reset = 1'b1;
    #10 reset = 1'b0;
    
    #50;
    $finish;
    
  end
  
endmodule
