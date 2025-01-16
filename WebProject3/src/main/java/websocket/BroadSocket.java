package websocket;

import java.security.cert.CollectionCertStoreParameters;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/broadcasting")
public class BroadSocket {
	public static Set<Session> clients = 
			Collections.synchronizedSet(new HashSet<Session>()); //연결된 멤버 관리 : 중복된 값 안들어가니깐 set 
	
	@OnMessage // 클라이언트로부터 메세지가 도착했을때 
	public void onMessage(String message, Session session) throws Exception{
		System.out.println("클라이언트로부터의 새로운 메세지 : " + message );
		synchronized(clients) { // 동기화 처리 .. 지금은 중요하지 않으니 일단 넘어가기 
			for(Session client : clients) {
				if(!client.equals(session)) { // 작성자는 빼주고 메세지보내줘야되니깐 
					client.getBasicRemote().sendText(message); // ~ 에게 메세지를 보낸다 
				}
			}
		}
	}
	
	@OnOpen // 새로운 클라이언트가 서버로 접속했을때 
	public void onOpen(Session session) {
		clients.add(session);
		System.out.println("참여 : " + clients.size() + "명");
	}
	
	
	@OnClose // 클라이언틔 접속이 끊어졌을때 
	public void onClose(Session session) {
		clients.remove(session);
	}
	

}
