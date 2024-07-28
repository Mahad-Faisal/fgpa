# **PID implementation on FGPA**
This project demonstrates the implementation of a PID (Proportional-Integral-Derivative) controller on an FPGA using SystemVerilog. The PID controller is designed to regulate a process variable to match a setpoint by adjusting control signals. This repository includes the design files, testbench, and waveform results to evaluate the performance of the PID controller.

## **Design Overview**

### PID controller (design.sv)
The PID controller consists of the following components:

Error Calculation: Computes the difference between the setpoint and the process variable.

Proportional Term: Multiplies the error by the proportional gain (Kp).

Integral Term: Accumulates the error over time and multiplies by the integral gain (Ki).

Derivative Term: Computes the rate of change of the error and multiplies by the derivative gain (Kd).

Control Output: Sum of the proportional, integral, and derivative terms, providing the final control signal.

### Testbench
The testbench.sv file simulates the PID controller's behavior by providing various setpoints and observing the process variable's response. The testbench includes:

Initialization of signals.

Application of test vectors.

Monitoring of output signals.

Generation of waveform data for analysis.

### Waveform Analysis
The waveform results can be visualized using GTKWave or any other VCD viewer. Key signals to observe:

clk: Clock signal.

reset: Reset signal for initialization.

setpoint: Desired setpoint for the process variable.

process_variable: Current value of the process variable.

error: Difference between setpoint and process variable.

P_term: Proportional term of the PID controller.

I_term: Integral term of the PID controller.

D_term: Derivative term of the PID controller.

PID_output: Combined output of the PID controller.

control_output: Final control signal to adjust the process variable.

## **Features**
Proportional Term (P): Provides an output proportional to the current error.

Integral Term (I): Sums the past errors to eliminate steady-state error.

Derivative Term (D): Reacts to the rate of change of the error, dampening oscillations.
