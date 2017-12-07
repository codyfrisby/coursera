#!/usr/bin/env node

// import http package
var http = require("http");
const handler = function(request, response) {
  response.writeHead(200, {"Content-Type": "text/plain"});
  response.write("Hello node.js World\n");
  response.write("Listening on 8888");
  response.end();
}
// create server @ 8888
http.createServer(handler).listen(8888);
console.log("Server is listening at localhost:8888")
