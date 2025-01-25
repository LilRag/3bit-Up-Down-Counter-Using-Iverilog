# 3bit-Up-Down-Counter-Using-Iverilog
## Overview

This project involves designing and implementing a 3-bit Up/Down Counter using Verilog. The counter leverages T Flip-Flops to increment or decrement its value based on a control signal, providing a practical demonstration of sequential logic and design in digital systems.

## Features

3-bit Counter: Counts values from 0 to 7 in up mode and from 7 to 0 in down mode.

Direction Control: Controlled via an up signal.

Synchronous Design: Operates on the rising edge of a clock signal.

Reset Functionality: Supports an asynchronous reset to set the counter to zero.

## Components

T Flip-Flops: Used as the building blocks for the counter.

Clock Signal: Drives the counter operation.

Up Control: A signal to toggle between incrementing and decrementing.

Reset: Resets the counter to zero regardless of its current state.

## Design Details

Inputs:

clk: Clock signal.

reset: Asynchronous reset signal.

up: Control signal (1 for up, 0 for down).

Output:

count: 3-bit output representing the current counter value.

### Functionality

Reset:

When reset is active, the counter is set to 0.

Counting:

If up = 1: The counter increments on each clock cycle.

If up = 0: The counter decrements on each clock cycle.

Overflow/Underflow Handling:

Automatically wraps around (e.g., 7 increments to 0, 0 decrements to 7).

## Implementation

The counter uses T Flip-Flops with specific toggling logic:

T0: Always toggles on every clock cycle.

T1: Toggles based on the up signal and the state of Q0.

T2: Toggles based on the up signal and the states of Q0 and Q1.

This modular approach simplifies the design and enhances scalability.

## Usage

Simulation

Write a testbench to validate the counter’s behavior.

Simulate the design using Icarus Verilog (iverilog) and visualize the waveforms in GTKWave.

## Tools and Technologies

Language: Verilog HDL (Tested with Icarus Verilog)

Simulation Tools: Icarus Verilog, GTKWave


## Learning Outcomes

Understand synchronous counter design using T Flip-Flops.

Learn how to implement up/down control logic.

Use Icarus Verilog and GTKWave to simulate and analyze digital designs.

## License

This project is open-source and available under the MIT License.
