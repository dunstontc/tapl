# 1. Print the total number of input lines:
  END { print NR }

# 2. Print the tenth input line:
  NR == 10

# 3. Print the last field of every input line:
  { print $NF }

# 4. Print the last field of the last input line:
      { field = $NF }
  END { print field }

# 5. Print every input line with more than four fields:
  NF > 4

# 6. Print every input line in which the last field is more than 4:
  $NF > 4

# 7. Print the total number of fields in all input lines:
      { nf == nf + NF }
  END { print nf }

# 8. Print the total number of lines that contain Beth:
  /Beth/ { nlines = nlines + 1 }
  END { print nlines }

# 9. Print the largest first field and the line that contains it (assumes some $1 is positive):
  $1 > max { max = $1; maxline = $0 }
  END      { print max, maxline }

# 10. Print every line that has at least one field:
  NF > 0

# 11. Print every line longer than 80 characters:
  length($0) > 80

# 12. Print the number of fields in every line followed by the line itself:
  { print NF, $0 }

# 13. Print the first two fields, in opposite order, of every line:
  { print $2, $1 }

# 14. Exchange the first two fields of every line and then print the line:
  { temp=$1; $1=$2; $2=temp; print }

# 15. Print every line with the first field replaced by the line number:
  { $1 = NR; print }

# 16. Print every line after erasing the second field:
  { $2 = ""; print }

# 17. Print in reverse order the fields of every line:
  { for (i=NF; i>0; i=i-1)
    printf("%s ", $i)
    printf("\n" )
  }

# 18. Print the sums of the fields of every line:
  { sum = 0
    for (i = 1; i <= NF; i = i + 1) sum = sum + $i
    print sum
  }

# 19. Add up all fields in all lines and print the sum:
      { for (i = 1; i <= NF; i = i + 1) sum = sum + $i }
  END { print sum }

# 20. Print every line after replacing each field by its absolute value:
  { for (i = 1; i <= NF; i = i + 1) if ($i < 0) $i = -$i
    print
  }
