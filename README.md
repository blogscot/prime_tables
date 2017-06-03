# PrimeTables

## Description

The Prime Tables application, written in Elixir, generates a multiplication
table for prime numbers. For example, a table of three primes generates:

    |      |    2 |    3 |    5 |
    |    2 |    4 |    6 |   10 |
    |    3 |    6 |    9 |   15 |
    |    5 |   10 |   15 |   25 |


Input is taken from the user via a text file containing a single integer value.
For example, the text for the table above is generated using the following
command where the user supplied file contains '3':

```
PrimeTables.generate_table(user_filename.txt)
```

# Conclusion

Overall, I'm pleased with my implementation. I particularly like my discovery of
`StringIO` to build a string buffer. This implementation should be reasonably
performant given its use of Streams plus the basic optimisation techniques used
to determine prime numbers, see `is_prime?`.

The implementation of `get_table` could be refactored further to make it more
DRY, however, it is quite readable as it currently stands.
