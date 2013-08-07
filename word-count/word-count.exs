defmodule Words do
  def count(phrase) do
    words = split phrase

    List.foldl words, HashDict.new, fn(word, word_count) ->
      HashDict.update word_count, word, 1, fn(count) ->
        count + 1
      end
    end
  end

  defp split(phrase) do
    Regex.scan %r/[a-zA-Z0-9]+/, String.downcase(phrase)
  end
end
