# 8x8 Register File

### Overview

The 8x8 register file contains 8 registers (`r0` - `r7`), each of which is 8 bits wide. The register file serves two primary purposes:

1. **Supply ALU operands**
2. **Store the output value of the ALU**

### Features

- **Reading**: Asynchronous
- **Writing**: Synchronous (Occurs when `write=1` and on the positive clock edge, writing `dataIn` into the `inAddress` register)
- **Resetting**: Synchronous (Occurs when `reset=1` and on the positive clock edge, setting all registers to `0`)

### Timing Delays

- **Read delay**: `#2`
- **Write delay**: `#1`
- **Reset delay**: `#1` (same as writing `0` to all registers)

### Register Array Definition

```verilog
reg [7:0] registerArray [7:0];
```

| Register           | Bit 7 | Bit 6 | Bit 5 | Bit 4 | Bit 3 | Bit 2 | Bit 1 | Bit 0 |
| ------------------ | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- |
| `registerArray[0]` | 1     | 0     | 1     | 1     | 0     | 0     | 1     | 0     |
| `registerArray[1]` | 0     | 0     | 1     | 1     | 1     | 1     | 0     | 1     |
| `registerArray[2]` | 1     | 1     | 0     | 0     | 0     | 1     | 1     | 0     |
| `registerArray[3]` | 0     | 1     | 1     | 0     | 1     | 0     | 0     | 0     |
| `registerArray[4]` | 1     | 0     | 1     | 0     | 1     | 1     | 1     | 1     |
| `registerArray[5]` | 0     | 1     | 1     | 1     | 0     | 1     | 0     | 1     |
| `registerArray[6]` | 1     | 0     | 0     | 1     | 0     | 0     | 1     | 1     |
| `registerArray[7]` | 0     | 1     | 1     | 1     | 1     | 0     | 1     | 0     |
