`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.07.2025 12:19:13
// Design Name: 
// Module Name: tb_pipe_MIPS32
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module tb_pipe_MIPS32;
    reg clk1, clk2;
    integer k;

    // Instantiate the processor
    pipe_MIPS32 mips(clk1, clk2);

    // Clock Generation
    initial begin
        clk1 = 0; clk2 = 0;
        forever begin
            #5 clk1 = 1; #5 clk1 = 0;
            #5 clk2 = 1; #5 clk2 = 0;
        end
    end

    // Initialize memory and registers
    initial begin
        // Set all registers to 0
        for (k = 0; k < 32; k = k + 1)
            mips.Reg[k] = 0;

        // Load instructions into memory
        mips.Mem[0] = 32'h2801000a; // ADDI R1, R0, 10
        mips.Mem[1] = 32'h28020014; // ADDI R2, R0, 20
        mips.Mem[2] = 32'h28030019; // ADDI R3, R0, 25
        mips.Mem[3] = 32'h0ce77800; // NOP (dummy OR instruction)
        mips.Mem[4] = 32'h0ce77800; // NOP (dummy OR instruction)
        mips.Mem[5] = 32'h00222000; // ADD R4, R1, R2
        mips.Mem[6] = 32'h0ce77800; // NOP (dummy OR instruction)
        mips.Mem[7] = 32'h00832800; // ADD R5, R4, R3
        mips.Mem[8] = 32'hfc000000; // HALT

        // Initial processor state
        mips.HALTED = 0;
        mips.PC = 0;
        mips.TAKEN_BRANCH = 0;
    end

    // Continuous monitoring
    initial begin
        $monitor("Time: %d | PC: %d | R1: %d | R2: %d | R3: %d | R4: %d | R5: %d | HALTED: %b",
                  $time, mips.PC, mips.Reg[1], mips.Reg[2], mips.Reg[3], mips.Reg[4], mips.Reg[5], mips.HALTED);
    end

    // Dump waveform
    initial begin
        $dumpfile("mips.vcd");
        $dumpvars(0, tb_pipe_MIPS32);
        #2000; // Run long enough for full execution
        $finish;
    end

endmodule

