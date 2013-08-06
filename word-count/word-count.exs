defmodule Words do
  def count phrase do
    words = String.split phrase, " "

    List.foldl words, HashDict.new, fn(word, word_count) ->
      clean_word = clean(word)

      if is_blank? clean_word do
        word_count
      else
        HashDict.update word_count, clean_word, 1, fn(count) ->
          count + 1
        end
      end
    end
  end

  def clean word  do
    codepoints = String.codepoints String.downcase word

    List.foldl codepoints, "", fn(char, clean_word) ->
      if is_valid? char do
        clean_word <> char
      else
        clean_word
      end
    end
  end

  defp is_valid? char do
    Regex.match?(%r/[a-zA-Z0-9]/, char)
  end

  defp is_blank? word do
    String.length(word) == 0
  end
end
