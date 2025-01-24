# Mya specification

Mya is a formal language to write specification of an ISA ([Instruction Set Archicteture]). Using
Mya you can specify registers and the format of instructions in assembly and in machine code.

* [Example](src/example.mya)
* [Syntax notation](src/syntax.wsn)

[Instruction Set Archicteture]: https://en.wikipedia.org/wiki/Instruction_set_architecture

## Why?

* It's a formal way to document your custom ISA instructions, so it's make easy to another people
  read and understand how your ISA works.
* Tools can parse and make something with your ISA specification, for instance, generate an
  assembler and disassembler for you (coming soon...).

## Repositories

- [libmya](https://github.com/mya-project/libmya): A library to parse Mya language.
- coming soon: A command-line tool to generate assembler and disassembler reading a specification written in Mya language.

## Specification

You can read the specification in HTML or PDF, using the links below:

* <https://mya.freedev.com.br/>
* <https://mya.freedev.com.br/mya-specification.pdf>

## How to build the specification

```console
$ make docker ARGS=pdf
```

It will generate the `mya-specification.pdf` file.
