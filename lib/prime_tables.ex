defmodule PrimeTables do
  @moduledoc """
  PrimeTables builds a mutliplication table for Prime Numbers.
  """

  @doc """
  Reads an integer value from a file
  """
  def get_number(filename) do
    case File.read(filename) do
      {:ok, text} -> parse_number(String.trim(text))
      {:error, _} -> {:error, "Error: file not found."}
    end
  end

  def parse_number(text) do
    case Integer.parse(text) do
      {value, _} -> {:ok, value}
      :error -> {:error, "Error: invalid input."}
    end
  end

end
