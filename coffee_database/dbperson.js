
var mongoose = require('mongoose');  

var Person = new mongoose.Schema({
	name: String,
	age: Number,
        sex: String,
        visits: Object,
        drinks: Object
});

mongoose.model('Person', Person);  
mongoose.connect('mongodb://localhost:27017/coffee'); 

console.log('Connected.');
