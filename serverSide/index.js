const app = require("express");
const server = require ("http").createServer(express);
const io = require("socket.io")(server);

//Reserved Event
let ON_CONNECTION = 'connection';
let ON_DISCONNECTION  = 'disconnected'

// Main Events
let EVENT_IS_USER_ONLINE = 'check_online';
let EVENT_SINGLE_CHAT_MESSAGE = 'single_chat_message';

// Sub Events
let SUB_EVENT_RECEIVE_MESSAGE = 'receive_message';
let SUB_EVENT_IS_USER_CONNECTED = 'is_user_connected';

//listen port
let listenPort = 6000;

// STATUS
let STATUS_MESSAGE_NOT_SENT = 10001;
let STATUS_MESSAGE_SENT = 10002;

const userMap = new Map();

io.sockets.on((ON_CONNECTION), (socket)  => {
    onEachUserConnection(socket);
});

function onEachUserConnection(socket){
    console.log(`-------------------------`);
    console.log(`connected with socketId: ${socket.id}  and connected user is: ${stringifyToJson(socket.handshake.query)}`)
}

function stringifyToJson(data){
    return JSON.stringify(data);
}

server.listen(listenPort);