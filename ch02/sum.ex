defmodule MySum do
  def sum([]), do: 0

  def sum(list) do
    do_sum(list, 0)
  end

  defp do_sum([], acc), do: acc

  defp do_sum([head|tail], acc) when is_number(head) do
    do_sum(tail, acc + head)
  end

  defp do_sum(unrecognized_value, _acc) do
    {:error, "Don't know what to do with #{unrecognized_value}"}
  end
end
