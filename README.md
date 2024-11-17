# E2 Server-core
 Implements few functions to the Wiremod Expression2 tool to detect server latency, monitoring and memory usage.
 Made in 2018 as gift for the opening of the sandbox server E2 Beyond infinity.

## Features

This extension includes the following E2 functions:

### Latency Detection
- **`isServerLaggingS()`**  
  Checks if the server is lagging with **sensitive detection** (`clearTime = 0.05`).

- **`isServerLaggingM()`**  
  Checks if the server is lagging with **medium sensitivity** (`clearTime = 0.075`).

- **`isServerLaggingH()`**  
  Checks if the server is lagging with **heavy sensitivity** (`clearTime = 0.1`).

- **`getLatency(clearTime)`**  
  Customizable server lag check using a user-defined `clearTime` threshold.

### Server Performance Metrics
- **`getServerFPS()`**  
  Returns the server's frame rate using the primary calculation method.

- **`getServerFPS2()`**  
  Returns the server's frame rate using an alternative calculation method optimized for benchmarking.

- **`engineFrameTime()`**  
  Provides the server's tick rate, including the impact of lag.

### Memory Monitoring
- **`getMemoryUsedK()`**  
  Returns the current Lua dynamic memory usage in kilobytes.

- **`getMemoryUsedM()`**  
  Returns the current Lua dynamic memory usage in megabytes.

---

## Installation

1. Place the `e2 server-core` extension files in the `addons` directory.
2. Ensure **Wiremod** is installed and properly configured.
3. Restart your server or reload wiremod to load the new extension.

This is a 1 hour project, released for historical reason, however if you want to see more features or have any complaint, feel free to ask me.


---

 

