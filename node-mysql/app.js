const faker = require('faker');
const mysql = require('mysql');

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'adamguinea',
  database: 'sign_up'
});

// SELECTING DATA
var q = 'SELECT count(*) AS total FROM users';

connection.query(q, function (error, results, fields) {
  if(error) throw error;
  console.log(results[0]);
});

// INSERTING DATA
const q = 'INSERT INTO users (email) VALUES ("barney_the_dog@gmail.com")';

connection.query(q, function (error, results, fields) {
  if(error) throw error;
  console.log(results);
});

// 2ND METHOD
const person = {
  email: faker.internet.email(),
  created_at: faker.date.past()
};

connection.query('INSERT INTO users SET ? ', person, function (err, result) {
  if(err) throw err;
  console.log(result);
});

// INSERTING LOTS OF USERS
var data = [];
for(var i = 0; i < 500; i++){
  data.push([
    faker.internet.email(),
    faker.date.past()
  ]);
}

const q = 'INSERT INTO users (email, created_at) VALUES ?'
connection.query(q, [data], function(err, result) {
  console.log(err);
  console.log(result);
});

connection.end();

