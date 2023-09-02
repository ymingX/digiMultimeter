`timescale 1 ps/ 1 ps
module f_measure (
    input clk,          //10M
	input rst_n, 
	input signal_in,
    //output reg freq_ctrl,
    output reg [25:0]freq,
    output reg clk_1k,
    output reg f_update
);

wire [25:0]M1;
wire [25:0]M2;
wire [25:0]M3;
wire [25:0]M4;
wire [25:0]M5;
wire [25:0]N1;
wire [25:0]N2;
wire [25:0]N3;
wire [25:0]N4;
wire [25:0]N5;
wire sig1;
wire sig2;
wire sig3;
wire sig4;
reg gate;
reg [25:0]cnt;//预置闸门计数器
reg [45:0]freq1;
reg [45:0]freq2;
reg [45:0]freq3;
reg [45:0]freq4;
reg [45:0]freq5;

//debounce_1  debounce_inst1 (
//  .clk            (clk),
//  .reset_n        (rst_n),  
//  .data_in        (signal_in),
//  .TIMEOUT        (25000),
//  .data_out       (sig1)
//);
//debounce_1  debounce_inst2 (
//  .clk            (clk),
//  .reset_n        (rst_n),  
//  .data_in        (signal_in),
//  .TIMEOUT        (1500),
//  .data_out       (sig2)
//);
debounce_1  debounce_inst3 (
  .clk            (clk),
  .reset_n        (rst_n),  
  .data_in        (signal_in),
  .TIMEOUT        (200),
  .data_out       (sig3)
);
debounce_1  debounce_inst4 (
  .clk            (clk),
  .reset_n        (rst_n),  
  .data_in        (signal_in),
  .TIMEOUT        (6),
  .data_out       (sig4)
);

    measure  measure_i1
(
    .clk(clk),          
    .rst_n(f_rstn),
    .sig_in(sig1),
    .gate(gate),
    .M(M1),              
    .N(N1),	
);
    measure  measure_i2
(
    .clk(clk),          
    .rst_n(f_rstn),
    .sig_in(sig2),
    .gate(gate),
    .M(M2),              
    .N(N2),	
);
    measure  measure_i3
(
    .clk(clk),          
    .rst_n(f_rstn),
    .sig_in(sig3),
    .gate(gate),
    .M(M3),              
    .N(N3),	
);
    measure  measure_i4
(
    .clk(clk),          
    .rst_n(f_rstn),
    .sig_in(sig4),
    .gate(gate),
    .M(M4),              
    .N(N4),	
);
    measure  measure_i5
(
    .clk(clk),          
    .rst_n(f_rstn),
    .sig_in(signal_in),
    .gate(gate),
    .M(M5),              
    .N(N5),	
);
reg f_rstn;
//reg update;

reg [13:0]clkcnt; 
always @(posedge clk ) begin
    clkcnt<=(clkcnt==9999)?0:clkcnt+1;
    clk_1k<=(clkcnt<5000)?0:1;
end

always @(posedge clk_1k or negedge rst_n) begin//开/关预置闸门
    if(!rst_n)begin cnt<=1;gate<=1; end
    else    begin
        cnt<=(cnt<10)?(cnt+1):0;
        gate<=(cnt>1&&cnt<4)?1'b1:1'b0;
        f_update<=(cnt==5)?1'b1:1'b0;
        f_rstn<=(cnt==8)?1'b0:1'b1;
    end
end

//always @(posedge gate ) begin
//    if (M1>N1*50000) begin
//        freq=N1*10000000/M1;
//    end else begin
//        if (M1>N1*5000) begin
//            freq=N2*10000000/M2;
//        end else begin
//            if (M1>N1*250) begin
//                freq=N3*10000000/M3;
//            end else begin
//                if (M1>N1*13) begin
//                    freq=N4*10000000/M4;
//                end else begin
//                    freq=N5*10000000/M5;
//                end
//            end
//        end
//    end
//end

always @(posedge f_update ) begin
//    freq1<=N1*10000000/M1;
//    freq2<=N2*10000000/M2;
    freq3<=N3*10000000/M3;
    freq4<=N4*10000000/M4;
    freq5<=N5*10000000/M5;

//    if(freq1>8&&freq1<180)
//        freq<=freq1;
//    else if (freq2>=180&&freq2<2000)
//        freq<=freq2;
//    else if (freq3>=2000&&freq3<17000)
    if (freq3>1000&&freq3<17000)
        freq<=freq3;
    else if ((freq4>=17000&&freq4<650000)&&freq5<650000)
        freq<=freq4-7;
    else freq<=freq5-10;
end

endmodule