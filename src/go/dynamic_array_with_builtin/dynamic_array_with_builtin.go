package main

import (
	"fmt"
	"os"
	"strconv"
)

func main() {
	unparsedPushedItems := os.Args[1]
	pushedItems, _ := strconv.Atoi(unparsedPushedItems)
	fmt.Printf("Testing a push/pop with %v builtin items.\n", pushedItems)

	var myslc []int
	var evenNumberCount = 0
	for i := range pushedItems {
		myslc = append(myslc, i)
	}
	for i := range pushedItems {
		popInt := myslc[i]
		if popInt%2 == 0 {
			evenNumberCount += 1
		}
	}
	fmt.Printf("There were %v even numbers.\n", evenNumberCount)
}
