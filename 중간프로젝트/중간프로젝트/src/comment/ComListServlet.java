package comment;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ComListServlet")
public class ComListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		int bbsid = Integer.parseInt(request.getParameter("bbsid"));
		int comstep = Integer.parseInt(request.getParameter("comstep"));

		System.out.println("bbsid:"+bbsid+" comstep:"+comstep);
	
		response.getWriter().write(getList(bbsid,comstep) + "");
	}
	
	public String getList(int bbsid, int comstep) {
		
		String result = "";
		result = "{\"result\":[";
		CommentDao dao = CommentDao.getInstance();
		List<CommentDto> list = dao.getComlist(bbsid, comstep);
		System.out.println("getList>>>> "+" bbsid: "+bbsid + "comstep:"+comstep);
		
		
		System.out.println(list.toString());
		for(int i=0; i<list.size(); i++) {
			result += "[{\"value\": \"" + list.get(i).getName()+ "\"},";
			result += "{\"value\": \"" + list.get(i).getContent()+ "\"},";
			result += "{\"value\": \"" + list.get(i).getRegdate()+ "\"}],";
		}
		
		result = result.substring(0, result.lastIndexOf(","));
		
		result += "]}";
		
		System.out.println(result);
		
		return result;
	}
}


