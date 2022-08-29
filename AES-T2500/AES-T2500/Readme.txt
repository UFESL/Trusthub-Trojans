1.Home directory includes:

1.1 src
	---Codes for the AES algorithm, the test bench, and the Trojan

2.Trojan
Trojan Description
    The Trojan trigger is a 4-bit synchronous counter inserted into the AES-128 block cipher. The counter is increased by 1 after each successive encryption and the Trojan is active when the fourth bit of the counter is high. When triggered, the Trojan attacks encryption by flipping the least significant bit of the existing encrypted output.

Trojan Taxonomy
	Insertion phase: Design
	Abstraction level: Register Transfer
	Activation mechanism: Time-Based
	Effects: Change Functionality
	Physical characteristics: Functional
