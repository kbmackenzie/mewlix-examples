An interpreter for Brainfuck, a popular [esoteric programming language](https://esolangs.org/wiki/Brainfuck) known for its absurd minimalism: It provides you with 8 operators, a byte array and a pointer to a byte in that array.

This interpreter is a very simple example project, and while it does its best to be as correct as it can, it doesn't care as much about being performant *(as there are already plenty of very fast Brainfuck interpreters out there)*.

Still, a few optimizations do occur. The parser collapses operator chains like these:
```bf
++++----
```
Into as few tokens as possible:
```mewlix
[=^-x-^= [ type: "Increment", count: 4 ], =^-x-^= [ type: "Decrement", count: 4 ]]
```

As Mewlix does not have indexable arrays, a [table](https://github.com/KBMackenzie/mewlix/wiki/std#stdtable) is used to represent the byte array. The value for each *'cell'* wraps around: Incrementing a cell above 255 will cause it to wrap around to 0, and vice versa.

Additionally, this interpreter chooses to handle EOF by making no changes to a cell whatsoever. [This seemed like the better option.](https://esolangs.org/wiki/Brainfuck#EOF).

The interpreter supports the `,` operator, and will ask for user input to pass to the program if the `,` operator is present.

If the `,` operator isn't present at all in a Brainfuck string/file, the interpreter will never ask for input.
