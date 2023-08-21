# MusicDB

MusicDB is a personal project aimed at learning about multithreading, JDBC driver, and database management. The Java-based application allows users to perform various operations on a music database, including insert, delete, update, create table, view creation, and function creation. The entire system is operated via the command line interface (CLI), making it easy to use and access.

- MusicDB handles multiple client connections concurrently, allowing for real-time updates and deletions of records without compromising performance.


## Features

- Template SQL Files: The project includes two template SQL files with a pre-designed Music database structure.
- Insert: Add new records to the database for artists, albums, genres, sales, etc.
- Delete: Remove unwanted records from the database.
- Update: Modify existing records with updated information.
- Create Table: Easily create new tables to store different aspects of music data.
- View Creation: Create custom views to retrieve specific data from multiple tables.
- Function Creation: Define custom functions to perform complex operations on the database.

```roomsql
CREATE VIEW album_view AS SELECT album.title, album.price FROM album
CREATE TABLE IF NOT EXISTS employees (id INTEGER PRIMARY KEY, name TEXT)
INSERT INTO employees (id, name) VALUES (1, 'John')
UPDATE employees SET name = 'Jane' WHERE id = 1
DELETE FROM employees WHERE id = 1
CREATE OR REPLACE FUNCTION get_all_artists() RETURNS SETOF artist LANGUAGE SQL AS $$ SELECT * FROM artist; $$;
```

## Technologies Used

- Java: The core language used for the application's backend.
- JDBC: For connecting and interacting with the PostgreSQL database.
- JSqlParser: For parsing and generating SQL queries.
- PostgreSQL: As the database management system.


## Maven Project Dependencies

```xml
<dependency>
            <groupId>org.postgresql</groupId>
            <artifactId>postgresql</artifactId>
            <version>42.5.4</version>
</dependency>
```
```xml
<dependency>
            <groupId>com.github.jsqlparser</groupId>
            <artifactId>jsqlparser</artifactId>
            <version>4.6</version>
</dependency>
```

## Getting Started

- Set up your PostgreSQL database and update the database connection settings in the Java code.
- Compile both the client and server files using the following commands:

```xml
javac MultiThreadedServer.java
```
```xml
javac Client.java
```
- Run the server first using ```java MultiThreadedServer```, and then run the client using ```java Client``` in separate terminal/command prompt windows.
- Multiple clients can connect to MusicDB via the command line and perform concurrent database operations.


## License

This project is licensed under [Apache License 2.0.](https://github.com/hyperFounder/MusicDB/blob/main/LICENSE)

Thank you for using MusicDB! We hope it helps you effectively manage your music collection and perform various operations on your music database. If you have any questions or need assistance, please don't hesitate to reach out to us.

Happy music management! 🎵
