package main

import (
	"fmt"
	"os"
	"strconv"
)

func main() {
	unparsedPushedItems := os.Args[1]
	pushedItems, _ := strconv.Atoi(unparsedPushedItems)
	fmt.Printf("Testing a push/pop with %v allocated items.\n", pushedItems)

	var myslc []string
	var charcount = 0
	for i := range pushedItems {
		myslc = append(myslc, strconv.Itoa(i))
	}
	for i := range pushedItems {
		popStr := myslc[i]
		charcount += len(popStr)
	}
	fmt.Printf("There were %v characters written.\n", charcount)
}
