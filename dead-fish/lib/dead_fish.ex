defmodule DeadFish do
  def parse(input), do: String.codepoints(input) |> parse_list(0)

  def parse_list([], _), do: []
  def parse_list([head | tail], num) do
    case head do
      "i" -> parse_list(tail, num + 1)
      "d" -> parse_list(tail, num - 1)
      "s" -> parse_list(tail, num * num)
      "o" -> [num | parse_list(tail, num)]
      _   -> parse_list(tail, num)
    end
  end
end
