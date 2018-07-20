defmodule HighestScoringWord do
  def high(str) do
    words = String.split(str, " ")
    pairs = Enum.zip(words, Enum.map(words, &score_for_word/1))
    Enum.max_by(pairs, &(elem(&1, 1)))
    |> elem(0)
  end

  def score_for_word(word) do
    String.to_charlist(word)
    |> Enum.map(&(&1 - (?a - 1)))
    |> Enum.sum
  end
end
