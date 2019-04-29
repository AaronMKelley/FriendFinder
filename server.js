var mysql = require("mysql");
var express = require("express");
var app = express();
// var session = require("express-session");
app.use(express.urlencoded({extended: true}))

app.set('view engine', 'ejs');
app.use(express.static("public"));

var mysql = require('mysql');
var connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  port:3306,
  password: 'password',
  database: 'friend_finder'
});

connection.connect(function () {
	console.log(connection.threadId)
})

app.get('/ejs', function (req, res) {
	connection.query('SELECT * FROM friends', function (error, results, fields) {
		if (error) res.send(error)
		else res.render('pages/index', { friends: results })
	})
});


// app.get('/survey',function(res,req){
//   connection.query('SELECT * FROM questions',function(error,results,fields){
//     if (error) res.send(error)
//     else res.json(results)
//   })
// })


app.get('/', function (req, res) {
  res.render('pages/index')
});

app.get('/survey', function (req, res) {
  res.render('pages/survey');
})

app.post('/enter_name',function(req,res){
  console.log(req.body)

  connection.query('INSERT INTO friends SET ?',{friend_name: req.body.name, picture_link: req.body.pic},function(error,results,fields){
    if (error) 
      return res.send(error)

    var user_id = results.insertId
    var scores = req.body.q.map( function(score, index) { return [user_id, index+1, score] })
    console.log(scores)
    // var data = `(${user_id}, 1, )`
    // res.send('ok')
    var query = connection.query('insert into scores (friend_id,question_id,score) values ?',[scores],function(error,result,fields){
      console.log(query.sql)
      if (error) 
        return res.send(error)
      res.render('pages/survey')
    })
  })
})

// app.post('/enter_name', function(req,res){
//   console.log(req.body)
//   res.json(req.body)
// })
app.get('/api/friends', function(req, res){
	connection.query('SELECT * FROM friends', function (error, results, fields) {
	  if (error) res.send(error)
	  else res.json(results);
	});
});






// app.post('/api/friends',function(req,res){
//     connection.query('SELECT * FROM friends',function(error,results,fields){
//         if (error) res.send(error)
//         else res.json(results);
//     });
// });


app.listen(3001, function () {
  console.log('listening on 3001');
});