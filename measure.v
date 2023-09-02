`timescale 1 ps/ 1 ps
module measure (
    input clk,      input rst_n,
    input sig_in,
    output reg gate_out,    input gate,
    output reg[25:0]M,      output reg[25:0]N
);
reg [25:0]cntclk;reg [25:0]cntsig;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin cntclk<=0;M<=1; end
    else begin
        if(gate_out)cntclk<=cntclk+1;
        else begin 
            cntclk<=0;
            M<=cntclk?cntclk:M;
        end
    end
end
always @(posedge sig_in or negedge rst_n) begin
    if(!rst_n)begin gate_out<=0; end
    else begin
    if (gate) gate_out<=1;
    else  gate_out<=0;
   end
end

always @(posedge sig_in or negedge rst_n) begin
   if(!rst_n)begin cntsig<=0;N<=0; end
   else begin
      if(gate)cntsig<=cntsig+1;//if gate_out 会多计1
      else begin  
        cntsig<=0;
        N<=cntsig?cntsig:N;
      end
   end
end
    

/*
always@(posedge clk)
begin
      frec<=50_000_000*M/N;
end*/
endmodule