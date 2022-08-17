1. aes_128.v
----------------------
The Trojan trigger is a 4-bit synchronous counter inserted into the AES-128 block cipher. The counter is increased by 1 after each successive encryption and the Trojan is active when the fourth bit of the counter is high. When triggered, the Trojan attacks encryption by flipping the least significant bit of the existing encrypted output.

2. test_aes_128.v
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
