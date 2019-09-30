
require('mongoose').model('Person');

var mongoose = require('mongoose');
var Person = mongoose.model('Person');

module.exports = {
  createPerson: function (req, res) {
    var person = req.body;
    new Person({ name: person.name, age: person.age, sex: person.sex, visits:[], drinks:[]})
      .save(function (err) {
        if (err) {
          res.status(504);
          res.end(err);
        } else {
          console.log('New coffee drinker saved.');
          res.end();
        }
      });
  },
  seeResults: function (req, res, next) {
    Person.find({}, function (err, docs) {
      if (err) {
        res.status(504);
        res.end(err);
      } else {
        for (var i = 0; i < docs.length; i++) {
         console.log('person:', docs[i].name);
        }
        res.end(JSON.stringify(docs));
      }
    });
  },
  delete: function( req, res, next) {
    console.log(req.params.id);
    Person.find({ _id: req.params.id}, function(err) {
      if(err) {
        req.status(504);
        req.end();
        console.log(err);
      }
    }).remove(function (err) {
      console.log(err);
      if (err) {
        res.end(err);            
      } else {
        res.end();
      }
    });
  }
}

