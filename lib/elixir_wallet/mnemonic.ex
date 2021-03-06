defmodule Mnemonic do

  alias GenerateIndexes

  def get_wordlist do
    {:ok,words} = File.read "priv/wordlist.txt"
    String.replace(words, "\n", ",")
    |>String.split(",")
    |>List.to_tuple
  end

  def generate_phrase indexes do
    phrase = ""
    phrase = for n <- indexes do
      phrase <> elem(get_wordlist(),n) <> " "
    end
    phrase |> List.to_string |> String.trim
  end

end
