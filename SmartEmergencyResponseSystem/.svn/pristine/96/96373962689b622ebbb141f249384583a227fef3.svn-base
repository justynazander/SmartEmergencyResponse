package netaux;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.nio.ByteBuffer;

/**
 *
 * @author David Escobar Sanabria
 */
public class UDPServer extends Thread {

    private DatagramSocket socket = null;
    private int port = 9001;
    private byte[] byteArray;
    private boolean isRunning = false;

    /**
     *
     * @param _port
     */
    public UDPServer(int _port) {
        //kernel = _kernel;
        port = _port;

        //setPriority(MIN_PRIORITY);

        //kernel.joutln("UDP service initilized, port: " + port);

    }

    public UDPServer() {
        //kernel = _kernel;
        port = 9090;

        //setPriority(MIN_PRIORITY);

        //kernel.joutln("UDP service initilized, port: " + port);

    }

    public void startServer() {
        start();
    }

    public byte[] getData() {

        byte[] buffer = new byte[1202];
        try {
            socket = new DatagramSocket(port);
            socket.setSoTimeout(1000);

        } catch (SocketException ex) {
            System.out.println("UDP socket could not be created");
            Logger.getLogger(UDPServer.class.getName()).log(Level.SEVERE, null, ex);
        }

        DatagramPacket packet = new DatagramPacket(buffer, buffer.length);
        try {

            socket.receive(packet);
            byteArray = new byte[packet.getLength()];
            String stOut = new String(packet.getData()) ; 
            System.out.println(stOut); 
            
            
            
            for (int k = 0; k < packet.getLength(); k++) {
                byteArray[k] = packet.getData()[k];
                //System.out.print(" "+ packet.getData()[k]);
            }


            //double d = toDouble(byteArray);
            //System.out.print("len " + packet.getLength());
            //System.out.println(" val= " + d);

        } catch (IOException ex) {
            //System.out.println("UDP time out");
            //Logger.getLogger(UDPServer.class.getName()).log(Level.SEVERE, null, ex);
        }

        socket.close();
        return byteArray;


    }

    @Override
    public void run() {

        System.out.println("Listening on port " + port);

        while (true) {
            try {
                sleep(100);
            } catch (InterruptedException ex) {
                Logger.getLogger(UDPServer.class.getName()).log(Level.SEVERE, null, ex);
            }

            getData();


        }

    }

    /**
     *
     * @return
     */
    /**
     *
     * @return
     */
    public int getPort() {
        return port;
    }

    /**
     *
     * @param port
     */
    public void setPort(int port) {
        this.port = port;
    }

    /**
     *
     */
    public void closeConnection() {
        stop();
        socket.close();
        //connection = false;

    }

    public byte[] getByteArray() {
        return byteArray;
    }

    public static byte[] toByteArray(double value) {
        byte[] bytes = new byte[8];
        ByteBuffer.wrap(bytes).putDouble(value);
        return bytes;
    }

    public static double toDouble(byte[] bytes) {
        return ByteBuffer.wrap(bytes).getDouble();
    }
    /*public static void main(String[] args){
       
     UDPServer udpServ = new UDPServer(9090) ;
     //udpServ.startServer();
     byte[] dataBytes = udpServ.getData() ;
       
     }*/
}
