1.Please change all the paths used in the files according to your computer.

2.User can get his own stildpv libary by installing VCS software.

3.Home directory includes:
 3.1 src
 ---inc.h: Includes parameters definition.
 ---uart*: Source code
 3.2 Spec.doc
 ---Specification
 3.3 RS232-T2400.pdf
 ---Evaluation results


4.Trojan 
  Trojan Description
	The Trojan trigger is a state machine within the receiver part of the micro-UART core. The Trojan is activated at a predefined state transition (r_WAIT to r_STOP in the u_rec module) and forces the rec_readyH output signal to be '0'.

  Trojan Taxonomy
	Insertion phase: Design
	Abstraction level: Register-transfer level (RTL)
	Activation mechanism: Physical-condition-based
	Effects: Denial of service
	Physical characteristics: Functional 
