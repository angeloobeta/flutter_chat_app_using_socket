
const app = require("express");
const cors = require("cors");
const createServer = require("http").createServer(app);
const io = require("socket.io")(createServer);


app().route("/").get((request, response) =>{
    response.json("Hey there welcome to socket io backend");
});

io.on("connection", (socket)=>{
    // socket.on()
    printLog("We just established a connection");
});

function  printLog(text) {
    console.log(text);
}

createServer.listen(6000, "0.0.0.0",() =>{
    printLog("Server is up and running so what's next")
});