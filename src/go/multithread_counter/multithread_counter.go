package main

import (
	"fmt"
	"os"
	"strconv"
	"sync"
)

var globalCounter int = 0
var countTo int = 10000000
var counterMutex sync.Mutex

func incrementCounter() {
	for {
		counterMutex.Lock()
		if globalCounter == countTo {
			counterMutex.Unlock()
			return
		}
		globalCounter++
		counterMutex.Unlock()
	}
}

func main() {
	unparsedGoroutineCount := os.Args[1]
	goroutineCount, _ := strconv.Atoi(unparsedGoroutineCount)
	fmt.Printf("Counting to %v with %v goroutines.\n", countTo, goroutineCount)
	var wg sync.WaitGroup

	for i := 0; i < goroutineCount; i++ {
		wg.Go(func() { incrementCounter() })
	}

	wg.Wait()

	fmt.Printf("Counter value: %v\n", globalCounter)
}
