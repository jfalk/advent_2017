defmodule AdventDay1 do

  def run(input, steps_ahead \\ 1) do
    IO.puts("steps: #{steps_ahead}")
    ints = input
    |> String.graphemes
    |> Enum.map(fn char -> 
      {int, _} = Integer.parse(char)
      int
    end)

    ints
    |> Stream.with_index
    |> Enum.map(fn({value, idx}) ->
      IO.puts("#{value} #{idx}")
      length = length(ints)
      next = if (idx + steps_ahead) >= length, do: Enum.at(ints, idx + steps_ahead - length), else: Enum.at(ints, idx + steps_ahead)
      IO.puts("#{next}")
      {value, next}
    end)
    |> Enum.reduce(0, fn({value, next}, acc) ->
      IO.puts("#{value} #{next} #{acc}")
      if value == next, do: acc + value, else: acc + 0
    end)
  end

  def halfway(input) do
    run(input, round((input |> String.graphemes |> length)/2))
  end
end
