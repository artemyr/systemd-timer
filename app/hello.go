package main

import (
    "fmt"
    "time"
)

func main() {
    now := time.Now()
    formattedTime := now.Format("02.01.2006 15:04:05")
    fmt.Println("Hello, World!", formattedTime)
}