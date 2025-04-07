const mysql = require('mysql2');
const inquirer = require('inquirer').default;
const chalk = require('chalk');
const fs = require('fs');
const path = require('path');

// Setup MySQL connection
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'Sr7123456@',
  database: 'new',
  multipleStatements: true //  Needed for .sql files with multiple queries
});

// Connect to MySQL
connection.connect((err) => {
  if (err) {
    console.log(chalk.red('MySQL connection error:'), err.message);
    process.exit(1);
  }

  console.log(chalk.blueBright('🔗 Connected to MySQL!'));
  askMode();  
});

// 👇 New: Choose mode
function askMode() {
  inquirer.prompt([
    {
      type: 'list',
      name: 'mode',
      message: chalk.yellow('What do you want to do?'),
      choices: ['Run custom SQL query', 'Run a .sql file', 'Exit']
    }
  ]).then(({ mode }) => {
    if (mode === 'Run custom SQL query') {
      askQuery();
    } else if (mode === 'Run a .sql file') {
      askFile();
    } else {
      connection.end();
      console.log(chalk.blue('🔌 Disconnected from MySQL.'));
    }
  });
}

// 👇 Existing logic, untouched
function askQuery() {
  inquirer.prompt([
    {
      type: 'input',
      name: 'query',
      message: chalk.yellow('Enter your SQL query (or type "exit" to go back):')
    }
  ]).then((result) => {
    if (result.query.toLowerCase() === 'exit') {
      return askMode();
    }

    if (/drop|truncate|delete/i.test(result.query)) {
      console.log(chalk.red('❌ This query is not supported.'));
      return askQuery();
    }

    connection.query(result.query, (err, results) => {
      if (err) {
        console.log(chalk.red('❌ Error:'), err.message);
      } else {
        if (Array.isArray(results)) {
          console.table(results);
        } else {
          console.log(chalk.green('✅ Query executed successfully!'));
          console.log('Rows affected:', results.affectedRows);
        }
      }
      askQuery();
    });
  });
}

// 👇 New: Run SQL file
function askFile() {
  inquirer.prompt([
    {
      type: 'input',
      name: 'filePath',
      message: chalk.yellow('Enter the path to your .sql file:')
    }
  ]).then(({ filePath }) => {
    const fullPath = path.resolve(filePath);

    fs.readFile(fullPath, 'utf8', (err, sqlContent) => {
      if (err) {
        console.log(chalk.red('❌ Error reading file:'), err.message);
        return askMode();
      }

      connection.query(sqlContent, (err, results) => {
        if (err) {
          console.log(chalk.red('❌ SQL Error:'), err.message);
        } else {
          console.log(chalk.green('✅ SQL file executed successfully!'));

          if (Array.isArray(results)) {
            console.table(results);
          } else {
            console.log('Rows affected:', results.affectedRows);
          }
        }
        askMode(); // back to main menu
      });
    });
  });
}
