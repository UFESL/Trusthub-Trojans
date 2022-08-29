The Trojan trigger is dependent on a rare branch within the receiver part of the micro-UART core. The Trojan is activated after the predefined branch (line 115 in the u_rec module) is taken three times and forces the rec_readyH output signal to be '0'.

<br />

## Contributed By

**Laura Chang**<br />
University of Florida

\-

**Aruna Jayasena**<br />
University of Florida