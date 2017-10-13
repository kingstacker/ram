//************************************************
//  Filename      : ram.v                             
//  Author        : Kingstacker                  
//  Company       : School                       
//  Email         : kingstacker_work@163.com     
//  Device        : Altera cyclone4 ep4ce6f17c8  
//  Description   :  8bit*256 simple ram;                            
//************************************************
module  ram #( parameter DATA_WIDTH = 8,DEPTH = 256)(
    //input;
    input    wire    clk,
    input    wire    wren, //write high enable;
    input    wire    [clogb2(DEPTH)-1:0] address,
    input    wire    [DATA_WIDTH-1:0] data,
    //output;
    output   wire     [DATA_WIDTH-1:0] q     
);
function integer clogb2 (input integer depth);
begin
    for (clogb2=0; depth>1; clogb2=clogb2+1) 
        depth = depth >>1;                          
end
endfunction 
(* ramstyle = "M9K" *) reg [DATA_WIDTH-1:0] memory[0:DEPTH-1];
reg [clogb2(DEPTH)-1:0] address_reg;
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