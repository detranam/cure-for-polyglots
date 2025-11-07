package main

import (
	"fmt"
	"os"
	"strconv"
	"sync"
	"sync/atomic"
)

var globalCounter atomic.Uint32
var countTo int = 10000000

func incrementCounter() {
	for {
		// Note: This will _not_ always add up to the countTo value, it will end up
		// being more, as the time between the atomic Load and Add allows for
		// switching between routines, thus no longer being a valid check.
		// To validly check, we would need a mutex.
		if globalCounter.Load() >= uint32(countTo) {
			return
		}
		globalCounter.Add(1)
	}
}

func main() {
	unparsedGoroutineCount := os.Args[1]
	goroutineCount, _ := strconv.Atoi(unparsedGoroutineCount)
	fmt.Printf("Counting to %v with %v goroutines using an atomic Uint32.\n", countTo, goroutineCount)
	var wg sync.WaitGroup

	for i := 0; i < goroutineCount; i++ {
		wg.Go(func() { incrementCounter() })
	}

	wg.Wait()

	fmt.Printf("Counter value: %v\n", globalCounter.Load())
}
