defmodule MexicanWaveTest do
  use ExUnit.Case
  test "hello" do
    assert MexicanWave.wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
  end
  
  test "he ll o" do
    assert MexicanWave.wave("he ll o") == ["He ll o", "hE ll o", "he Ll o", "he lL o", "he ll O"]
  end
  
  test " gap" do
    assert MexicanWave.wave(" gap") == [" Gap", " gAp", " gaP"]
  end
  
  test "empty string" do
    assert MexicanWave.wave("") == []
  end
end
