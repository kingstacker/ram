//************************************************
//  Filename      : ram_tb.v                             
//  Author        : Kingstacker                  
//  Company       : School                       
//  Email         : kingstacker_work@163.com     
//  Device        : Altera cyclone4 ep4ce6f17c8  
//  Description   :                              
//************************************************
`timescale 1ns/1ns
module ram_tb ();
parameter CYCLE = 4;
parameter ADDR_WIDTH = 8;
parameter DATA_WIDTH = 8;
//input;
reg clk;
reg wren;
reg [ADDR_WIDTH-1:0] address;
reg [DATA_WIDTH-1:0] data;
//output;
wire [DATA_WIDTH-1:0] q;

//inst;
ram  tb_u1(
    .clk                (clk),
    .wren              (wren),
    .address          (address),
    .data             (data),
    .q                (q)
);
//clk produce;
initial begin
    clk = 1'b0;
end
always #(CYCLE/2) clk = ~ clk;
//rst_n ;
initial begin
                    wren = 1'b0;address = 8'd0;data = 0;
    #(CYCLE*4)      wren = 1'b1;address = 8'd0;data = 8'hab;
    #(CYCLE*4)      wren = 1'b1;address = 8'd1;data = 8'hbb;
    #(CYCLE*4)      wren = 1'b1;address = 8'd2;data = 8'hcc;
    #(CYCLE*4)      wren = 1'b0;address = 8'd0;
    #(CYCLE*4)      wren = 1'b0;address = 8'd1;
    #(CYCLE*4)      wren = 1'b0;address = 8'd2;

end

endmodule