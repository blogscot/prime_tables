defmodule PrimeTablesTest do
  use ExUnit.Case
  doctest PrimeTables

  test "get a valid number" do
    assert PrimeTables.get_number("test/valid_number.txt") == {:ok, 8}
  end

  test "get a number from missing file" do
    assert PrimeTables.get_number("test/invalid_number.txt") == {:error, "Error: invalid input."}
  end

  test "get an invalid number" do
    assert PrimeTables.get_number("missing_file.txt") == {:error, "Error: file not found."}
  end

  test "valid prime numbers are 2, 3, 5 ..." do
    assert PrimeTables.is_prime?(2)
    refute PrimeTables.is_prime?(6)
    assert PrimeTables.is_prime?(11)
    refute PrimeTables.is_prime?(15)
    assert PrimeTables.is_prime?(23)
  end

  test "find prime numbers up to the given value" do
    assert PrimeTables.get_primes(4) == [2, 3, 5, 7]
    assert PrimeTables.get_primes(10) == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
  end

  test "multiplication table for three primes" do
    expected = """
|      |    2 |    3 |    5 |
|    2 |    4 |    6 |   10 |
|    3 |    6 |    9 |   15 |
|    5 |   10 |   15 |   25 |
"""
    assert expected == PrimeTables.get_table(3)
  end

  test "multiplication table with increased tab spacing" do
    expected = """
|       |     2 |     3 |     5 |
|     2 |     4 |     6 |    10 |
|     3 |     6 |     9 |    15 |
|     5 |    10 |    15 |    25 |
"""

    assert expected == PrimeTables.get_table(3, 6)
  end

  test "multiplication table for four primes" do
    expected = """
|      |    2 |    3 |    5 |    7 |
|    2 |    4 |    6 |   10 |   14 |
|    3 |    6 |    9 |   15 |   21 |
|    5 |   10 |   15 |   25 |   35 |
|    7 |   14 |   21 |   35 |   49 |
"""
    assert expected == PrimeTables.get_table(4)
  end

  test "when a user supplies a valid filename contain good data" do

    expected = """
|      |    2 |    3 |    5 |    7 |   11 |   13 |   17 |   19 |
|    2 |    4 |    6 |   10 |   14 |   22 |   26 |   34 |   38 |
|    3 |    6 |    9 |   15 |   21 |   33 |   39 |   51 |   57 |
|    5 |   10 |   15 |   25 |   35 |   55 |   65 |   85 |   95 |
|    7 |   14 |   21 |   35 |   49 |   77 |   91 |  119 |  133 |
|   11 |   22 |   33 |   55 |   77 |  121 |  143 |  187 |  209 |
|   13 |   26 |   39 |   65 |   91 |  143 |  169 |  221 |  247 |
|   17 |   34 |   51 |   85 |  119 |  187 |  221 |  289 |  323 |
|   19 |   38 |   57 |   95 |  133 |  209 |  247 |  323 |  361 |
 """

    assert expected == PrimeTables.generate_table("test/valid_number.txt")
  end

  test "when user supplies an invalid filename" do
    expected = "Error: file not found."
    assert expected == PrimeTables.generate_table("missing_file.txt")
  end

  test "when user supplies a valid filename with bad data" do
    expected = "Error: invalid input."
    assert expected == PrimeTables.generate_table("test/invalid_number.txt")
  end
end
