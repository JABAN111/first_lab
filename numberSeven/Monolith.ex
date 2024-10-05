# хвостовая рекурсия
defmodule PrimeFinderWithTailCalling do
  def find_nth_prime(n), do: find_prime(n, 2, 0)

  defp find_prime(target_count, current_number, prime_count) when prime_count == target_count,
    do: current_number - 1

  defp find_prime(target_count, current_number, prime_count) do
    if prime_count == target_count do
      current_number - 1
    else
      if is_prime(current_number) do
        find_prime(target_count, current_number + 1, prime_count + 1)
      else
        find_prime(target_count, current_number + 1, prime_count)
      end
    end
  end

  def is_prime(number) when number > 2, do: check_prime(number, 2)
  def is_prime(2), do: true
  def is_prime(_), do: false

  defp check_prime(number, divider) when divider * divider > number, do: true

  defp check_prime(number, divider) when rem(number, divider) == 0, do: false
  defp check_prime(number, divider), do: check_prime(number, divider + 1)
end

# Найдем 10001-е простое число
defmodule PrimeFinderWithoutOptimization do
  def find_nth_prime(n) do
    find_prime(2, n, 0)
  end

  defp find_prime(current_number, target_count, prime_count) do
    if prime_count == target_count do
      current_number - 1
    else
      if is_prime(current_number) do
        next_prime = find_prime(current_number + 1, target_count, prime_count + 1)
        next_prime
      else
        next_prime = find_prime(current_number + 1, target_count, prime_count)
        next_prime
      end
    end
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

IO.inspect(PrimeFinderWithTailCalling.find_nth_prime(1000001))
IO.inspect(PrimeFinderWithoutOptimization.find_nth_prime(1000001))
