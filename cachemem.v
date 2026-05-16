module cachemem(
  input clk,
  input rst,
  input [10:0] memory_address,
  input read_enable,
  input write_enable,
  output reg [7:0] memory_data_out
);

// Parameters
parameter CACHE_SIZE = 16; // Reduced cache size to 16 lines
parameter CACHE_BLOCK_SIZE = 4; // Number of words per cache line
parameter CACHE_WORD_SIZE = 8; // Size of each word in the cache
parameter MAIN_MEMORY_SIZE = 64; // Number of lines in main memory
parameter MAIN_MEMORY_BLOCK_SIZE = 4; // Number of words per main memory line
parameter MAIN_MEMORY_WORD_SIZE = 8; // Size of each word in main memory

// Data structures
reg [7:0] cache_tags [0:CACHE_SIZE-1]; 
reg [CACHE_WORD_SIZE-1:0] cache_data [0:CACHE_SIZE-1][0:CACHE_BLOCK_SIZE-1]; // Cache data
reg [MAIN_MEMORY_WORD_SIZE-1:0] main_memory_data [0:MAIN_MEMORY_SIZE-1][0:MAIN_MEMORY_BLOCK_SIZE-1]; // Main memory data
reg [0:0] valid_bit [0:CACHE_SIZE-1];

// Internal signals
reg [4:0] tag;
reg [3:0] index;
reg [1:0] offset;
reg [7:0] data_out;

// Cache control logic
// Cache control logic
always @(posedge clk or posedge rst) begin
  if (rst) begin
    tag = memory_address[10:6]; 
    index = memory_address[5:2]; 
    offset = memory_address[1:0];

    // Reset cache content to 0
    for (index = 0; index < CACHE_SIZE; index = index + 1) begin
      cache_tags[index] <= 8'b0; // Reset cache tags to all zeros
      valid_bit[index] <= 1'b0;  // Reset valid bit to 0
      for (offset = 0; offset < CACHE_BLOCK_SIZE; offset = offset + 1) begin
        cache_data[index][offset] <= {CACHE_WORD_SIZE{8'b0}}; // Reset cache data to all zeros
      end
    end
  end else if (read_enable | write_enable) begin
    // Cache operation logic
    if (valid_bit[index] == 1 && cache_tags[index] == tag) begin
      data_out = cache_data[index][offset];
    end else begin
      data_out = {MAIN_MEMORY_WORD_SIZE{8'bX}}; // Default data for cache miss
      for (offset = 0; offset < MAIN_MEMORY_BLOCK_SIZE; offset = offset + 1) begin
        cache_data[index][offset] <= main_memory_data[index][offset];
      end
      cache_tags[index] = tag;
      valid_bit[index] = 1'b1;
    end
  end
end


// Interface with main memory
always @(*) begin
  memory_data_out = main_memory_data[tag][offset];
end

endmodule