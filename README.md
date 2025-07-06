# MIPS32 Pipelined Processor (Verilog)

This project implements a 5-stage pipelined MIPS32 processor in Verilog using Xilinx Vivado. 

## Files:
- `pipe_MIPS32.v` : Main processor code
- `tb_pipe_MIPS32.v` : Testbench
- `tb_pipe_MIPS32_behav.wcfg` : Waveform configuration file

## Features:
- 5-stage pipeline: IF, ID, EX, MEM, WB
- Basic instruction support: ADD, SUB, AND, OR, LW, SW, BEQZ, BNEQZ, HLT
- Two-phase clock

## Simulation:
Waveforms and register values can be observed in Vivado simulation.

## Author:
EDWIN JAMES

