defmodule PrimeTablesTest do
  use ExUnit.Case

  test "get a valid number" do
    assert(PrimeTables.get_number("test/valid_number.txt") == 20)
  end

  test "get a number from missing file" do
    assert(PrimeTables.get_number("test/invalid_number.txt") == "Error: invalid input.")
  end

  test "get an invalid number" do
    assert(PrimeTables.get_number("missing_file.txt") == "Error: file not found.")
  end

end
