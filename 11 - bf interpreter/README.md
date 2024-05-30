An interpreter for [Brainfuck, an esoteric programming language](https://esolangs.org/wiki/Brainfuck) known for its minimalism: It provides you with 8 operators, a byte array and a pointer to the first byte in that array.

The project is written with OOP patterns, and is self-documenting.

This interpreter cares about correctness of output, but doesn't care about being performant. This is instended as a simple example project for a cat-themed esolang. There are **far** more performant Brainfuck interpreters out there.

Still, the parser performs a few optimizations for the fun of it. It collapses operator chains like these:
```bf
++++++++
```
Into as few tokens as possible. For that example, only one token is generated:
```mewlix
[📦 [ evaluate: <function>, count: 8 ]]
```

### Implementation Details
- As Mewlix doesn't have indexable arrays, a [table](https://github.com/KBMackenzie/mewlix/wiki/std#stdtable) is used to represent the byte array.
- The value for each *'cell'* wraps around: Incrementing a cell above 255 will cause it to wrap around to 0, and vice versa.
- This interpreter chooses to handle EOF by making no changes to a cell whatsoever. [This seemed like the better option.](https://esolangs.org/wiki/Brainfuck#EOF).
- This project is meant to run in the browser, with Mewlix's `console` template. As such, when interpreting a program, we can't print its output to the screen character by character as we go. Instead, program output is stored as a string and only shown when a program finishes executing.
