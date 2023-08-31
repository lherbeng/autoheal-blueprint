# ***Memory Usage:***

Formula: node_memory_MemTotal_bytes - node_memory_MemFree_bytes - node_memory_Buffers_bytes - node_memory_Cached_bytes

***Explanation:***

This calculates the total memory in use by subtracting the free memory (MemFree), memory used for buffers (Buffers), and memory used for caching (Cached) from the total available memory (MemTotal). In Linux systems, some memory is reserved for buffering and caching data, so this metric provides a more accurate view of actual memory usage.
