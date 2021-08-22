defmodule SphinxEx.Helpers.BoardTest do
  use ExUnit.Case, async: true

  import SphinxEx.Helpers.Board

  test "validate_board" do
    assert validate_board("") == [:invalid_size, :entrance_missing, :treasure_missing]

    assert validate_board(String.duplicate("2", 16)) == [
             :invalid_size,
             :entrance_missing,
             :treasure_missing,
             :too_many_walls
           ]
  end

  test "validate_entrance" do
    assert validate_entrance({%{"3" => 1, "4" => 1}, []}) == {%{"3" => 1, "4" => 1}, []}

    assert validate_entrance({%{"3" => 0, "4" => 1}, []}) ==
             {%{"3" => 0, "4" => 1}, [:entrance_missing]}

    assert validate_entrance({%{"3" => 2, "4" => 1}, []}) ==
             {%{"3" => 2, "4" => 1}, [:entrance_missing]}
  end

  test "validate_size" do
    assert validate_size({%{"0" => 48, "4" => 1}, []}) == {%{"0" => 48, "4" => 1}, []}

    assert validate_size({%{"0" => 47, "4" => 1}, []}) ==
             {%{"0" => 47, "4" => 1}, [:invalid_size]}

    assert validate_size({%{"0" => 50, "4" => 1}, []}) ==
             {%{"0" => 50, "4" => 1}, [:invalid_size]}
  end

  test "validate_treasure" do
    assert validate_treasure({%{"3" => 3, "4" => 1}, []}) == {%{"3" => 3, "4" => 1}, []}

    assert validate_treasure({%{"3" => 3, "4" => 0}, []}) ==
             {%{"3" => 3, "4" => 0}, [:treasure_missing]}

    assert validate_treasure({%{"3" => 3, "4" => 2}, []}) ==
             {%{"3" => 3, "4" => 2}, [:treasure_missing]}
  end

  test "validate_walls" do
    assert validate_walls({%{"2" => 15, "4" => 1}, []}) == {%{"2" => 15, "4" => 1}, []}
    assert validate_walls({%{"2" => 14, "4" => 0}, []}) == {%{"2" => 14, "4" => 0}, []}

    assert validate_walls({%{"2" => 16, "4" => 2}, []}) ==
             {%{"2" => 16, "4" => 2}, [:too_many_walls]}
  end

  test "count_frequency" do
    assert count_frequency("0011") == %{"0" => 2, "1" => 2, "2" => 0, "3" => 0, "4" => 0}
    assert count_frequency("1223334444") == %{"0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4}
  end
end
