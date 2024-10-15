# Control Unit Design

## Ports

### Inputs:

- **OPCODE**: Comes from the splitted instruction.

### Outputs:

- **regWriteEnable**: Controls writing to the register file.
- **negate**: Decides whether to negate the 2nd ALU operand.
- **aluSource**: Determines the 2nd ALU operand (register value or immediate value).
- **aluop**: Selects the ALU operation result from the 4 functional units.

## ALU Operations

| ALUOP | Function | Instructions   |
| ----- | -------- | -------------- |
| 000   | FORWARD  | `loadi`, `mov` |
| 001   | ADD      | `add`, `sub`   |
| 010   | AND      | `and`          |
| 011   | OR       | `or`           |

## Control Signal Table

| OPCODE   | Instruction | aluop | aluSource | negate | regWriteEnable |
| -------- | ----------- | ----- | --------- | ------ | -------------- |
| 00000000 | loadi       | 000   | 0         | x      | 1              |
| 00000001 | add         | 001   | 1         | 0      | 1              |
| 00000010 | mov         | 000   | 1         | 0      | 1              |
| 00000011 | sub         | 001   | 1         | 1      | 1              |
| 00000100 | and         | 010   | 1         | 0      | 1              |
| 00000101 | or          | 011   | 1         | 0      | 1              |

## Delays

- Control Signal Generation: `#1`

## Task of the control unit

The control unit should check the OPCODE and `asynchronously` Output the control signals accordingly.
