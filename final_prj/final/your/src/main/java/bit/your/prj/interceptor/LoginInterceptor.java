package bit.your.prj.interceptor;


import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.mvc.WebContentInterceptor;


import bit.your.prj.dto.MemberDto;

public class LoginInterceptor extends WebContentInterceptor {

	@Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException {
	        
	     HttpSession session = null;
	     
	     try {
			  MemberDto dto = (MemberDto) request.getSession().getAttribute("login");
			  
			  if(dto != null && dto.getId() != null) {
				  return true;
				  
			  }else {
					response.setContentType("text/html; charset=utf-8");
			        PrintWriter out;	
					out = response.getWriter();
					out.println("<script>");
			        out.println("alert('로그인이 필요한 서비스입니다.');  location.href='home.do'; </script>");
			        out.flush();
					}
	     }catch (Exception e) {
		}
		return false;
	 }
}
	 

