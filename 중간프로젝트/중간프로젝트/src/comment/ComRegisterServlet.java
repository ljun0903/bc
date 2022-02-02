package comment;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ComRegisterServlet")
public class ComRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		// 게시글 페이지에서 bbsnum과 id, name, content 받아오기 
//		int bbsnum = request.getParameter("bbsnum");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String content = request.getParameter("content");
		response.getWriter().write(register(id,name,content) + "");
	}
	
	// 여기에 int bbsnum, String id, String name, String content를 파라미터에 넣는다
	public int register(String id, String name, String content) {

		CommentDto dto = new CommentDto();
		
		try {
			dto.setId(id);
			dto.setName(name);
			dto.setContent(content);
			
		} catch (Exception e) {
			System.out.println("register오류");
			return 0;
		}
		return new CommentDao().register(dto);
	}
}
