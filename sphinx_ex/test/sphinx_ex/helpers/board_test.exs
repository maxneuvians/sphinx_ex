defmodule SphinxEx.Helpers.BoardTest do
  use ExUnit.Case, async: true

  import SphinxEx.Helpers.Board

  test "validate_size" do
    assert validate_size(String.duplicate("0", 49))
    refute validate_size(String.duplicate("0", 48))
    refute validate_size(String.duplicate("0", 50))
    refute validate_size(0)
    refute validate_size([])
    refute validate_size(%{})
  end

  test "count_frequency" do
    assert count_frequency("0011") ==  %{"0" => 2, "1" => 2, "2" => 0, "3" => 0, "4" => 0}
    assert count_frequency("1223334444") ==  %{"0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4}
  end
end
