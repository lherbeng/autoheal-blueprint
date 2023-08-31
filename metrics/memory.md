# ***Memory Usage:***

Formula: 

node_memory_MemTotal_bytes - node_memory_MemFree_bytes - node_memory_Buffers_bytes - node_memory_Cached_bytes

***Explanation:***

This calculates the total memory in use by subtracting the free memory (MemFree), memory used for buffers (Buffers), and memory used for caching (Cached) from the total available memory (MemTotal). In Linux systems, some memory is reserved for buffering and caching data, so this metric provides a more accurate view of actual memory usage.


# ***Swap Usage:***

Formula: 

node_memory_SwapTotal_bytes - node_memory_SwapFree_bytes

***Explanation:***

Explanation: This metric calculates the swap space usage by subtracting the free swap space (SwapFree) from the total swap space available (SwapTotal). Swap space is used when the system's physical memory (RAM) is exhausted. Monitoring swap usage helps you identify situations where excessive swapping might be impacting system performance.

# ***Page Faults:***

Metric Name: 

node_vmstat_pgmajfault

***Explanation:***

This metric represents the number of major page faults per second. A major page fault occurs when a process needs data that is not in physical RAM and must be read from disk or swap. Monitoring this metric can help you identify memory performance issues where processes are frequently swapping data in and out of memory.

# ***Memory Utilization Percentage:***

Formula: 

(1 - (node_memory_MemFree_bytes + node_memory_Buffers_bytes + node_memory_Cached_bytes) / node_memory_MemTotal_bytes) * 100


***Explanation:***

This metric calculates the percentage of memory utilization by subtracting the sum of free memory (MemFree), memory used for buffers (Buffers), and memory used for caching (Cached) from the total available memory (MemTotal). It then divides this by MemTotal to express memory utilization as a percentage. A high memory utilization percentage indicates that most of the available memory is in use.

# ***It's important to set thresholds that are tailored to your system's normal operating conditions and the level of risk you're willing to tolerate. Here are some general guidelines for memory-related thresholds***

Memory Usage Percentage:

Threshold: You might consider setting a warning alarm at around 80% memory utilization and a critical alarm at 90% or higher.

Explanation: 

These thresholds give you a buffer before memory becomes severely constrained. When memory usage approaches these levels, it's a sign that you should investigate the resource usage of your applications and potentially allocate more memory or optimize them.
