const socketIo = require('socket.io-client');
const socket = socketIo('http://localhost:6000');

socket.on('connect', () => {
    console.log('I the client has connected to server now');
});


socket.on('disconnect', () => {
    console.log('I the client was disconnected from server');
});
