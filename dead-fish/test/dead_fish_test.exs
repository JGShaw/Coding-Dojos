defmodule DeadFishTest do
  use ExUnit.Case
  doctest DeadFish

  test "ex1" do
    assert DeadFish.parse("ooo") == [0,0,0]
  end

  test "ex2" do
    assert DeadFish.parse("ioioio") == [1,2,3]
  end

  test "ex3" do
    assert DeadFish.parse("idoiido") == [0,1]
  end
  test "ex4" do
    assert DeadFish.parse("isoisoiso") == [1,4,25]
  end
  test "ex5" do
    assert DeadFish.parse("codewars") == [0]
  end
end
