defmodule DeadFishTest do
  use ExUnit.Case
  doctest DeadFish

  test "ex1", do: assert DeadFish.parse("ooo") == [0,0,0]
  test "ex2", do: assert DeadFish.parse("ioioio") == [1,2,3]
  test "ex3", do: assert DeadFish.parse("idoiido") == [0,1]
  test "ex4", do: assert DeadFish.parse("isoisoiso") == [1,4,25]
  test "ex5", do: assert DeadFish.parse("codewars") == [0]
  test "no o reuturn empty", do: assert DeadFish.parse("iisii") == []
end
