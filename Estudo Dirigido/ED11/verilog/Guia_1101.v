
`define found 1
`define notfound 0

module guia_1101 (y, x, clk, reset);
  output reg y;
  input x;
  input clk;
  input reset;
  parameter start   = 3'b000,
            id1     = 3'b001,
            id10    = 3'b010,
            id101   = 3'b011,
            id1010  = 3'b100,
            done    = 3'b101;

  reg [2:0] E1; 
  reg [2:0] E2; 


  always @(x or E1) begin
    y = `notfound;
    case (E1)
      start:
        if (x)
          E2 = id1;
        else
          E2 = start;

      id1:
        if (!x)
          E2 = id10;
        else
          E2 = id1;

      id10:
        if (x)
          E2 = id101;
        else
          E2 = start;

      id101:
        if (!x)
          E2 = id1010;
        else
          E2 = id1;

      id1010: begin
        y = `found;
        E2 = done; // FSM trava
      end

      done: begin
        y = `found;
        E2 = done;
      end

      default: E2 = start;
    endcase
  end

  always @(posedge clk or negedge reset) begin
    if (!reset)
      E1 <= start;
    else
      E1 <= E2;
  end
endmodule

module test_guia_1101;
  reg clk, reset, x;
  wire y;
  guia_1101 fsm (y, x, clk, reset);
  always #5 clk = ~clk;
  initial begin
    $display("Time\tX\tY");
    $dumpfile("Guia_1101.vcd");
    $dumpvars(0, test_guia_1101);

    clk = 0;
    reset = 0;
    x = 0;
    #3 reset = 1;
    #10 x = 1; 
    #10 x = 0;  
    #10 x = 1;  
    #10 x = 0;   
    #10 x = 1;   
    #10 x = 0;
    #10 x = 1;
    #10 x = 0;  

    #30 $finish;
  end
  always @(posedge clk)
    $display("%4d\t%b\t%b", $time, x, y);
endmodule
