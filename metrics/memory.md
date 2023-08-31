# ***Memory Usage:***

Formula: 

node_memory_MemTotal_bytes - node_memory_MemFree_bytes - node_memory_Buffers_bytes - node_memory_Cached_bytes

***Explanation:***

This calculates the total memory in use by subtracting the free memory (MemFree), memory used for buffers (Buffers), and memory used for caching (Cached) from the total available memory (MemTotal). In Linux systems, some memory is reserved for buffering and caching data, so this metric provides a more accurate view of actual memory usage.


# Swap Usage:

Formula: 

node_memory_SwapTotal_bytes - node_memory_SwapFree_bytes

***Explanation:***

Explanation: This metric calculates the swap space usage by subtracting the free swap space (SwapFree) from the total swap space available (SwapTotal). Swap space is used when the system's physical memory (RAM) is exhausted. Monitoring swap usage helps you identify situations where excessive swapping might be impacting system performance.
