defmodule SphinxEx.Helpers.TernaryTest do
  use ExUnit.Case, async: true

  import SphinxEx.Helpers.Ternary

  test "convert_to_decimal" do
    assert convert_to_decimal(String.duplicate("0", 48) <> "0") == 0
    assert convert_to_decimal(String.duplicate("0", 46) <> "101") == 10
    assert convert_to_decimal(String.duplicate("2", 49)) == 239299329230617526140928
  end

  test "convert_to_ternary" do
    assert convert_to_ternary(0) == String.duplicate("0", 48) <> "0"
    assert convert_to_ternary(10) == String.duplicate("0", 46) <> "101"
  end

  test "calculate_terniary" do
    assert calculate_terniary(0) == "0"
    assert calculate_terniary(1) == "1"
    assert calculate_terniary(2) == "2"
    assert calculate_terniary(3) == "10"
    assert calculate_terniary(4) == "11"
    assert calculate_terniary(5) == "12"
    assert calculate_terniary(6) == "20"
    assert calculate_terniary(7) == "21"
    assert calculate_terniary(8) == "22"
    assert calculate_terniary(9) == "100"
    assert calculate_terniary(10) == "101"
  end
end
