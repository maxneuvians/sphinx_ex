defmodule SphinxEx.Helpers.Ternary do

  def convert_to_decimal(s) do
    s
    |> String.reverse()
    |> String.graphemes()
    |> Enum.with_index()
    |> Enum.map( fn {x, i} ->
      x
      |> String.to_integer()
      |> Kernel.*(:math.pow(3,i))
    end)
    |> Enum.sum()
    |> round()
  end

  def convert_to_ternary(n), do: String.pad_leading(calculate_terniary(n), 49, "0")

  def calculate_terniary(n) do
    q = rem(n, 3)
    e = div(n, 3)
    cond do
      n == 0 -> "0"
      e == 0 -> Integer.to_string(q)
      true ->
        calculate_terniary(e) <> Integer.to_string(q)
    end
  end

end
