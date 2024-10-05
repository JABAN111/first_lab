defmodule RecurringCycle do
  def longest_cycle(limit), do: find_longest_cycle(limit, 2, 0, 0)

  defp find_longest_cycle(1, _, longest_d, _), do: longest_d

  defp find_longest_cycle(d, current_longest, longest_d, _) when d >= 2 do
    length = cycle_length(d)
    if length > current_longest do
      find_longest_cycle(d - 1, length, d, length)
    else
      find_longest_cycle(d - 1, current_longest, longest_d, length)
    end
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

defmodule RecurringCycleWithoutOptimization do
  def longest_cycle(limit), do: find_longest_cycle(limit, 0, 0)

  defp find_longest_cycle(1, _, longest_d), do: longest_d
  defp find_longest_cycle(d, current_longest, longest_d) do
    length = cycle_length(d)
    if length > current_longest do
      find_longest_cycle(d - 1, length, d)
    else
      find_longest_cycle(d - 1, current_longest, longest_d)
    end
  end

  defp cycle_length(d), do: calculate_length(d, 1, 0, %{})

  defp calculate_length(_, 0, _, _), do: 0
  defp calculate_length(d, remainder, position, remainders) do
    case Map.get(remainders, remainder) do
      nil ->
        new_remainders = Map.put(remainders, remainder, position)
        nextCalc = calculate_length(d, rem(remainder * 10, d), position + 1, new_remainders)
        nextCalc
      prev_position ->
        position - prev_position
    end
  end
end


IO.inspect(RecurringCycleWithoutOptimization.longest_cycle(1000))
IO.inspect(RecurringCycle.longest_cycle(1000))
