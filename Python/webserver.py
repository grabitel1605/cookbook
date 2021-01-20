import socket

# create the socket object
s = socket.socket()
print("Socket Successfully Created!")

# reserve a port number
port = 5580

#bind the port
s.bind(('', port))
print("socket bound to %s " %(port))

#put the socket in listening mode
s.listen(5)
print("Socket is now listening.")

# an endless loop until exit or error
while True:
    # Establish connection with client
    c, addr = s.accept()
    print("Connected to ", addr)
