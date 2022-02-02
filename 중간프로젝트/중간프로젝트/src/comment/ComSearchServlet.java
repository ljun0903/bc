package comment;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ComSearchServlet")
public class ComSearchServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String name = request.getParameter("name");
		response.getWriter().write(getJSON(name));
	}

	public String getJSON(String name) {
		if(name == null) name = "";
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		CommentDao dao = CommentDao.getInstance();
		ArrayList<CommentDto> list = dao.search(name);
		for (int i = 0; i < list.size(); i++) {
			result.append("[{\"value\": \"" + list.get(i).getName() + "\"},");
			result.append("{\"value\": \"" + list.get(i).getContent() + "\"},");
			result.append("{\"value\": \"" + list.get(i).getRegdate() + "\"}],");
		//	result.append("{\"value\": \"" + list.get(i).getLikecount() + "\"}],");
		}
		result.append("]}");
		return result.toString();
	}
}
