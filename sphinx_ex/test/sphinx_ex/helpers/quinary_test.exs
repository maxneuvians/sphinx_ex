defmodule SphinxEx.Helpers.QuinaryTest do
  use ExUnit.Case, async: true

  import SphinxEx.Helpers.Quinary

  test "convert_to_decimal" do
    assert convert_to_decimal(String.duplicate("0", 48) <> "0") == 0
    assert convert_to_decimal(String.duplicate("0", 46) <> "101") == 26

    assert convert_to_decimal(String.duplicate("5", 49)) ==
             22_204_460_492_503_132_502_621_863_395_983_360
  end

  test "convert_to_quinary" do
    assert convert_to_quinary(0) == String.duplicate("0", 48) <> "0"
    assert convert_to_quinary(26) == String.duplicate("0", 46) <> "101"
  end

  test "calculate_quinary" do
    assert calculate_quinary(0) == "0"
    assert calculate_quinary(1) == "1"
    assert calculate_quinary(2) == "2"
    assert calculate_quinary(3) == "3"
    assert calculate_quinary(4) == "4"
    assert calculate_quinary(5) == "10"
    assert calculate_quinary(6) == "11"
    assert calculate_quinary(7) == "12"
    assert calculate_quinary(8) == "13"
    assert calculate_quinary(9) == "14"
    assert calculate_quinary(10) == "20"
  end
end
