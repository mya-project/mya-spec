\newpage
# Declarations

## Bitfield

Bitfields are the representation of how the values (like registers) are specified on the machine
code of the ISA. The syntax to declare a bitfield is:

```
bitfield <name>[<size>]

OR

bitfield <name>[<size>] {
    <field-list>
}
```

* `<name>` should start with an uppercase letter followed by any combination of `[a-z][A-Z][0-9]_`
  characters.
* `<size>` is a literal number that specifies the size of the bitfield in bits.
* `<field-list>` is a list of bitfield's field names and sizes[^fields-size].

### Examples

```
bitfield Reg[4]
```

It's a bitfield named `Reg` with 4 bits size.

```
bitfield Opcode[8] {
	imm[1]
	op[7]
}
```

It's a bitfield named `Opcode` with 8 bits size and 2 fields:

1. `imm` (1 bit size) is the first bit of the bitfield `Opcode`.
2. `op` (7 bits size) are the next 7 bits of the bitfield `Opcode`.


[^fields-size]: The sum of all field sizes should be equal to bitfield's size.


\newpage
## Register

Registers of the ISA can be declared specifiying the bitfield where the register code is set.
The syntax to declare a register is:

```
register <name>[<size>] = <bitfield-specification>
```

* `<name>` should start with a letter followed by any combination of `[a-z][A-Z][0-9]_` characters.
* `<size>` is a literal number that specifies the size of the register in bits.
* `<bitfield-specification>` is the specification to what bitfield is used to set this register
  code and what value is set on this bitfield to specify the usage of this register.

### Examples

```
bitfield Reg[4]

register r2[32] = Reg{2}
```

It's a 32 bit register named `r2` where they code is set on a `Reg` bitfield, and it's code is `2`.

```
bitfield Reg[4] {
    size[1]
    code[3]
}

register rdx[64] = Reg {
    size = 1,
    code = 2,
}
```

It's a 64 bit register named `rdx` where they code is set on a `Reg` bitfield, and the bitfield's
fields are set to `size = 1` and `code = 2` respectivaly. It's equivalent to `Reg{10}`.


\newpage
## Instructions

ISA's instructions are declared specifying it's arguments and machine code format. The syntax is:

```
inst <name>[<size>](<arglist>) {
    <instruction-specification>
}
```

* `<name>` should start with a letter followed by any combination of `[a-z][A-Z][0-9]_` characters.
* `<size>` is the size in bits of the instruction.
* `<arglist>` is a command separated list of arguments that the instructions expects.
* `<instruction-specification>` is a comma separated list of bitfields in the instruction.

### Examples

```
bitfield Reg[4]

bitfield Opcode[8] {
	imm[1]
	op[7]
}

register r0[32] = Reg{0}
register r1[32] = Reg{1}
...
register r15[32] = Reg{15}


inst mov[16](arg1: register[32], arg2: register[32]) {
	opcode = Opcode {
		imm = 0b0,
		op = 0x1a,
	},
	reg1 = Reg{arg1},
	reg2 = Reg{arg2},
}
```

This specify an instruction named `mov`, 16 bits size, that expects two 32 bit registers as
arguments. On the assembly perspective, this instruction looks like:

```
mov <reg32>, <reg32>
```

The machine code format is specified on the body of the instruction, where it's uses a sequence
of one `Opcode` bitfield and two `Reg` bitfields. Having the format like:

```
15 14 13 12 11 10 09 08 | 07 06 05 04 03 02 01 00
-- -- -- -- -- -- -- -- | -- -- -- -- -- -- -- --
|  |                  |   |         | |         |
|  |                  |   |         | |         |
|  +--- op == 0x1a ---+   |         | reg2 == arg2
+-- imm == 0              reg1 == arg1
```

Example:

```
Assembly:         mov r2, r10
Hex machine code: 1a 2a
Bin machine code: 00011010 00101010
```
