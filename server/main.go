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
	defer broker.Close()
	
	dealer, _ := context.NewSocket(zmq.DEALER)
	dealer.Bind("ipc://dealer.ipc")
	defer dealer.Close()
	
	for {
		
	}
}

func server_publisher() {
	context, _zmq.NewContext()
	defer context.Close()
	
	publisher, _ := context.NewSocket(zmq.PUB)
	publisher.Bind("tcp://*:5601")
	defer publisher.Close()
	
	broker, _ := context.NewSocket(zmq.ROUTER)
	dealer.Bind("ipc://dealer.ipc")
	defer broker.Close()
	
	for {
		
	}
	
}

func main() {    
	go server_broker()
	go Server_publisher()
	
	
}
