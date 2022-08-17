`timescale 1ns / 1ps

module test_uart;

	// Inputs
	reg clk;
	reg rst;
	reg xmitH;
	reg [7:0] xmit_dataH;
	reg uart_REC_dataH;

	// Outputs
	wire uart_XMIT_dataH;
	wire xmit_doneH;
	wire [7:0] rec_dataH;

	// Instantiate the Unit Under Test (UUT)
	uart uut (
		.sys_clk(clk),
		.sys_rst_l(rst),
		.xmitH(xmitH),
		.xmit_dataH(xmit_dataH),
		.uart_REC_dataH(uart_REC_dataH),
		.uart_XMIT_dataH(uart_XMIT_dataH),
		.xmit_doneH(xmit_doneH),
		.rec_dataH(rec_dataH),
		.rec_readyH(rec_readyH)
	);

	initial begin
		$dumpfile("a.vcd");
		$dumpvars(0, test_uart);

		clk = 0;
		rst = 0;

		#100;

	@(negedge clk);
	# 2;
	xmitH = 1;
	xmit_dataH = 0;
	uart_REC_dataH = 1;
	rst = 1;

	#10;
	uart_REC_dataH = 0; // start bit
	// First data sequence will be 11000001, read LSB first
	#160; // 16 x baud rate * 10 ns per clk cycle
	uart_REC_dataH = 1;
	#160;
	uart_REC_dataH = 1;
	#160;
	uart_REC_dataH = 0;
	#160;
	uart_REC_dataH = 0;
	#160;
	uart_REC_dataH = 0;
	#160;
	uart_REC_dataH = 0;
	#160;
	uart_REC_dataH = 0;
	#160;
	uart_REC_dataH = 1;
	#160;
	uart_REC_dataH = 1; // stop bit

	#160;
	if (~rec_readyH)
		begin $display("E"); $finish; end

	uart_REC_dataH = 0; // start bit
	// Data sequence: 10010111
	#160;
	uart_REC_dataH = 1;
	#160;
	uart_REC_dataH = 0;
	#160;
	uart_REC_dataH = 0;
	#160;
	uart_REC_dataH = 1;
	#160;
	uart_REC_dataH = 0;
	#160;
	uart_REC_dataH = 1;
	#160;
	uart_REC_dataH = 1;
	#160;
	uart_REC_dataH = 1;
	#160;
	uart_REC_dataH = 1; // stop bit

	#160;
	if (~rec_readyH)
		begin $display("E"); $finish; end

	uart_REC_dataH = 0; // start bit
	#20;
	uart_REC_dataH = 1; // invalidate the start bit

	#140;
	uart_REC_dataH = 0; // start bit
	// Data sequence: 11111111
	#160;
	uart_REC_dataH = 1;
	#1280;
	uart_REC_dataH = 1; // stop bit

	#160
	if (~rec_readyH)
		begin $display("E"); $finish; end

	uart_REC_dataH = 0; // start bit
	#20;
	uart_REC_dataH = 1; // invalidate the start bit
	#140;
	uart_REC_dataH = 0; // start bit
	#20;
	uart_REC_dataH = 1; // invalidate the start bit

	#140;
	uart_REC_dataH = 0; // start bit
	// Data sequence: 00000000
	#160;
	uart_REC_dataH = 0;
	#1280;
	uart_REC_dataH = 1; // stop bit

	#160
	if (~rec_readyH)
		begin $display("E"); $finish; end

	#100;
	$display("Good.");
	$finish;
	end

	always #5 clk = ~clk;
endmodule