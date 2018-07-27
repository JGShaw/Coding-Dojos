defmodule MexicanWave do
  def wave(word) do
    do_the_wave([], String.codepoints(word))
    |> Enum.map(&List.to_string/1)
  end

  def do_the_wave(_, []), do: []
  def do_the_wave(used, [" " | tail]), do: do_the_wave((used ++ [" "]), tail)
  def do_the_wave(used, [head | tail]) do
    [used ++ [String.upcase(head)] ++ tail | do_the_wave(used ++ [head], tail)]
  end
end
