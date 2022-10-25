package main

import (
    "log"
    "time"
    "math/rand"
    "os"
)

func main () {
    log.SetOutput(os.Stdout)

    id := os.Getenv("SUN_CIPHER_ID")

    for i := 0; i <= 10; i++ {
        log.Printf("random number for %s is %d\n", id, rand.Intn(10000))
    }

    for {
        log.Printf("random number for %s is %d\n", id, rand.Intn(10000))

        time.Sleep(10 * time.Second)
    }
}
