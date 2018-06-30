// Nginx Worker Purges - > Client(Dealer) -> Server(Router) -> Server(Publish) -> Clients(Subscribe) - > Nginx Worker Purges

package main

import (
    zmq "github.com/pebbe/zmq4/"
    "strings"
)

// TODO: create subroutines for both the broker and publisher.

func server_broker() {
	context, _ := zmq.NewContext()
	defer context.Close()

	broker, _ := context.NewSocket(zmq.ROUTER)
	broker.Bind("tcp://*:5600")
	defer frontend.Close()
	
	// TODO: ipc between broker and publisher
}

func server_publisher() {
	
}

func main() {    
	go server_broker()
	go Server_publisher()
	
	
}
