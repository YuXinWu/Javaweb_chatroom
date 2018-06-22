package websocket;

import java.nio.CharBuffer;
import java.util.HashMap;

public class MessageHandler {
    public static HashMap<String,String> getMessage(String msg) {
        HashMap<String,String> map = new HashMap<String,String>();
        String msgString  = msg;
        String m[] = msgString.split(",");
        map.put("fromName", m[0]);
        map.put("toName", m[1]);
        map.put("content", m[2]);
        System.out.println("++++++++++++++++++++++");
        return map;
        }
}
