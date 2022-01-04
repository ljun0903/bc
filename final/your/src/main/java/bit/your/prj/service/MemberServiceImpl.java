package bit.your.prj.service;



import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import bit.your.prj.dao.MemberDao;
import bit.your.prj.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao dao;
	
	
	@Override
	public int getId(MemberDto mem) {		
		return dao.getId(mem);
	}


	@Override
	public MemberDto login(MemberDto mem) {
		return dao.login(mem);
	}

	@Override
	public boolean addmember(MemberDto mem) {
		return dao.addmember(mem);
	}


	@Override
	public int getnickname(MemberDto mem) {
		return dao.getnickname(mem);
	}


	@Override
	public MemberDto findid(MemberDto mem) {
		return dao.findid(mem);
	}
	

	@Override
	public MemberDto readmember(String id) {
		
		MemberDto dto = null;
		
		try {
			
			dto = dao.readmember(id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return dto;
	}


	@Override
	public void updatemember(MemberDto mem) {
		try {
			dao.updatemember(mem);
		} catch (Exception e) {
		    e.printStackTrace();
		}
	
		
	}
	@Override
	public int updatepwd(MemberDto mem) throws Exception {
		return dao.updatepwd(mem);
		
	}
	
	

	@Override
	public void deletemember(MemberDto mem) {
		try {
			dao.deletemember(mem);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


	@Override
	public void sendEmail(MemberDto mem, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "yourrecipe202@gmail.com";
		String hostSMTPpwd = "skarbsla93!";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "yourrecipe202@gmail.com";
		String fromName = "YOUR(Your Own Uniqe Recipe)";
		String subject = "";
		String msg = "";

		if(div.equals("findpw")) {
			subject = "YOUR(Your Own Uniqe Recipe) 임시 비밀번호 입니다.";
			msg = "<!DOCTYPE html>" +
					"<html>" +
					"<head>" +
					"<style type='text/css'>" +
					"@font-face {" +
						"font-family: 'Cafe24SsurroundAir';" +
						"src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');" +
						"font-weight: normal;" +
						"font-style: normal;" +
					"}" +
					"body{" +
							"font-family:'Cafe24SsurroundAir';" +
						"}" +
					"</style>" +
					"</head>" +
					"<title></title>" +
					"<body>" +
					"<div style='font-family: Cafe24SsurroundAir'>" + 
					"<div style=\"border:1px solid; width: 35%; margin-left: auto; margin-right: auto; background-color: #FFE400;\" >" +
							"<h1 align=\"center\">YOUR 계정</h1>" + 
					"</div>" +
					"<div style=\"border:1px solid; width: 35%; margin-left: auto; margin-right: auto; border-top-color: white;\">" +
						"<div style='height: 350px; margin-top: 20px'>" +
						"<div align='center'>" +
						"<img src='https://i.ibb.co/dKtQSXD/006.png' style=\"width: 70px;\">" +
						"</div>" +
						"<h2 align=\"left\" style=\"margin-left: 40px; margin-rigt: 40px;\">YOUR에서 보내드리는 임시비밀번호입니다.</h2>" +
						"<h3 align=\"left\" style=\"margin-left: 40px; color: gray;\">" + mem.getId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>" +
						"<hr style=\"border: solid 1px gray; width: 95%;\"></hr>" +
						"<br><br>" +
						"<h1 align=\"left\" style=\"margin-left: 40px;\">임시비밀번호 : " + mem.getPwd() + "</h1>" +
						"<br>" +
						"</div>" +
						"<div style=\"border:1px solid; border-left-color: white; border-bottom-color: white; border-right-color : white; background: #F2F2F2;\">" + 
								"<h5  align=\"left\" style=\"margin-left: 40px; color:gray;\" >" +
						                    "1234-56789<span>평일 09:30 ~ 18:00 (공휴일 휴무)</span><br> " +
						                    "<span>Email : <a href='mailto:help@your.com'>help@your.com</a></span>" +
						                        "<span>법인명 : 유어(your) </span><i class='icon pipe'></i> " +
						                        "<span>서울특별시 마포구 백범로 23, 3층</span>" + 
						                        "<br>" +
						                        "<span>사업자등록번호 : 123-45-56789</span><i class='icon pipe'></i>" +
						                        "<span>통신판매업 신고 : 제2018-서울마포-1234호</span><br>" +
						            "Copyright © your Service Co.,Ltd All Rights Reserved" +
							"</h5>" +
						"</div>" +
					"</div>" +
					"</div>" +
					"</body>" +
					"</html>";
		}

		// 받는 사람 E-Mail 주소
		String mail = mem.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); //네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
		
	}


	@Override
	public void findpw(HttpServletResponse resp, MemberDto dto) throws Exception {
		resp.setContentType("text/html;charset=utf-8");
		MemberDto mem = dao.readmember(dto.getId());
		PrintWriter out = resp.getWriter();
		
		int count = getId(mem);
		// 가입된 아이디가 없으면
		if(count == 0) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		// 가입된 이름이 아니면
				else if(!dto.getName().equals(mem.getName())) {
					out.print("등록된 이름이 아닙니다.");
					out.close();
		}
		// 가입된 이메일이 아니면
				else if(!dto.getEmail().equals(mem.getEmail())) {
					out.print("등록되지 않은 이메일입니다.");
					out.close();
		}else {
			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			dto.setPwd(pw);
			// 비밀번호 변경
			dao.updatepwd(dto);
			// 비밀번호 변경 메일 발송
			sendEmail(dto, "findpw");

			
		}
		
	}

	
	
	
	
	/*------------------------------------------------------------------------------------------------------------0813*/

	//api
	@Override
	public boolean idCheck(String id) {
		return dao.idCheck(id);
	}


	@Override
	public boolean nicknameCheck(String nickname) {
		return dao.nicknameCheck(nickname);
	}


	@Override
	public boolean emailCheck(String email) {
		return dao.emailCheck(email);
	}


	@Override
	public MemberDto getMember(String id) {
		return dao.getMember(id);
	}


	


	






	
	}


