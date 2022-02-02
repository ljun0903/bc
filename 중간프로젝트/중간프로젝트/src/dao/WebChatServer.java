package dao;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import dto.MemberDto;


@ServerEndpoint(value = "/webChatServer", configurator = HttpSessionConfigurator.class)

public class WebChatServer extends HttpServlet {
	private static Map<Session, EndpointConfig> configs = Collections.synchronizedMap(new HashMap<Session, EndpointConfig>());
	MemberDto dto = new MemberDto();
	String userName;
	CrewDao dao = CrewDao.getInstance();
	String seq;
	

	Calendar cal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy / MM / dd / HH:mm:ss");
	String datestr = sdf.format(cal.getTime());
	
	@OnMessage
	public void onMsg(String message, Session userSession) throws IOException{
		//EndpointConfig config = configs.get(session);
		//String userName = users.get(session);
		//System.out.println(userName + " : " + message);
//		JSONParser jsonParser = new JSONParser();
//		JSONObject jsonObj = (JSONObject) jsonParser.parse(json);
		System.out.println("seq: " + seq); // 상대방의 메시지를 받을때
		System.out.println("userName: " + userName); // 상대방의 메시지를 받을때
		System.out.println("datestr: " + datestr); // 상대방의 메시지를 받을때
		System.out.println("message: " + message); // 상대방의 메시지를 받을때
		synchronized (configs) {
			Iterator<Session> it = configs.keySet().iterator();
			while(it.hasNext()){
				Session currentSession = it.next();
				if(!currentSession.equals(userSession)){
					currentSession.getBasicRemote().sendText(userName + " : " + message);
					System.out.println("onMsg: " + message); // 상대방의 메시지를 받을때
					boolean isS = dao.chat(seq, userName, datestr, message);
				    if(isS){
				    	System.out.println("success");
				    } else {
				    	System.out.println("fail");
				    }
				}
			}
		}
		
	}
	
	@OnOpen
	public void onOpen(Session userSession, EndpointConfig config) throws IOException{
		//System.out.println(session);
		//String userName = "user" + (int)(Math.random()*100);
		configs.put(userSession, config);
		EndpointConfig configg = configs.get(userSession);
		HttpSession session = (HttpSession) config.getUserProperties().get(HttpSessionConfigurator.Session);
        dto = (MemberDto) session.getAttribute("login");
        //seq = (String) session.getAttribute("crewseq");
        seq = String.valueOf(session.getAttribute("crewseq"));
		userName = dto.getName();
		sendNotice(userName + "님이 입장하셨습니다. 현재 사용자 " + configs.size() + "명");
	}
	
	
	public void sendNotice(String message) throws IOException{
		String userName = "server";
		System.out.println(userName + " : " + message);
		
		synchronized (configs) {
			Iterator<Session> it = configs.keySet().iterator();
			while(it.hasNext()){
				Session currentSession = it.next();
				currentSession.getBasicRemote().sendText(userName + " : " + message);
			}
		}
	}

	@OnClose
	public void onClose(Session session) throws IOException{
		String userName = dto.getName();
		configs.remove(session);
		sendNotice(userName + "님이 퇴장하셨습니다. 현재 사용자 " + configs.size() + "명");
	}
	
	public int count() throws IOException{
		int count = configs.size();
		
		return count;
	}

}