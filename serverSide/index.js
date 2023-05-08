const app = require("express");
const server = require ("http").createServer(app);
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
    console.log(`connected with socketId: ${socket.id}  and connected user is: ${stringifyToJson(socket.handshake.query)}`);
    var from_user_id = socket.handshake.query.from;
    var userMapVar = {socketId: socket.id};
    addUserMap(from_user_id, userMapVar);
    printLog(userMap);
    onMessage();
    onlineUsers();
    checkOnline();
    onDisconnect(socket);
}

function checkOnline(socket){
    socket.on(EVENT_IS_USER_ONLINE, (chatUserDetails) => {
        onlineCheckHandler(socket, chatUserDetails);
    })
}


function onlineCheckHandler(socket, chatUserDetails){
    let to_user_id = chatUserDetails.to;
    print("Checking online user" + to_user_id);
    let to_user_socket_id = getSocketIdFromMapForThisUser(to_user_id);
    // let isOnline = undefined === to_user_socket_id;
    chatUserDetails.toUserOnlineStatus = undefined !== to_user_socket_id;
    sendBackToClient(socket, SUB_EVENT_IS_USER_CONNECTED, chatUserDetails)

}

function onlineUsers(){
    printLog(`Online users: ${userMap.length}`);
}

function addUserMap(userId, socketId){
    userMap.set(userId, socketId);
}

function onDisconnect(socket){
    socket.on(ON_DISCONNECTION, () =>{
        printLog(`disconnected with socketId: ${socket.id}  and disconnected user is: ${stringifyToJson(socket.handshake.query)}`);
        removeUserWithSocketIdFromMap(socket.id);
        socket.removeAllListeners(SUB_EVENT_RECEIVE_MESSAGE);
        socket.removeAllListeners(SUB_EVENT_IS_USER_CONNECTED);
        socket.removeAllListeners(ON_DISCONNECTION);
    })
}

function stringifyToJson(data){
    return JSON.stringify(data);
}

server.listen(listenPort);


function onMessage(){
    socket.on(EVENT_SINGLE_CHAT_MESSAGE, (chatMessage) => {
        singleChatHandler(chatMessage);
    })
}

function singleChatHandler(socket, chatMessage) {
    printLog('onMessage: ' + stringifyToJson(chatMessage));
    let to_user_id = chatMessage.id;
    let from_user_id = chatMessage.id;
    print("To UserId is: " + to_user_id + "From UserID: " + from_user_id);
    let to_user_socket_id = getSocketIdFromMapForThisUser(to_user_id);
    if(to_user_id === null){
        print("Chat User  not conected")
        chatMessage.toUserOnlineStatus  = false;
        return;
    }
    chatMessage.toUserOnlineStatus = true;
    sentToConnectedSocket(socket,  to_user_socket_id, SUB_EVENT_RECEIVE_MESSAGE, chatMessage);
}


function sendBackToClient(socket, event, chatMessage){
    socket.emit(event, stringifyToJson(chatMessage))
}
function sentToConnectedSocket(socket,  to_user_socket_id, event, chatMessage){
    socket.to(to_user_socket_id).emit(event, stringifyToJson(chatMessage));
}

function getSocketIdFromMapForThisUser(to_user_id){
    let userMapVar = userMap.get(`S{to_user_id}`);
    if(to_user_id === null){
        return undefined;
    }

    return userMapVar.socketId;
}

function removeUserWithSocketIdFromMap(socketId){
    print("Deleting User:" + socketId);
    let toDeleteUser;
    for(let key of userMap){
        let userMapValue = key[1];
        if(userMapValue.socketId === socketId){
            toDeleteUser = key[0];
        }
    }
    print("Deleting user .... " + toDeleteUser);
    if(undefined !== toDeleteUser){
        userMap.delete(toDeleteUser);
    }
    print("Usermap "+ userMap);
    printOnlineUsers();
}

function printLog(text){
    console.log(text);
}