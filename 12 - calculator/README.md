A simple calculator read-eval-print loop written in Mewlix. Implemented with a simple recursive descent parser. 🐱

It supports what you would expect:

- The four basic operations (addition, subtraction, multiplication and division).
- Parenthesized expressions.

It does not support floating-point numbers.

A few examples of expressions it will happily parse + evaluate are:

```
1 + 2 * 3
(1 + 2) * 3
(1 + 3) * 2 + 4
3 * (1 + 2) + 4 * 3 / 2
3 * (1 + 2) + 4 * (3 + 3)
3 * (1 + 2) + 4 * (3 + 3) + 1
4 * 3 - 2 + (1 - 2) * (12 / 2)
100 / 4 - 1
3 + 5 * 82
```
