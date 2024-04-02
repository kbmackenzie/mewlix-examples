An interpreter for Brainfuck, a popular [esoteric programming language](https://esolangs.org/wiki/Brainfuck) known for its absurd minimalism: It provides you with 8 operators, a data pointer and an instruction pointer.

This interpreter is a very simple example project, and while it does its best to be as correct as it can, it doesn't care as much about being performant *(as there are already plenty of very fast Brainfuck interpreters out there)*. Still, it does go through the trouble of collapsing operator chains like these:
```bf
++++----
```
Into as few tokens as possible:
```mewlix
[=^-x-^= [ type: "Increment", count: 4 ], =^-x-^= [ type: "Decrement", count: 4 ]]
```

Additionally, this interpreter chooses to handle EOF by making no changes to a cell whatsoever. [This seemed like the better option.](https://esolangs.org/wiki/Brainfuck#EOF).
