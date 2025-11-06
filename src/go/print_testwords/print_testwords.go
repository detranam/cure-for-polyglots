package main

import (
	"fmt"
	"io"
	"os"
)

func main() {
	// There seem to be two ways to process a file like ours:
	// 1. Read the entire file in to memory and print it that way
	// 2. Do batches of byte reads and parse it by '\n'
	fileStream, err := os.Open("testwords.txt")
	if err != nil {
		panic(err)
	}
	fileBuffer := make([]byte, 32)
	wordBuffer := make([]byte, 32)
	wordBufferIndex := 0
	for {
		readBytes, err := fileStream.Read(fileBuffer)
		if err == io.EOF && readBytes == 0 {
			break
		} else if readBytes == 0 {
			break
		}
		for chr := range readBytes {
			wordBuffer[wordBufferIndex] = byte(fileBuffer[chr])
			wordBufferIndex++
			if fileBuffer[chr] == '\n' {
				fmt.Print(string(wordBuffer[:]))
				wordBuffer = make([]byte, 32)
				wordBufferIndex = 0
			}
		}
	}

}
