// Nginx Worker Purges - > Client(Dealer) -> Server(Router) -> Server(Publish) -> Clients(Subscribe) - > Nginx Worker Purges

package main

import (
    zmq "github.com/pebbe/zmq4/"
    "strings"
)

// TODO: create subroutines for both the broker and publisher.

func main() {    
    // Create the broker socket.
    broker, _ := zmq.NewSocket(zmq.ROUTER)
    defer broker.Close()
    broker.Bind("tcp://*:5600")
    
    // Create publisher socket.
    publisher, _ := zmq.NewSocket(zmq.PUB)
	defer publisher.Close()
	publisher.Bind("tcp://*:5601")
    
    // Start MAIN control loop.
    for {
        
    }
}
