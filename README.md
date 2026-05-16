# Cache-Memory-design-using-Verilog-HDL
This project focuses on improving cache memory performance by analyzing and comparing the execution efficiency of Direct-Mapped Cache and 2-Way Set Associative Cache architectures. The study investigates cache hit ratio, miss ratio, access latency, and execution time while implementing optimization techniques such as Victim Cache, LRU (Least Recently Used) replacement policy, and memory banking methods.

The project demonstrates how optimized cache organization can significantly reduce memory access time and improve overall processor performance. Simulations and waveform verification were performed using ModelSim.

Introduction

Cache memory plays a critical role in enhancing computer system performance by reducing the average memory access time between the CPU and main memory. Since cache memory operates at a much higher speed than RAM, frequently accessed data and instructions are temporarily stored in the cache to minimize execution delays.

**This project explores:**

Direct Mapping Cache

2-Way Set Associative 

Cache Miss Reduction Techniques

Cache Access Optimization

Memory Banking Techniques

**The goal  is to improve:**

Hit Ratio

Cache Efficiency

Execution Speed

Memory Access Time

**Technologies Used:**

Verilog HDL

ModelSim Simulator

Digital Design Concepts

Cache Memory Architecture

**Cache Mapping Techniques**

1. **Direct Mapping**

Direct mapping assigns each block of main memory to a fixed cache location.

Features

Simple implementation

Faster cache lookup

Lower hardware complexity

**Limitations**

Higher conflict misses

Reduced flexibility

2. **2-Way Set Associative Mapping**

This method combines features of direct and associative mapping. Each set contains multiple cache lines, allowing blocks to be placed in different locations within the set.

**Features**

Improved hit ratio

Reduced conflict misses

Better cache utilization

LRU Replacement Policy

The Least Recently Used (LRU) algorithm is implemented to replace the least accessed cache block during cache updates.

**Proposed Architecture**

Step 1: Victim Cache Implementation

A victim cache is introduced to reduce conflict misses in direct mapping.

Advantages

Minimizes cache miss penalties

Stores recently evicted blocks

Improves hit performance

Step 2: Reducing Cache Miss Penalty

Large memory blocks increase miss penalties. To overcome this:

Blocks are divided into smaller sub-blocksEach sub-block contains separate validity information ,only required sub-blocks are transferred

**Benefits**

Faster data transfer

Reduced memory overhead

Improved cache efficiency

Step 3: Memory Banking Technique

Memory is divided into multiple banks to support parallel data access and reduce memory access delay.

**Benefits**

Increased throughput

Reduced bank cycle delays

Faster cache-memory communication

Project Objectives

Compare Direct Mapping and 2-Way Set Associative Mapping

Improve cache hit ratio

Reduce conflict and compulsory misses

Analyze memory access time

Verify cache operation using simulation waveforms

Simulation and Verification

**Tools Used**

ModelSim Simulator

Parameters Analyzed

Hit Ratio

Miss Ratio

Cache Access Time

Execution Cycles

Memory Latency

Verification

**Waveforms generated through ModelSim verify:**

Cache loading process

Main memory access

Cache hit/miss conditions

Set associative mapping operation
