
const app = require("express");
const createServer = require("http").createServer(app);
const io = require("socket.io")(createServer);


// const app = express();
// const {httpServer} = createServer(app);
// const io = socketServer(httpServer);



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

createServer.listen(6000);