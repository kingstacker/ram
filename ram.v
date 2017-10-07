//************************************************
//  Filename      : ram.v                             
//  Author        : Kingstacker                  
//  Company       : School                       
//  Email         : kingstacker_work@163.com     
//  Device        : Altera cyclone4 ep4ce6f17c8  
//  Description   :  8bit*256 ram                            
//************************************************
module  ram #( parameter DATA_WIDTH = 8,DEPTH = 256,ADDR_WIDTH = 8)(
    //input;
    input    wire    clk,
    input    wire    wren, //write high enable;
    input    wire    [ADDR_WIDTH-1:0] address,
    input    wire    [DATA_WIDTH-1:0] data,
    //output;
    output   wire     [DATA_WIDTH-1:0] q     
);
reg [DATA_WIDTH-1:0] memory[0:DEPTH-1];
reg [ADDR_WIDTH-1:0] address_reg;
//read;
always @(posedge clk ) begin
    address_reg <= address;
end //always
assign q = memory[address_reg];
//write;
always @(posedge clk ) begin
    if(wren) begin
        memory[address] <= data;
    end
end //always

endmodule