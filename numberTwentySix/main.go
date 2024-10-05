package main

import (
	"fmt"
)

func recurringCycleLength(d int) int {
	remainders := make(map[int]int)
	remainder := 1 % d
	position := 0

	for remainder != 0 {
		if pos, found := remainders[remainder]; found {
			return position - pos
		}
		remainders[remainder] = position
		remainder = (remainder * 10) % d
		position++
	}
	return 0
}

func main() {
	longest := 0
	dWithLongestCycle := 0

	for d := 2; d < 1000; d++ {
		length := recurringCycleLength(d)
		if length > longest {
			longest = length
			dWithLongestCycle = d
		}
	}

	fmt.Printf("Ans: %d\n", dWithLongestCycle)
}
