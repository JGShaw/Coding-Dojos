defmodule HighestScoringWordTest do
   use ExUnit.Case

  @samples [
    {"man i need a taxi up to ubud", "taxi"},
    {"what time are we climbing up the volcano", "volcano"},
    {"take me to semynak", "semynak"},
    {"massage yes massage yes massage", "massage"},
    {"take two bintang and a dance please", "bintang"},
  ]

  test "Sample test" do
    Enum.map @samples, fn {input, output} ->
      assert HighestScoringWord.high(input) == output
    end
  end

  test "Empty test" do
    assert HighestScoringWord.high("") == ""
  end

  test "Calcuate the score for a abc" do
    assert HighestScoringWord.score_for_word("abc") == 6
  end

  test "Calcuate the score for a def" do
    assert HighestScoringWord.score_for_word("def") == 15
  end
end
