# The AWK Programming Language

## Contents

- Chapter 1: An Awk Tutorial
  - 1.1 Getting Started
  - 1.2 Simple Output
  - 1.3 Fancier Output
  - 1.4 Selection
  - 1.5 Computing with AWK
  - 1.6 Control-Flow Statements
  - 1.7 Arrays
  - 1.8 A Handfull of Useful "One-liners"
  - 1.9 What Next?
- Chapter 2: The Awk Language
  - 2.1 Patterns
  - 2.2 Actions
  - 2.3 User-Defined Functions
  - 2.4 Output
  - 2.5 Input
  - 2.6 Interaction with Other Programs
- Chapter 3: Data Processing
- Chapter 4: Reports and Databases
- Chapter 5: Processing Words
- Chapter 6: Litile Languages
- Chapter 7: Experiments with Algorithms
- Chapter 8: Epilog


## Chapter 2: The Awk Language

### Comparison Operators (Table 2-1)

| Operator |         Meaning          |
| :------: | ------------------------ |
|   `<`    | less than                |
|   `<=`   | less than or equal       |
|   `==`   | equal to                 |
|   `!=`   | not equal to             |
|   `>=`   | greater than or equal to |
|   `>`    | greater than             |
|   `~`    | matched by               |
|   `!~`   | not matched by           |

### Escape Sequences (Table 2-2)

| Sequence |                                  Meaning                                   |
| :------: | -------------------------------------------------------------------------- |
|   `\b`   | backspace                                                                  |
|   `\f`   | formfeed                                                                   |
|   `\n`   | newline (line feed)                                                        |
|   `\r`   | carriage return                                                            |
|   `\t`   | tab                                                                        |
|  `\ddd`  | octal value `ddd`, where `ddd` is 1 to 3 digits between `0` and `7`        |
|   `\c`   | any other character `c` literally (e.g., `\\` for backslash, `\"` for `"`) |

### Regular Expressions (Table 2-3)

|  Expression  |                                                             Matches                                                             |
| :----------: | ------------------------------------------------------------------------------------------------------------------------------- |
|     `c`      | the nonmetacharacter `c`                                                                                                        |
|     `\c`     | escape sequence or literal character `c`                                                                                        |
|     `^`      | beginning of string                                                                                                             |
|     `$`      | end of string                                                                                                                   |
|     `.`      | any character                                                                                                                   |
| `[c1c2...]`  | any character in `c1c2...`                                                                                                      |
| `[^c1c2...]` | any character not in `c1c2...`                                                                                                  |
|  `[c1-c2]`   | any character in the range beginning with `c1` and ending with `c2`                                                             |
|  `[^c1-c2]`  | any character not in the range `c1` to `c2`                                                                                     |
|   `r1|r2`    | any string matched by `r1` or `r2`                                                                                              |
|  `(r1)(r2)`  | any string `xy` where `r1` matches `x` and `r2` matches `y`; <br/> parentheses not needed around arguments with no alternations |
|    `(r)*`    | zero or more consecutive strings matched by `r`                                                                                 |
|    `(r)+`    | one or more consecutive strings matched by `r`                                                                                  |
|    `(r)?`    | zero or one string matched by `r` <br/> parentheses not needed around basic regular expressions                                 |
|    `(r)`     | any string matched by `r`                                                                                                       |

### Patterns (Table 2-4)

|      Pattern      |          Example           |                               Matches                                |
| ----------------- | -------------------------- | -------------------------------------------------------------------- |
| *BEGIN*           | `BEGIN`                    | before any input has been read                                       |
| *END*             | `END`                      | after all input has been read                                        |
| *expression*      | `$3 < 100`                 | lines in which third field is less than 100                          |
| *string-matching* | `/Asia/`                   | lines that contain Asia                                              |
| *compound*        | `$3 < 100 && $4 == "Asia"` | lines in which third field is less than 100 and fourth field is Asia |
| *range*           | `NR==10, NR==20`           | tenth to twentieth lines of input inclusive                          |

