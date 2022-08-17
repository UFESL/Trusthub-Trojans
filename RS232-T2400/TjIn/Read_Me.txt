1. u_rec.v
----------------------
The Trojan trigger is dependent on a rare branch within the receiver part of the micro-UART core. The Trojan is activated after the predefined branch (line 115 in the u_rec module) is taken three times and forces the rec_readyH output signal to be '0'.

2. test_uart.v
----------------------
This file is the main test bench. It is self-checked. It feeds input data to the core and compares the correct result with the output of the core. If the output is wrong, the test bench will display an error message.

3. How to run
----------------------
Here are the commands to run this benchmark using VCS and IVERILOG:

VCS :
	vcs -c file_list.txt		// Compile to produce executable
	./simv						// Execute to generate VCD dump
	dve							// Signal visualization

------
IVERILOG:
	iverilog -c file_list.txt	// Compile to produce executable
	vvp a.out					// Execute to generate VCD dump
	gtkwave a.vcd				// Signal visualization
