defmodule HighestScoringWord do
  def high(str) do
    words = String.split(str, " ")
    scores = Enum.map(words, &score_for_word/1)
    pairs = Enum.zip(words, scores)
    {max_word, _} = Enum.max_by(pairs, fn {a, b} -> b end)
    max_word
  end

  def score_for_word(word) do
    String.to_charlist(word)
    |> Enum.map(fn char -> char - (?a - 1) end)
    |> Enum.sum
  end

end
