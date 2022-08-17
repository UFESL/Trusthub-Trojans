1. aes_128.v
----------------------
The Trojan trigger is dependent on a 4-bit asynchronous counter, which is in turn contingent on a 4-bit synchronous counter (both inserted into the AES-128 block cipher). After each successive encryption, the synchronous counter is increased by 1. The asynchronous counter is also incremented if the following conditions are fulfilled:
	1. The fourth bit of the synchronous counter is high, and 
	2. Two predefined signals (s5[113] and s7[127]) within the aes_128 module are active.
The Trojan is active when the fourth bit of the asynchronous counter is high. When triggered, the Trojan attacks encryption by flipping the least significant bit of the existing encrypted output.

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
