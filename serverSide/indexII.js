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

io.sockets.on(ON_CONNECTION, (socket)  => {
    onEachUserConnection(socket);
    // let numberOfConnectedUser = 0
    // numberOfConnectedUser += 1;
    // printLog(numberOfConnectedUser + " has connected");
});

function onEachUserConnection(socket){
    printLog(`---------------------------------------------------------------------------------------------`);
    printLog(`connected with socketId: ${socket.id}  and connected user is: ${stringifyToJson(socket.handshake.query)}`);
    const from_user_id = socket.handshake.query.from;
    const userMapVar = {socketId: socket.id};
    printLog("This is to print a map for socketId: " + userMapVar.socketId);
    addUserMap(from_user_id, userMapVar);
    // printLog(userMap);
    onMessage(socket);
    onlineUsers();
    checkOnline(socket);
    onDisconnect(socket);
}

//Disconnect
function onDisconnect(socket){
    socket.on(ON_DISCONNECTION, () =>{
        printLog(`The disconnected socketId is: ${socket.id}  and disconnected user is: ${stringifyToJson(socket.handshake.query)}`);
        removeUserWithSocketIdFromMap(socket.id);
        socket.removeAllListeners(SUB_EVENT_RECEIVE_MESSAGE);
        socket.removeAllListeners(SUB_EVENT_IS_USER_CONNECTED);
        socket.removeAllListeners(ON_DISCONNECTION);
    })
}

// Check Online Status
function checkOnline(socket){
    socket.on(EVENT_IS_USER_ONLINE, (chatUserDetails) => {
        onlineCheckHandler(socket, chatUserDetails);
    });
}



// Handlers

// Online Check Handler
function onlineCheckHandler(socket, chatUserDetails){
    let to_user_id = chatUserDetails.to;
    printLog("Checking online user" + to_user_id);
    let to_user_socket_id = getSocketIdFromMapForThisUser(to_user_id);
    // let isOnline = undefined === to_user_socket_id;
    chatUserDetails.toUserOnlineStatus = undefined !== to_user_socket_id;
    sendBackToClient(socket, SUB_EVENT_IS_USER_CONNECTED, chatUserDetails)
}

// Single Chat Handler
function singleChatHandler(socket, chatMessage) {
    printLog('onMessage: ' + stringifyToJson(chatMessage));
    let to_user_id = chatMessage.id;
    let from_user_id = chatMessage.id;
    printLog("To UserId is: " + to_user_id + "From UserID: " + from_user_id);
    let to_user_socket_id = getSocketIdFromMapForThisUser(to_user_id);
    if(to_user_id === null){
        printLog("Chat User  is not connected")
        chatMessage.toUserOnlineStatus  = false;
        return;}

    chatMessage.toUserOnlineStatus = true;
    sentToConnectedSocket(socket,  to_user_socket_id, SUB_EVENT_RECEIVE_MESSAGE, chatMessage);
}

function onlineUsers(){
    printLog(`Online users: ${userMap.length}`);
}

function addUserMap(userId, socketId){
    userMap.set(userId, socketId);
    // userMap.forEach((key, value) =>{
    //     printLog("What's the key: " + key +  " Abeg and value: "+ value);
    // });


}


function stringifyToJson(data){
    return JSON.stringify(data);
}


function onMessage(socket){
    socket.on(EVENT_SINGLE_CHAT_MESSAGE, async(chatMessage) => {
        await singleChatHandler(socket, chatMessage);
    });
}



//Send Message Back to Client
function sendBackToClient(socket, event, chatMessage){
    socket.emit(event, stringifyToJson(chatMessage))
}

// Send Message to Connected Socket
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
    printLog("Deleting User:" + socketId);
    let toDeleteUser;
    for(let key of userMap){
        let userMapValue = key[1];
        if(userMapValue.socketId === socketId){
            toDeleteUser = key[0];
        }
    }
    printLog("Deleting user .... " + toDeleteUser);
    if(undefined !== toDeleteUser){
        userMap.delete(toDeleteUser);
    }
    printLog("Usermap "+ userMap);
    onlineUsers();
}

function printLog(text){
    console.log(text);
}

server.listen(listenPort);