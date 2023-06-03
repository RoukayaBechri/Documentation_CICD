---
sidebar_position: 1
---

# Networking

## OSI layers role

### Explain the main difference between OSI model and TCP/IP model

The main difference between the OSI (Open Systems Interconnection) model and the TCP/IP model lies in their approach to network protocols and layering.

The OSI model is a comprehensive and conceptual framework that helps in understanding networking principles, while the TCP/IP model is a practical model that emerged from real-world internet protocols and has become the foundation of modern internet communication.

### Explain the application service layers and what happen when you write your url and click enter

The application service layers, also known as the upper layers of the OSI (Open Systems Interconnection) model or the application layer in the TCP/IP model, provide services and protocols for specific applications that interact directly with users or application software. When you write a URL (Uniform Resource Locator) in your web browser and click enter, several processes occur at the application layer:

1- URL parsing and DNS resolution: The browser parses the URL, resolves the domain name to an IP address using DNS, and establishes a TCP connection to the web server.

2- HTTP request and server processing: The browser sends an HTTP request to the web server, specifying the resource path and method, and the server processes the request to generate an HTTP response.

3- Rendering and display: The browser interprets the received response, renders the webpage by processing HTML, CSS, and JavaScript, and displays the final webpage to the user.

### Explain what is a domain name and the relation between the DNS and the @IP address.

Domain name: A human-readable label used to identify websites or networks on the internet, such as "example.com."

DNS: The Domain Name System translates domain names into their corresponding IP addresses, acting as a directory or phonebook of the internet.

Relation: DNS enables the resolution of domain names to IP addresses, allowing users to access websites by typing domain names instead of numerical IP addresses.

### Explain the TCP interconnection between your local host and the server.

The TCP interconnection between a local host and a server involves the following steps:

TCP connection establishment: The local host initiates a TCP connection with the server using a three-way handshake process.

Data transmission: Once the TCP connection is established, data is transmitted between the local host and the server in a reliable and ordered manner.

TCP connection termination: After the data transfer is complete, the TCP connection is terminated using a four-way handshake process to ensure a graceful closure of the connection.

### How data transfer over internet (TCP Packet)

When the sending TCP wants to establish connections, it sends a segment called a SYN to the peer TCP protocol running on the receiving host. The receiving TCP returns a segment called an ACK to acknowledge the successful receipt of the segment. The sending TCP sends another ACK segment, then proceeds to send the data.
