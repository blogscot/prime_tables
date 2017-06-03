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
end
