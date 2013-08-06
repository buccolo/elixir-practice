defmodule Teenager do
  def hey message  do
    cond do
      silence?  message -> "Fine. Be that way!"
      shouting? message -> "Woah, chill out!"
      asking?   message -> "Sure."
      true              -> "Whatever."
    end
  end

  defp silence?(message),  do: String.length(message) == 0
  defp shouting?(message), do: String.upcase(message) == message
  defp asking?(message),   do: String.ends_with? message, "?"
end
