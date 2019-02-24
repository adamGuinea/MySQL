const express = require('express');
const app = express();
const mysql = require('mysql');
const bodyParser = require('body-parser');

app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static(__dirname + '/public'));

const connection = mysql.createConnection (config);

const config = {
    host: process.env.DATABASE_URL,
    user: process.env.DATABASE_USER,
    password : process.env.DATABASE_PASSWORD,
    database: process.env.DATABASE_NAME
}

function handleDisconnect() {
    connection.connect(function(err) {             
        if(err) {                                     
            console.log('error when connecting to db:', err.stack);
            setTimeout(handleDisconnect, 2000); 
            console.log('connected as id ' + connection.threadId);
        }                                  
    });                                     
    connection.on('error', function(err) {
        console.log('db error', err);
        if(err.code === 'PROTOCOL_CONNECTION_LOST') { 
            handleDisconnect();                       
        } else {                                      
            throw err;                                  
        }
    });
}

handleDisconnect();
module.exports = connection;

app.get('/', function(req, res){
    const q = 'SELECT COUNT(*) AS count FROM users';
    connection.query(q, function(err, results){
        if(err) throw err;
        const count = results[0].count;
        res.render('home', {count});
    });
});

app.post('/register', function(req, res){
    const person = {
        email: req.body.email
    };
    
    connection.query('INSERT INTO users SET ? ', person, function(err, result){
        if(err) throw err;
        res.redirect('/');
    });
});

app.listen(process.env.PORT, process.env.IP, function(){
    console.log('listening...');
})