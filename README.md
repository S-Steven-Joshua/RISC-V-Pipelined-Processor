# RISC-V-Pipelined-Processor
This repository contains my implementation of a RISC-V 5-stage pipelined processor, built step by step to support different instruction types and pipeline features..
📌 Features

# 5-Stage Pipeline

Instruction Fetch (IF)

Instruction Decode (ID)

Execute (EX)

Memory (MEM)

Write Back (WB)

# Instruction Support
Load/Store (LW, SW)

R-Type Instructions (ADD, SUB, AND, OR, etc.)

Branch Equal (BEQ)

# Hazard Handling
Forwarding Unit – resolves data hazards by forwarding results from EX/MEM and MEM/WB stages.

Branch Handling – flushes pipeline on taken BEQ to prevent wrong instruction execution.

# Key Components
Instruction Memory

Register File

Immediate Generator

Control Unit

ALU (64-bit)
Data Memory
Pipeline Registers (IF/ID, ID/EX, EX/MEM, MEM/WB)
Forwarding Unit + Branch Unit
