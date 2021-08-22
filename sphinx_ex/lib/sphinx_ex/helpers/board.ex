defmodule SphinxEx.Helpers.Board do
  @spec validate_board(binary) :: list
  def validate_board(s) do
    frequency = count_frequency(s)
    errors = []

    {_, errors} =
      {frequency, errors}
      |> validate_size()
      |> validate_entrance()
      |> validate_treasure()
      |> validate_walls()

    errors
  end

  @spec validate_entrance({map, list}) :: {map, list}
  def validate_entrance({%{"3" => 1} = m, errors}), do: {m, errors}
  def validate_entrance({m, errors}), do: {m, errors ++ [:entrance_missing]}

  @spec validate_size({map, list}) :: {map, list}
  def validate_size({m, errors}) do
    if Enum.reduce(m, 0, fn {_k, v}, acc -> v + acc end) != 49 do
      {m, errors ++ [:invalid_size]}
    else
      {m, errors}
    end
  end

  @spec validate_treasure({map, list}) :: {map, list}
  def validate_treasure({%{"4" => 1} = m, errors}), do: {m, errors}
  def validate_treasure({m, errors}), do: {m, errors ++ [:treasure_missing]}

  @spec validate_walls({map, list}) :: {map, list}
  def validate_walls({m, errors}) do
    if m["2"] > 15 do
      {m, errors ++ [:too_many_walls]}
    else
      {m, errors}
    end
  end

  @spec count_frequency(binary) :: map
  def count_frequency(s) when is_binary(s) do
    intial = %{"0" => 0, "1" => 0, "2" => 0, "3" => 0, "4" => 0}

    s
    |> String.graphemes()
    |> Enum.reduce(intial, fn c, acc ->
      Map.update!(acc, c, &(&1 + 1))
    end)
  end
end
