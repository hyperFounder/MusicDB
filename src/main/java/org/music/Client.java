package org.music;
import java.io.*;
import java.net.*;

class Client {
    private String serverHost =  "127.0.0.1";
    private int serverPort = 8080;
    private Socket aSocket;

    public Client() {
        try{
            this.aSocket = new Socket(InetAddress.getByName(serverHost),serverPort);
        }catch (IOException e){
            System.out.println(e.getMessage());
        }
    }

    public void startClient(){
        // Create and start separate Threads for sending and receiving data
        try{
            Thread sendThread = new Thread(new RequestData());
            Thread receiveThread = new Thread(new ReceiveData());
            sendThread.start();
            receiveThread.start();
            // Wait for both threads to finish before closing the client socket
            sendThread.join();
            receiveThread.join();
            aSocket.close();
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
    }

    class RequestData implements Runnable{
        private PrintWriter writer;

        public RequestData(){
            try{
                this.writer =  new PrintWriter(new OutputStreamWriter(aSocket.getOutputStream(), "UTF-8"), true);
            }catch (Exception e){
                System.out.println(e.getMessage());
            }

        }

        @Override
        public void run(){
            try{
                // Request data to the server
                BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
                String message;
                while ((message = reader.readLine()) != null){
                    writer.println(message);
                }
            }catch (Exception e){
                System.out.println(e.getMessage());
            }
        }
    }

    class ReceiveData implements Runnable{
        private BufferedReader reader;

        public ReceiveData() {
            try{
                this.reader = new BufferedReader(new InputStreamReader(aSocket.getInputStream(), "UTF-8"));
            }catch (Exception e){
                System.out.println(e.getMessage());
            }
        }
        @Override
        public void run(){
            try{
                // Receive data from the server and display it
                String response;
                while ((response = reader.readLine()) != null){
                    System.out.println(response);
                }
            }catch (Exception e){
                System.out.println(e.getMessage());
            }
        }
    }

    public static void main(String[] args) {
        try{
            Client aClient = new Client();
            System.out.println("Welcome to MusicDB Client. Please write SQL queries: ");
            aClient.startClient();
        }catch (Exception e){
            System.out.println(e.getMessage());
        }

    }
}

