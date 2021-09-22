defmodule SphinxEx.Helpers.SolutionTest do
  use ExUnit.Case, async: true

  import SphinxEx.Helpers.Solution

  test "solvable?" do
    unsolvable_board = %{
      {0, 0} => "3",
      {0, 1} => "2",
      {1, 1} => "2",
      {1, 0} => "2",
      {2, 2} => "4"
    }

    solvable_board = %{
      {0, 0} => "3",
      {1, 0} => "2",
      {1, 1} => "2",
      {1, 2} => "2",
      {2, 0} => "4"
    }

    assert solvable?(solvable_board)
    refute solvable?(unsolvable_board)
  end

  test "walk_solution" do
    assert MapSet.size(walk_solution(MapSet.new([{0, 0}]), MapSet.new([]), %{})) == 49

    assert MapSet.size(walk_solution(MapSet.new([{0, 0}]), MapSet.new([]), %{{1, 1} => "2"})) ==
             48

    assert MapSet.size(
             walk_solution(MapSet.new([{0, 0}]), MapSet.new([]), %{
               {0, 1} => "2",
               {1, 1} => "2",
               {1, 0} => "2"
             })
           ) == 1
  end

  test "find_position" do
    assert find_position(%{{0, 0} => "0", {1, 1} => "0"}, "0") == {0, 0}
    assert find_position(%{{0, 0} => "0", {1, 1} => "1"}, "1") == {1, 1}
    assert find_position(%{{0, 0} => "1", {1, 1} => "1"}, "0") == :none
  end

  test "next_moves" do
    assert next_moves(%{}, {0, 0}) == [{0, 1}, {1, 0}]
    assert next_moves(%{}, {6, 6}) == [{6, 5}, {5, 6}]
    assert next_moves(%{{1, 1} => "1"}, {0, 0}) == [{0, 1}, {1, 0}]
    assert next_moves(%{{1, 1} => "2"}, {0, 0}) == [{0, 1}, {1, 0}]
  end
end
