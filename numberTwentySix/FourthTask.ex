defmodule RecurringCycle do
  def longest_cycle(limit) do
    Stream.iterate(2, &(&1 + 1))
    |> Stream.map(&{&1, cycle_length(&1)})
    |> Enum.take(limit - 1)
    |> Enum.max_by(fn {_, len} -> len end)
    |> elem(0)
  end

  defp cycle_length(d), do: calculate_length(d, 1, 0, %{})

  defp calculate_length(_, 0, _, _), do: 0
  defp calculate_length(d, remainder, position, remainders) do
    case Map.get(remainders, remainder) do
      nil ->
        new_remainders = Map.put(remainders, remainder, position)
        calculate_length(d, rem(remainder * 10, d), position + 1, new_remainders)

      prev_position ->
        position - prev_position
    end
  end
end
IO.inspect(RecurringCycle.longest_cycle(1000))
