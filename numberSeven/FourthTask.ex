defmodule PrimeWithFor do
  def find_nth_prime(n) do
    primes = for num <- 2..164_858_67, is_prime(num), do: num
    Enum.at(primes, n - 1)
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
IO.inspect(PrimeWithFor.find_nth_prime(1000001))
