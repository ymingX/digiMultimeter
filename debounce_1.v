//Legal Notice: (C)2013 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

module debounce_1 (
  input clk,
  input reset_n,
  input data_in,
  input [15:0]TIMEOUT,
  output reg data_out
);

  //parameter TIMEOUT = 50000;      // number of input clock cycles the input signal needs to be in the active state
  parameter POLARITY = "HIGH";    // set to be "HIGH" for active high debounce or "LOW" for active low debounce
  parameter TIMEOUT_WIDTH = 16;   // set to be ceil(log2(TIMEOUT))
  

  
  
  reg [TIMEOUT_WIDTH-1:0] counter ;
  reg counter_reset_n ;
  reg counter_enable ;
  
  // need one counter per input to debounce
    always @ (posedge clk or negedge rst_n)
    begin
      if (rst_n == 0)
      begin
        counter <= 0;
      end
      else
      begin

        if (counter_enable == 1)
        begin
          counter <= counter + 1'b1;
        end
      end

       
    end
 wire rst_n;
   assign rst_n=reset_n&&counter_reset_n;
    always @(*) begin
      if (POLARITY == "HIGH")
    begin
       counter_reset_n = (data_in == 0)?1'b0:1'b1;
       counter_enable = (data_in == 1) & (counter < TIMEOUT);
       data_out = (counter == TIMEOUT) ? 1'b1 : 1'b0;
    end
    else
    begin
       counter_reset_n = (data_in == 1);
       counter_enable = (data_in == 0) & (counter < TIMEOUT);
       data_out = (counter == TIMEOUT) ? 1'b0 : 1'b1;    
    end

    end

  
endmodule
