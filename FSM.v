//sequence detect 1101(non overlaping)
module FSM(out,in,rst,clk);
input in,rst,clk;
output reg out;

reg [1:0] state;

always @(posedge clk,posedge rst)
begin 
if (rst)begin
state <=2'b00;
end

else begin
case(state)

2'b00 :
begin
if (in) state<=2'b01;
else state<=2'b00;
end

2'b01 : 
begin
if (in) state<=2'b10;
else state<=2'b00;
end

2'b10 : 
begin
if (in) state<=2'b10;
else state<=2'b11;
end

2'b11 :
begin
if (in) state<=2'b00;
else state<=2'b00;
end

default : begin
state <= 2'b00;
out<=0;
end

endcase
end
end

always @(posedge clk,posedge rst)
begin 
if (rst)
out<=0;
else if (state==2'b11)
out<=1;
else 
out<=0;
end

endmodule

module FSM_tb();
reg in,rst,clk;
wire out;

FSM dut(.out(out),.in(in),.rst(rst),.clk(clk));

initial begin
clk=1'b0;
rst=1'b1;
#15 rst=1'b0;
end

initial begin
forever #5 clk=~clk;
end

always begin
#15 in = 0;
#10 in =1;#10 in =1;#10 in =0;#10 in =1;#10 in =1;#10 in =1;#10 in =0;#10 in =1;
#20 $finish;
end

	endmodule




