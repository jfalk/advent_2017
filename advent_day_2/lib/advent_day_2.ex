defmodule AdventDay2 do
  def run(input) do
    matrix = make_matrix(input)
    |> Enum.map(fn(row) ->
      Enum.max(row) - Enum.min(row)
    end)
    |> Enum.sum
  end

  def make_matrix(input) do
    input
    |> String.split("\n")
    |> Enum.map(fn(line) ->
      line
      |> String.split(~r/\s/)
      |> Enum.map(fn(number) ->
        {integer, _} = Integer.parse(number)
        integer
      end)
    end)
  end
end
