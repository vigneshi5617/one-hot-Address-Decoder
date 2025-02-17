
/********************************************************************************************


Webpage: https://github.com/vigneshi5617

Filename:	decoder.v   

Description: "one-hot" decoder - only one outpur line is active at a time

Date:		01/06/2023

Author:		Vignesh Anand

Email:		vigneshanand16064@gmail.com
		 

Version:	1.0

*********************************************************************************************/
module addressDecoder(
  input wire[1:0] address,
  input wire enable,
  output reg [3:0] line
);
  always @* begin
    if (!enable) begin
      line = 4'bx; // "don't care" when enable is 0
    end else begin
      case(address)
        2'b00: line = 4'b0001;
        2'b01: line = 4'b0010;
        2'b10: line = 4'b0100;
        2'b11: line = 4'b1000;
        default: line = 4'bx; // "don't care" for unexpected address values
      endcase
    end
  end
endmodule