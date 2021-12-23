package dto;

import java.io.IOException;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;


@ServerEndpoint("/chatting/{roomname}/{loginid}") // 1.서버소켓[종작첨] ( 경로생성 )
public class Chatting {

	// * 접속된 세션(회원)을 저장하는 리스트 [ Arraylist vs Vector(동기화) ]
		static ConcurrentHashMap<String, Session> clients = new ConcurrentHashMap<String, Session>();
			
		// 2. 클라이언트가 서버로부터 접속 요청
		@OnOpen // 소켓 접속하는 어노테이션 
		public void onOpen( Session session ,@PathParam("roomname")String roomname,@PathParam("loginid")String loginid) {
			Set<Entry<String, Session>> entry = clients.entrySet();
			for(Entry<String, Session> ent : entry)	{
					//방이름이 같으면서 아이디가 다르면
				//로그인 아이디를 포함하는 클라이언트가 있으면 기존값
				if(ent.getKey().contains(loginid)) {
					clients.remove(ent.getKey()); // 리스트에 제거
				}
			}
			String clientname = roomname+"@"+loginid;
			System.out.println("방이름 :"+roomname+" 접속 아이디 :"+loginid);
			System.out.println(clientname);
			clients.put(clientname,session);	// 리스트에 추가
			
			//System.out.print( session.getId() ); // 세션 번호 확인 
			//System.out.print("현재 접속한 세션들 : " + clients ); // 현재 접속된 세션들 
		}
		
		// 3. 클라이언트가 서버로부터 접속 해지
		@OnClose // 소켓 닫는 어노테이션 
		public void onClose( Session session ,@PathParam("roomname")String roomname,@PathParam("loginid")String loginid) {
			Set<Entry<String, Session>> entry = clients.entrySet();
			for(Entry<String, Session> ent : entry)	{
					//방이름이 같으면서 아이디가 다르면
				//로그인 아이디를 포함하는 클라이언트가 있으면 기존값
				if(ent.getKey().contains(loginid)) {
					clients.remove(ent.getKey()); // 리스트에 제거
				}
			}
		}
		
		// 4.서버가 클라이언트로부터 메시지 받는 메소드 
		@OnMessage	// 메시지를 받는 어노테이션 
		public void onMessage( String msg , Session session ,@PathParam("roomname")String roomname,@PathParam("loginid")String loginid ) throws IOException {
			Set<Entry<String, Session>> entry = clients.entrySet();
			for(Entry<String, Session> ent : entry)	{
					//방이름이 같으면서 아이디가 다르면
				//if(ent.getKey().contains(roomname)&&!ent.getKey().contains(loginid)) {
				if(ent.getKey().split("@")[0].equals(roomname)&&!ent.getKey().split("@")[1].equals(loginid)) {
					clients.get(ent.getKey()).getBasicRemote().sendText(msg);
				}
			}
			
		}
}
