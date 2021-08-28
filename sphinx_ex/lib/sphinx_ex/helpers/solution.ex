defmodule SphinxEx.Helpers.Solution do
  @spec solvable?(map) :: boolean()
  def solvable?(board) do
    entrance = find_position(board, "3")
    treasure = find_position(board, "4")
    visited = walk_solution(MapSet.new([entrance]), MapSet.new(), board)
    MapSet.member?(visited, treasure)
  end

  @spec walk_solution(MapSet.t([any]), MapSet.t([any]), Map) :: MapSet.t(any)
  def walk_solution(to_visit, visited, board) do
    if MapSet.size(to_visit) == 0 do
      visited
    else
      visited = MapSet.union(to_visit, visited)

      to_visit =
        to_visit
        |> Enum.reduce(MapSet.new(), fn pos, m ->
          next_moves(board, pos)
          |> Enum.reduce(m, &MapSet.put(&2, &1))
        end)
        |> MapSet.difference(visited)

      walk_solution(to_visit, visited, board)
    end
  end

  @spec find_position(map, binary) :: {number, number}
  def find_position(board, target) do
    board
    |> Enum.find_value(:none, fn {k, v} ->
      if v == target, do: k
    end)
  end

  @spec filter_coordinates({number, number}) :: boolean
  def filter_coordinates({x, y}) when x < 0 or y < 0, do: false
  def filter_coordinates({x, y}) when x > 6 or y > 6, do: false
  def filter_coordinates({_x, _y}), do: true

  @spec filter_walls({number, number}, map) :: boolean
  def filter_walls({x, y}, board) do
    if board[{x, y}] == "2", do: false, else: true
  end

  @spec next_moves(map, {number, number}) :: list
  def next_moves(board, {x, y}) do
    (x - 1)..(x + 1)
    |> Enum.reduce([], fn x_pos, acc ->
      (y - 1)..(y + 1)
      |> Enum.reduce(acc, fn y_pos, l ->
        l ++ [{x_pos, y_pos}]
      end)
    end)
    |> Enum.filter(&filter_coordinates/1)
    |> Enum.filter(fn c -> filter_walls(c, board) end)
  end
end
