defmodule PrimeTablesTest do
  use ExUnit.Case

  test "get a valid number" do
    assert PrimeTables.get_number("test/valid_number.txt") == {:ok, 20}
  end

  test "get a number from missing file" do
    assert PrimeTables.get_number("test/invalid_number.txt") == {:error, "Error: invalid input."}
  end

  test "get an invalid number" do
    assert PrimeTables.get_number("missing_file.txt") == {:error, "Error: file not found."}
  end

  test "valid prime numbers are 2, 3, 5 ..." do
    assert PrimeTables.is_prime(2)
    refute PrimeTables.is_prime(6)
    assert PrimeTables.is_prime(11)
    refute PrimeTables.is_prime(15)
    assert PrimeTables.is_prime(23)
  end

end
