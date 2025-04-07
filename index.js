const mysql = require('mysql2');
const inquirer = require('inquirer').default;
const chalk = require('chalk');

// Create connection
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'Sr7123456@',
    database: 'new'
  });

  connection.connect((err) => {
    if (err) {
      console.log(chalk.red('Error connecting to MySQL:'), err.message);
      return;
    }
    console.log(chalk.green('Connected to MySQL!'));
    runCLI();
  });


// CLI Menu
function runCLI() {
    inquirer.prompt([
      {
        type: 'list',
        name: 'option',
        message: 'Choose an action:',
        choices: ['Show all users', 'Insert user', 'Exit']
      }
    ]).then((answer) => {
      switch (answer.option) {
        case 'Show all users':
          connection.query('SELECT * FROM users', (err, results) => {
            if (err) throw err;
            console.table(results);
            runCLI();
          });
          break;
  
        case 'Insert user':
          inquirer.prompt([
            { type: 'input', name: 'name', message: 'Enter name:' },
            { type: 'input', name: 'email', message: 'Enter email:' }
          ]).then((user) => {
            connection.query('INSERT INTO users (name, email) VALUES (?, ?)', [user.name, user.email], (err) => {
              if (err) throw err;
              console.log(chalk.green('User inserted successfully!'));
              runCLI();
            });
          });
          break;
  
        case 'Exit':
          connection.end();
          console.log(chalk.blue('Disconnected from MySQL.'));
          break;
      }
    });
  }
