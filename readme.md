# 🛠️ MySQL CLI Application

A Command-Line Interface (CLI) application that allows users to interact with a MySQL database directly from the terminal. Users can execute custom SQL queries or run SQL commands from `.sql` files.

---

## 🚀 Features

- **Execute Custom Queries**: Input and run any SQL command directly.
- **Run SQL Files**: Execute multiple SQL commands from a `.sql` file.
- **Secure Operations**: Prevents execution of potentially destructive commands like `DROP`, `TRUNCATE`, and `DELETE`.
- **User-Friendly Interface**: Provides clear prompts and feedback using `chalk` for colored terminal output.
- **Result Display**: Formats and displays query results in a readable table format using `console.table()`.

---

## 🛠️ Installation & Setup

### 1. Clone the Repository

```bash
git clone https://github.com/SR7sudhanshu/CLI-.git
cd CLI-
```

### 2. Install Dependencies

Ensure you have Node.js installed. Then, install the required packages:

```bash
npm install
```

This will install:

- `mysql2`: A MySQL client for Node.js.
- `inquirer`: A collection of common interactive command-line user interfaces.
- `chalk`: Terminal string styling done right.

### 3. Configure the Database

Create a `.env` file in the root directory and add your MySQL database credentials:

```env
DB_HOST=localhost
DB_USER=your_username
DB_PASSWORD=your_password
DB_NAME=your_database_name
```

Replace `your_username`, `your_password`, and `your_database_name` with your actual MySQL credentials.

---

## 🏃‍♂️ Running the Application

Start the CLI application with:

```bash
node index.js
```

Upon launching, you'll be presented with the following options:

1. **Run a Custom SQL Query**: Enter any SQL command directly.
2. **Run a `.sql` File**: Provide the path to a `.sql` file containing SQL commands.
3. **Exit**: Terminate the application.

---

## 📝 Usage

### Running Custom SQL Queries

1. Select the "Run custom SQL query" option.
2. Enter your SQL command when prompted.
3. The application will execute the command and display the results.

> **Note**: Commands like `DROP`, `TRUNCATE`, and `DELETE` are restricted for safety.

### Executing SQL Files

1. Select the "Run a `.sql` file" option.
2. Enter the path to your `.sql` file when prompted (e.g., `./queries/schema.sql`).
3. The application will read and execute the commands from the file.

> **Important**: Ensure the `.sql` file contains valid SQL statements.

---

## 🛡️ Safety Measures

- **Restricted Commands**: To prevent accidental data loss, commands such as `DROP`, `TRUNCATE`, and `DELETE` are not supported.
- **File Validation**: When executing SQL files, the application verifies that the provided path is a valid file and not a directory.

---

## 🐞 Error Handling

The application provides clear error messages for:

- MySQL connection issues.
- Invalid SQL syntax or unsupported commands.
- File reading errors, such as providing a directory instead of a file.

---

## 📂 Project Structure

```plaintext
database_project_01/
├── ER_DIAGRAM/
│   └── Screenshot 2025-04-06 103011.png
├── queries/
│   ├── schema.sql        # SQL schema for creating tables
│   ├── datainsert.sql    # SQL script for inserting sample data
│   ├── queries.sql       # Example SQL queries
├── .env                  # Environment variables for database credentials
├── index.js              # Main application file
├── package.json          # Project metadata and dependencies
├── readme.md             # Project documentation
```

---
## 👥 Contributors

- **Student Name**: Sudhanshu Raj
- **Instructor Name**: Dr. Dinesh
- **Course Name**: DBMS

---