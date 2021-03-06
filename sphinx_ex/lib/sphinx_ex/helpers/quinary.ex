defmodule SphinxEx.Helpers.Quinary do

  @spec convert_to_decimal(binary) :: integer
  def convert_to_decimal(s) do
    s
    |> String.reverse()
    |> String.graphemes()
    |> Enum.with_index()
    |> Enum.map( fn {x, i} ->
      x
      |> String.to_integer()
      |> Kernel.*(:math.pow(5,i))
    end)
    |> Enum.sum()
    |> round()
  end

  @spec convert_to_quinary(integer) :: binary
  def convert_to_quinary(n), do: String.pad_leading(calculate_quinary(n), 49, "0")

  @spec calculate_quinary(integer) :: binary
  def calculate_quinary(n) do
    q = rem(n, 5)
    e = div(n, 5)
    cond do
      n == 0 -> "0"
      e == 0 -> Integer.to_string(q)
      true ->
        calculate_quinary(e) <> Integer.to_string(q)
    end
  end

end
