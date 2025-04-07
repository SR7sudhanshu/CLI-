const mysql = require('mysql2');
const inquirer = require('inquirer').default;
const chalk = require('chalk');

// Setup MySQL connection
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'username',
  password: 'password',
  database: 'database name'
});

// Connect to MySQL
connection.connect((err) => {
  if (err) {
    console.log(chalk.red('MySQL connection error:'), err.message);
    process.exit(1);
  }

  console.log(chalk.blueBright('🔗 Connected to MySQL!'));
  askQuery();  
});

function askQuery(){
    inquirer.prompt([
        {
          type: 'input',
          name: 'query',
          message: chalk.yellow('Enter your SQL query (or type "exit" to quit):')
        }
      ]).then((result)=>{
        if(result.query.toLowerCase() ==='exit'){
            connection.end();
            console.log(chalk.blue('🔌 Disconnected from MySQL.'));
            return;
        }
        
        if (/drop|truncate|delete/i.test(result.query)) {
            console.log(chalk.red('❌ This query is not supported.'));
            askQuery(); 
            return;
        }

        connection.query(result.query, (err, results) => {
            if (err) {
              console.log(chalk.red('❌ Error:'), err.message);
            } else {
              if (Array.isArray(results)) {
                console.table(results);   //the query is about select and it returns an array of objects
              } else {
                console.log(chalk.green('✅ Query executed successfully!'));
                console.log('Rows affected:', results.affectedRows);  //if the query is about insert or delet it sends affected rows info no array of object is sent here
              }
            }
      
            // Ask again
            askQuery();
          });
      })
}