### Built-in Variables (Table 2-5)

|  Variable  |                  Meaning                   | Default  |
| ---------- | ------------------------------------------ | :------: |
| `ARGC`     | number of command-line arguments           |   `-`    |
| `ARGV`     | array of command-line arguments            |   `-`    |
| `FILENAME` | name of current input file                 |   `-`    |
| `FNR`      | record number in current file              |   `-`    |
| `FS`       | controls the input field separator         |  `" "`   |
| `NF`       | number of fields in current record         |   `-`    |
| `NR`       | number of records read so far              |   `-`    |
| `OFMT`     | output format for numbers                  | `"%.6g"` |
| `OFS`      | output field separator                     |  `" "`   |
| `ORS`      | output record separator                    |  `"\n"`  |
| `RLENGTH`  | length of string matched by match function |   `-`    |
| `RS`       | controls the input record separator        |  `"\n"`  |
| `RSTART`   | start of string matched by match function  |   `-`    |
| `SUBSEP`   | subscript separator                        | `"\034"` |

### Built-in Arithmetic Functions (Table 2-6)

|   Function   |                     Value Returned                      |
| ------------ | ------------------------------------------------------- |
| `atan2(y,x)` | arctangent of `y/x` in the range `-π` to `π`            |
| `cos(x)`     | cosine of `x`, with `x` in radians                      |
| `exp(x)`     | exponential function of `x`, `e**x`                     |
| `int(x)`     | integer part of `x`; truncated towards `0` when `x > 0` |
| `log(x)`     | natural (base `e`) logarithm of `x`                     |
| `rand()`     | random number `r`, where `0 <= r < 1`                   |
| `sin(x)`     | sine of `x`, with `x` in radians                        |
| `sqrt(x)`    | square root of `x`                                      |
| `srand(x)`   | `x` is new seed for `rand()`                            |

### Built-in String Functions (Table 2-7)

|         Function         |                                                     Description                                                     |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------- |
| `gsub(r,s)`              | substitute `s` for `r` globally in `$0`, <br/> return number of substitutions made                                  |
| `gsub(r,s,t)`            | substitutes for `r` globally in string `t`, <br/> return number of substitutions made                               |
| `index(s,t)`             | return first position of string `t` in `s`, or `0` if `t` is not present                                            |
| `length(s)`              | return number of characters in `s`                                                                                  |
| `match(s,r)`             | test whether `s` contains a substring matched by `r`,  <br/> return index or `0`; sets `RSTART` and `RLENGTH`       |
| `split(s,a)`             | split `s` into array `a` on `FS`, return number of fields                                                           |
| `split(s,a,fs)`          | splits into array `a` on field separator `fs`, <br/> return number of fields                                        |
| `sprintf(fmt,expr-list)` | return `expr-list` formatted according to format string `fmt`                                                       |
| `sub(r,s)`               | substitute `s` for the leftmost longest substring of `$0` matched by `r`, <br/> return number of substitutions made |
| `sub(r,s,t)`             | substitute `s` for the leftmost longest substring of `t` matched by `r`, <br/> return number of substitutions made  |
| `substr(s,p)`            | return suffix of `s` starting at position `p`                                                                       |
| `substr(s,p,n)`          | return substring of `s` of length `n` starting at position `p`                                                      |

### `printf` Format-control Characters (Table 2-9)

### Examples of `printf` Specifications (Table 2-10)

### `getline` Function (Table 2-11)



---

## Terms

|           Term           |                                 Definition                                 |
| ------------------------ | -------------------------------------------------------------------------- |
| pattern-action statement |                                                                            |
| field                    |                                                                            |
| match                    | The precise meaning of the word "match" depends on the pattern in question |
| Bailing out              | No recovery was attempted.                                                 |
| Built-In Variables       |                                                                            |
| Field Variables          |                                                                            |
