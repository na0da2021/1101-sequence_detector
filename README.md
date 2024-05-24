# Finite State Machine (FSM) Implementation for "1101"-Sequence Detection

This repository contains Verilog code for both **Mealy** and **Moore** finite state machines (FSMs) that detect the sequence "1101". These FSMs are commonly used in digital design and sequential circuitry.

## Table of Contents

1. Introduction
2. Differences between Moore & Mealy
3. Installation
4. Usage
5. Simulation
6. Contributing
7. About the Author

## Introduction

Finite state machines are essential components in digital systems. They model sequential behavior and are widely used in applications such as control units, communication protocols, and data processing.

## Differences between Moore & Mealy

• **Moore:** simpler to implement as the outputs are dependent only on the present state of the machine.

• **Mealy:** the state of the inputs as well as the machine state are both considered to the state of the outputs.

• The tradeoff is that you may need fewer states with a Mealy machine to represent all desired output conditions, but it may be harder to build and debug than an equivalent Moore machine which uses more states to account for different output possibilities.

• The Mealy machine may change its outputs asynchronously to the clock if its inputs change while in a given state, which may not be desirable, while Moore changes both its state and its outputs only in response to the clock edge.

## Installation
1. Clone this repository to your local machine:

   git clone https://github.com/na0da2021/1101-detection-fsm-.git

2. Navigate to the cloned directory and explore the Verilog source files.

## Usage
1. Include any of the `fsm.v` files in your Verilog project.
2. Instantiate the `fsm.v` module, connecting the inputs (`in`, `rst`, `clk`) and output (`f`).

## Simulation
1. Run the provided testbenchs using your preferred Verilog simulation tool (e.g., ModelSim) to verify the functionality of the sequence detector.

## Contributing
Contributions to enhance the fsm or extend its functionality are welcome. Fork the repository, make your changes, and submit a pull request for review.

## About The Author

- **Author**: Nada Omar
- **Email**: na0da2021@gmail.com
- **Education**: Electronics and Communication Department
- **College**: Faculty of Engineering, Alexandria University, Egypt
