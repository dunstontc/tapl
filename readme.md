# The AWK Programming Language

## Contents

- Chapter 1: An Awk Tutorial
  - 1.1 Getting Started
    - Running an `awk` Program
    - Errors
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
  - 3.1 Data Transformation and Reduction
  - 3.2 Data Validation
  - 3.3 Bundle & Unbundle
  - 3.4 Multiline Records
- Chapter 4: Reports and Databases
- Chapter 5: Processing Words
- Chapter 6: Litile Languages
- Chapter 7: Experiments with Algorithms
- Chapter 8: Epilog





## Chapter 1: An Awk Tutorial

```
Beth  4.00 0
Dan   3.75 0
Kathy 4.00 10
Mark  5.00 20
Mary  5.50 22
Susie 4.25 18
```

### Running an `awk` Program

```shell
awk 'program' input files

awk '$3 == 0 { print $1 }' file1 file2

awk -f program.awk optional list of input files
```

## Chapter 2: The Awk Language

### Comparison Operators

| Operator |         Meaning          |
| -------- | ------------------------ |
| `<`      | less than                |
| `<=`     | less than or equal       |
| `==`     | equal to                 |
| `!=`     | not equal to             |
| `>=`     | greater than or equal to |
| `>`      | greater than             |
| `~`      | matched by               |
| `!~`     | not matched by           |

### Built-in Variables

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


## Terms

|           Term           |                                 Definition                                 |
| ------------------------ | -------------------------------------------------------------------------- |
| pattern-action statement |                                                                            |
| field                    |                                                                            |
| match                    | The precise meaning of the word "match" depends on the pattern in question |
| Bailing out              | No recovery was attempted.                                                 |
| Built-In Variables       |                                                                            |
| Field Variables          |                                                                            |
