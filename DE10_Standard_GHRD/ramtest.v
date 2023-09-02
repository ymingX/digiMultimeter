module RAM_TEST (
    input clk,
    output reg [7:0] RAM_add,
    output          RAM_cs,
    output         RAM_clken,
    output reg        RAM_write,
    input  [7:0]   RAM_rdata,
    output reg[7:0]   RAM_wdata
);
assign RAM_clken=1'b1;
assign RAM_cs=1'b1;
reg [7:0]cnt;
reg [6:0]cnt2;
reg [20:0]clkcnt;
reg [7:0]rdata;
reg clk2;

    always @(posedge clk ) begin
        clkcnt<=clkcnt+1;
        clk2<=(clkcnt==0)?1:0;
    end

    always @(posedge clk2 ) begin
        cnt<=cnt+1;
        RAM_add<=cnt;
        if(cnt==0)cnt2<=cnt2+1;
        if(cnt<128)begin
            RAM_write<=1'b1;
            RAM_wdata<=cnt+cnt2;
        end
        else begin
            RAM_write<=1'b0;
            rdata<=RAM_rdata;
        end

    end

endmodule