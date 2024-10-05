defmodule PrimeWithMap do
  def find_nth_prime(n) do
    Stream.iterate(2, &(&1 + 1))
    |> Stream.filter(&is_prime/1)
    |> Enum.take(n)
    |> Enum.map(&(&1))
    |> List.last()
  end

  defp is_prime(2), do: true

  defp is_prime(number) when number > 1 do
    check_prime(number, 2)
  end

  defp is_prime(_), do: false

  defp check_prime(number, divisor) when divisor * divisor > number, do: true

  defp check_prime(number, divisor) do
    if rem(number, divisor) == 0 do
      false
    else
      next_check = check_prime(number, divisor + 1)
      next_check
    end
  end
end
IO.inspect(PrimeWithMap.find_nth_prime(1000001))
