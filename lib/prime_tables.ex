defmodule PrimeTables do
  @moduledoc """
  PrimeTables builds a mutliplication table for Prime Numbers.
  """

  @doc """
  Reads an integer value from a file.
  """
  def get_number(filename) do
    case File.read(filename) do
      {:ok, text} -> parse_number(String.trim(text))
      {:error, _} -> {:error, "Error: file not found."}
    end
  end

  @doc """
  Parses text into an integer value.
  """
  def parse_number(text) do
    case Integer.parse(text) do
      {value, _} -> {:ok, value}
      :error -> {:error, "Error: invalid input."}
    end
  end

  @doc """
  Returns true if the given integer value is prime.

  iex(1)> PrimeTables.is_prime?(100)
  false
  iex(2)> PrimeTables.is_prime?(199)
  true
  """
  def is_prime?(num) when is_integer(num) and num < 2, do: false
  def is_prime?(num) when is_integer(num) and num == 2 or num == 3, do: true
  def is_prime?(num) when rem(num, 2) == 0, do: false
  def is_prime?(num) when is_integer(num) do
    3..(:math.sqrt(num) |> trunc)
    |> Enum.map(fn x -> rem(num, x) == 0 end)
    |> Enum.all?(&(&1 == false))
  end

  @doc """
  Returns a list of primes up to the given value.

  iex(1)> PrimeTables.find_primes(50)
  [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47]
  """

  def find_primes(num) when is_integer(num) do
    2..num |> Enum.filter(&PrimeTables.is_prime?/1)
  end

  @doc """
  Calculates the rows for the prime table.

  iex(1)> PrimeTables.calculate_rows [2, 3, 5]
  [[2, 4, 6, 10], [3, 6, 9, 15], [5, 10, 15, 25]]
  """
  def calculate_rows(primes) do
    data = (for x <- primes, y <- primes, do: x * y)
    |> Enum.chunk(length(primes))

    Enum.zip(primes, data)
    |> Enum.map(fn {p, data} -> List.insert_at(data, 0, p) end)
  end

  @doc """
  Builds a two dimensional multiplication table of prime numbers
  """
  def get_table(num, padding \\ 5) when is_integer(num) do
    primes = num |> find_primes
    rows = primes |> calculate_rows
    {:ok, pid} = StringIO.open("table")

    # construct first row
    IO.write pid, "|" <> String.pad_leading("", padding + 1)
    for p <- primes do
      IO.write(pid, "|" <> String.pad_leading(Integer.to_string(p), padding) <> " ")
    end
    IO.puts pid, "|"

    # and the remaining rows
    for row <- rows do
      for r <- row do
        IO.write(pid, "|" <> String.pad_leading(Integer.to_string(r), padding) <> " ")
      end
      IO.puts pid, "|"
    end
    StringIO.flush(pid)
  end

end
