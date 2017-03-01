defmodule MyListTranslation do
  @list [1,[[2],3]]

  def without_pipe do
    Enum.reverse(Enum.map(List.flatten(@list), &(&1 * &1)))
  end

  def with_pipe do
    @list
    |> List.flatten
    |> Enum.map(&(&1 * &1))
    |> Enum.reverse
  end
end
