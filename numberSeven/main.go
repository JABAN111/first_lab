package main

import (
	"fmt"
	"math"
)

func isPrime(number int) bool {
	if number < 2 {
		return false
	}
	for i := 2; i <= int(math.Sqrt(float64(number))); i++ {
		if number%i == 0 {
			return false
		}
	}
	return true
}

func findNthPrime(n int) int {
	count := 0
	num := 1
	for count < n {
		num++
		if isPrime(num) {
			count++
		}
	}
	return num
}

func main() {
	var input int
	fmt.Scan(&input)
	nthPrime := findNthPrime(input)
	// nthPrime := findNthPrime(1000001)
	fmt.Println(nthPrime)
}
