
const app = require("express");
const cors = require("cors");
const createServer = require("http").createServer(app);
const io = require("socket.io")(createServer);


app().route("/").get((request, response) =>{
    response.json("Hey there welcome to socket io backend");
});

io.on("connection", (socket)=>{
    socket.on("backend", (message)=>{
        // printLog("We just established a connection for the id: " + `${socket.id}`);
        printLog(message);
    });
});


io.on("disconnect", (socket)=>{
    // socket.on()
    printLog("Client disconnected with ID " + `${socket.id}`);
});

//
// Listen for a "disconnect" event from the client
io.on('disconnectFromServer', () => {
    console.log(`Client requested to disconnect with ID ${socket.id}`);
    io.disconnect(); // Disconnect the socket
});

function  printLog(text) {
    console.log(text);
}

createServer.listen(6000, "0.0.0.0",() =>{
    printLog("Server is up and running so what's next")
});