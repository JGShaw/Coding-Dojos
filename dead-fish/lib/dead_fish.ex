defmodule DeadFish do
  def parse(input), do: parse_list(String.codepoints(input), 0)

  def parse_list([], _), do: []
  def parse_list(["i" | tail], num), do: parse_list(tail, num + 1) 
  def parse_list(["d" | tail], num), do: parse_list(tail, num - 1)
  def parse_list(["s" | tail], num), do: parse_list(tail, num * num)
  def parse_list(["o" | tail], num), do: [num | parse_list(tail, num)]
  def parse_list([_ | tail], num), do: parse_list(tail, num)

end
