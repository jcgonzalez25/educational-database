var express = require('express');

const bodyParser= require('body-parser');
var app = express();
var db = require('./dbperson');
var person = require('./person');

app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

app.get('/', function (req, res) {
  res.sendFile(__dirname + '/index.html');
});

app.post('/person', person.createPerson);
app.get('/person', person.seeResults);
app.delete('/person/:id', person.delete);

app.listen(9457, function () {
  console.log('Example app listening on port 9457!');
});

