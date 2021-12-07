defmodule AdventOfCode.Day01 do
  def part1(args) do
    args
    |> Enum.with_index()
    |> Enum.map(fn {v, i} ->
      new_object = %{element: v, msg: ""}
      new_object |> get_message(args, i)
    end)
    |> count_number_of_appearances("(increased)")
  end

  def get_message(object, _list, index) when index == 0 do
    object |> Map.put(:msg, "(N/A - no previous measurement)")
  end

  def get_message(object, list, index) do
    %{:element => element} = object
    previos_element = Enum.at(list, index - 1)
    msg = (element > previos_element && "(increased)") || "(decreased)"
    object |> Map.put(:msg, msg)
  end

  def count_number_of_appearances(list, label) do
    list
    |> Enum.filter(fn %{:msg => msg} -> msg == label end)
    |> length
  end

  def part2(args) do
  end
end
