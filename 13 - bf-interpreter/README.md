An interpreter for [Brainfuck, an esoteric programming language](https://esolangs.org/wiki/Brainfuck) known for its minimalism: It provides you with 8 operators, a byte array and a pointer to the first byte in that array.

The project was written with object-oriented patterns, and includes documentation comments in each yarn ball.

This interpreter cares about correctness of output, but doesn't care about being performant. This is instended as an example project for a cat-themed esolang. There are **far, far** more performant Brainfuck interpreters out there.

Still, the parser performs a few optimizations for the fun of it. It collapses operator chains like these:
```bf
++++----
```
Into as few tokens as possible:
```mewlix
[=^-x-^= [ evaluate: <function>, count: 4 ], =^-x-^= [ evaluate: <function>, count: 4 ]]
```

### Implementation Details
- As Mewlix doesn't have indexable arrays, a [table](https://github.com/KBMackenzie/mewlix/wiki/std#stdtable) is used to represent the byte array.
- The value for each *'cell'* wraps around: Incrementing a cell above 255 will cause it to wrap around to 0, and vice versa.
- This interpreter chooses to handle EOF by making no changes to a cell whatsoever. [This seemed like the better option.](https://esolangs.org/wiki/Brainfuck#EOF).
- The interpreter supports the `,` operator, and will ask for user input to pass to the program if the `,` operator is present.
- If the `,` operator isn't present at all in a Brainfuck string/file, the interpreter will **never** ask for input.
