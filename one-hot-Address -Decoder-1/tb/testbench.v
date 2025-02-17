/********************************************************************************************


Webpage: https://github.com/vigneshi5617

Filename:	testbench.v   

Description: "one-hot" decoder - only one outpur line is active at a time

Date:		01/06/2023

Author:		Vignesh Anand

Email:		vigneshanand16064@gmail.com
		 

Version:	1.0

*********************************************************************************************/

module tb_top();

reg [1:0] address;
wire [3:0] line ;
reg enable;



initial 
begin
  enable = 1; address = 2'b00;
  #10 enable = 0;
  #10 enable = 1;
  #10 address = 2'b00;
  #10 if(enable) $display("Test 1 OK");
  else $display("Test 1 Error");

  address = 2'b01;
  #10 if(enable) $display("Test 2 OK");
  else $display("Test 2 Error");

  address = 2'b10;
  #10 if(enable) $display("Test 3 OK");
  else $display("Test 3 Error");

  address = 2'b11;
  #10 if(enable) $display("Test 4 OK");
  else $display("Test 4 Error");

end


// Instantiate the DUT (Device Under Test)
adressDecoder DUT1(.address(address),.line(line),.enable(enable));




initial $monitor("Input address = %b, enable = %b , Output line = %b",address,enable,line);
initial #100 $finish;

endmodule