defmodule Beer do
  def verse(0) do
    "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
 end

  def verse(1) do
    "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def verse(2) do
    "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
  end

  def verse(count) do
    to_binary(count) <> " bottles of beer on the wall, " <> to_binary(count) <> " bottles of beer.\nTake one down and pass it around, " <> to_binary(count - 1) <> " bottles of beer on the wall.\n"
  end

  def sing(start) do
    sing(start, 0)
  end

  def sing(start, finish) when start == finish do
    verse(start) <> "\n"
  end

  def sing(start, finish) do
    verse(start) <> "\n" <> sing(start-1, finish)
  end
end
