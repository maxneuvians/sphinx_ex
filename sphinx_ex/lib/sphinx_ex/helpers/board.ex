defmodule SphinxEx.Helpers.Board do

  @spec validate_size(any) :: boolean
  def validate_size(s) when byte_size(s) == 49 and is_binary(s), do: true
  def validate_size(_s), do: false

  @spec count_frequency(binary) :: any
  def count_frequency(s) do
    intial = %{"0" => 0, "1" => 0,"2" => 0,"3" => 0,"4" => 0 }
    s
    |> String.graphemes()
    |> Enum.reduce(intial, fn c, acc ->
      Map.update!(acc, c, &(&1 + 1))
    end)
  end

end
