# Hardware Description Language Codes
Here are all my VHDL codes developed for FPGA projects. I worked with two different FPGAs during this course:
- Tang Nano 1k 
- Mimas Spartan 6

The most important difference between them is their clock frequencies. The Tang Nano has a 27 MHz clock, while the Spartan operates at 100 MHz. This difference was critical to consider when designing state machines. The following codes need to be changed in case of a different clock frequency

## Arithmetic Codes

This repository contains VHDL implementations and testbenches for fundamental arithmetic circuits.
##  Description

This practice focuses on designing and simulating three essential arithmetic circuits using **VHDL**:

1. **Full Adder** -
2. **Carry-Skip Adder** –
3. **Multiplier** – 

Each module includes:
- **VHDL code** for implementation.
- **Testbench** for simulation.
- **Report** for documentation

## Seq-Comb Codes 
### Clock Frequency Adjustment
The following codes need modifications if a different clock frequency is used:
- 4 Keyboard Matrix with Buzzer
- 5 Song in a Buzzer (Rick Roll)
For these, I developed a Python script to adjust the clock frequency. This adjustment is essential to correctly set the note durations for sound generation.

Additionally, the following codes require compliance with the timing cycles specified in the datasheet of the MAX7219/MAX7221:
- 6 Led Matrix TEST MODE
- 7 Led Matrix "D"
- 8 Led Matrix Animation (Bomb)
- 8 Led Matrix Animation (Dance)
In those practices we need to cumply with the time cycle established by the datasheet of MAX7219/MAX7221

### Index
#### Second Semester
- D 7-Segment Display with dip switch
- E 7-Segment Display with clock 
#### Third Semester
- 1 Fliplop
- 2 Keyboard Matrix
- 3 Passive Buzzer
- 4 Keyboard Matrix with Buzzer
- 5 Song in a Buzzer (Rick Roll)
- 6 Led Matrix TEST MODE
- 7 Led Matrix "D"
- 8 Led Matrix Animation (Bomb)
- 8 Led Matrix Animation (Dance)
