var express = require("express");
var app = express();

//main page
app.get("/", function(req, res){
    res.sendfile('test.html')
})

app.listen(3000, function(){
    console.log("Listening on port 3000!");
});