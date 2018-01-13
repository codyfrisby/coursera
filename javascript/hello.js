#!/usr/bin/env node

const http = require('http'); // Loads the http module

http.createServer((request, response) => {

    // 1. Tell the browser everything is OK (Status code 200), and the data is in plain text
    response.writeHead(200, {
        'Content-Type': 'text/plain'
    });

    // 2. Write the announced text to the body of the page
    response.write("Hello node.js World!\n");
    response.write("Does this work?\n");
    response.write("Yep, Sure Does!");
    response.write("Now I'm adding node code in Atom... But how do I run it?");


    // 3. Tell the server that all of the response headers and body have been sent
    response.end();

}).listen(1337); // 4. Tells the server what port to be on

console.log("Server is listening at localhost:1337") // prints to console
