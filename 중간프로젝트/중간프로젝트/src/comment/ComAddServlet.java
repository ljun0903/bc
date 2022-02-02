package comment;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DBClose;
import db.DBConnection;


@WebServlet("/ComAddServlet")
public class ComAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		int bbsid = Integer.parseInt(request.getParameter("bbsid"));
		int comstep = Integer.parseInt(request.getParameter("comstep"));
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String content = request.getParameter("content");
		System.out.println("bbsid:"+bbsid+" comstep:"+comstep+" id:"+id+" name:"+name+" content:"+content);
		
		response.getWriter().write(addcom(bbsid,comstep,id,name,content) + "");
		
		
		/*
		 * CommentDao dao = CommentDao.getInstance(); dao.addcom(new CommentDto(comstep,
		 * bbsid, comstep, id, name, name, content, bbsid, comstep))
		 */
		
		
		
	}
	
	public int addcom(int bbsid, int comstep, String id, String name, String content) {
		
		CommentDto dto = new CommentDto();
		
		try {
			dto.setBbsid(bbsid);;
			dto.setComstep(comstep);
			dto.setId(id);
			dto.setName(name);
			dto.setContent(content);
		} catch (Exception e) {
			System.out.println("맴버추가 오류");
			return 0;
		}
		return new CommentDao().addcom(dto);
	}

}
















