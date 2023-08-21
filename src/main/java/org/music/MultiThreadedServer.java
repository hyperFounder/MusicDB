package org.music;
import net.sf.jsqlparser.JSQLParserException;
import net.sf.jsqlparser.parser.CCJSqlParser;
import net.sf.jsqlparser.parser.CCJSqlParserUtil;
import net.sf.jsqlparser.statement.create.function.CreateFunction;
import net.sf.jsqlparser.statement.create.index.CreateIndex;
import net.sf.jsqlparser.statement.create.table.CreateTable;
import net.sf.jsqlparser.statement.create.view.CreateView;
import net.sf.jsqlparser.statement.delete.Delete;
import net.sf.jsqlparser.statement.insert.Insert;
import net.sf.jsqlparser.statement.select.Select;
import net.sf.jsqlparser.statement.truncate.Truncate;
import net.sf.jsqlparser.statement.update.Update;
import java.io.*;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.sql.*;



public class MultiThreadedServer{
    private ServerSocket serverSocket = null;
    private Connection connection = null;
    private String username = "ryanribeiro"; // db username
    private String password = ""; // db password. If there's no password, leave empty.
    private String url = "jdbc:postgresql://localhost:5432/Music"; // jdbc:postgresql://host:port/database

    public void startServer(){
        try{
            Class.forName("org.postgresql.Driver");
            // backlog maximum number of pending connections on the socket.
            serverSocket = new ServerSocket(8080, 500, InetAddress.getByName("127.0.0.1"));
            connection = DriverManager.getConnection(url, username, password);
            System.out.println("Welcome to MusicDB Server. Server started. Connection details: " +
                    serverSocket.getInetAddress() + "/" +
                    serverSocket.getLocalPort()
            );
            while(true){
                // Accept incoming client connections
                Socket socket = serverSocket.accept();
                // Create and start a new thread to handle each client
                ClientHandler handler = new ClientHandler(socket);
                handler.start();
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
    }

   private class ClientHandler extends Thread{
        private Socket aSocket;
        private PrintWriter writer;
        private BufferedReader reader;
        // The PrintWriter class of the java.io package
        // can be used to write output data in a commonly readable form (text).
        public ClientHandler(Socket aSocket) {
            try{
                this.aSocket = aSocket;
                // autoFlush: specifies whether the buffered output should be flushed automatically
                // when the buffer is filled, or whether an exception should be
                // raised to indicate the buffer overflow.
                this.writer = new PrintWriter(new OutputStreamWriter(aSocket.getOutputStream(), "UTF-8"), true);
                this.reader = new BufferedReader(new InputStreamReader(aSocket.getInputStream(), "UTF-8"));
            }catch (Exception e){
                System.out.println(e.getMessage());
            }
        }
        @Override
        public void run(){
            try{
                // Handle client communication
                String query;
                while ((query = reader.readLine()) != null){
                    System.out.println("Received SQL query from client " +
                            aSocket.getInetAddress().getHostAddress()
                            + ": " + query);
                    executeQuery(query);
                }
            }catch (Exception e){
                writer.println(e.getMessage());
            }
            finally {
                // A finally contains all the crucial statements regardless of the exception occurs or not.
                // The finally block in java is used to put important codes
                // such as clean up code e.g. closing the file or closing the connection.
                try{
                    reader.close();
                    writer.close();
                    aSocket.close();
                }catch (IOException e){
                    System.out.println(e.getMessage());
                }
            }
        }
       /**
        * For SQL DML (insert, delete, update), stmt.executeUpdate() is used.
        * @param query represents either a insert, delete or update query
        * @return count: number of rows updated.
        * @throws SQLException
        */
        private int resolveSQL(String query){
            try{
                Statement statement = connection.createStatement(); // creating SQL statement
                int count = statement.executeUpdate(query);
                statement.close();
                return count;
            }catch (SQLException e){
                writer.println(e.getMessage());
                return 0;
            }
        }

       /**
        * // JSqlParser is a Java SQL parser that can help you check the query's syntactical correctness.
        * @param sqlQuery
        * @return true if sqlQuery is valid
        */
       public boolean isQueryValid(String sqlQuery) {
           try {
               CCJSqlParserUtil.parse(sqlQuery);
               return true;
           } catch (JSQLParserException e) {
               return false;
           }
       }

       /**
        * Parse the SQL query, analyze its type and send the result to the client
        * @param query: the client SQL query.
        */
       public void executeQuery(String query){
           try{
               Statement statement = connection.createStatement(); // creating SQL statement
               net.sf.jsqlparser.statement.Statement stmt = CCJSqlParserUtil.parse(query);

               if (stmt instanceof Insert){
                   writer.println("record(s) inserted " + resolveSQL(query));
               } else if (stmt instanceof Update) {
                   writer.println("record(s) updated: " + resolveSQL(query));
               }
               else if (stmt instanceof Delete) {
                   writer.println("record(s) deleted: " + resolveSQL(query));
               }
               else if (stmt instanceof CreateTable) {
                   statement.executeUpdate(query);
                   writer.println("CREATE TABLE");
               }
               else if (stmt instanceof CreateView) {
                   statement.executeUpdate(query);
                   writer.println("CREATE VIEW");
                   retrieveViewsFromDB();
               }
               else if (query.contains("function") || query.contains("FUNCTION")) {
                   createFunction(query);
               }
               else {
                   writer.println("We only support the following operations: " +
                           "Insert, Delete, Update, Create Table, View Creation, Function Creation\n");
               }
           }catch (Exception e){
               writer.println(e.getMessage());
           }
       }
       public void createFunction(String sql){
           try{
               Statement stmt = connection.createStatement();
               stmt.execute(sql);
               writer.println("CREATE FUNCTION");
           }catch (Exception e){
               writer.println(e.getMessage());
           }

       }
       public void retrieveViewsFromDB(){
           try{
               Statement statement = connection.createStatement();
               // SQL query to retrieve all views from the database
               String getViewsQuery = "select table_name from INFORMATION_SCHEMA.views WHERE table_schema = ANY (current_schemas(false))";
               // Execute the SELECT query to retrieve view names
               ResultSet resultSet = statement.executeQuery(getViewsQuery);
               // Print the names of all views in the database
               while (resultSet.next()) {
                   String viewName = resultSet.getString("table_name");
                   writer.println("View: " + viewName);
               }
           }catch (Exception e){
               writer.println(e.getMessage());
           }
       }
    }


    public static void main(String[] args) {
        MultiThreadedServer server = new MultiThreadedServer();
        server.startServer();
    }




}
