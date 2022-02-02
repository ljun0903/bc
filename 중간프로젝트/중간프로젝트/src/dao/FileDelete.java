package dao;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.CrewDto;

public class FileDelete extends HttpServlet {
	      ServletConfig mConfig = null;
	
	 @Override
	   public void init(ServletConfig config) throws ServletException {
	      mConfig = config;      // 업로드한 경로를 취득하기 위해서
	   }
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  

		String newfilename = request.getParameter("newfilename");
		String seq = request.getParameter("seq");
	    //int seq = Integer.parseInt(request.getParameter("seq"));
		
	    CrewDao dao = CrewDao.getInstance();
		CrewDto dto = new CrewDto();
		
	    String filename = dao.getCrewDetail(seq).getFilename();

//	    File file = new File("C:/projects/upload/aaa.jpg");
//	    File 객체를 생성하고 file.delete();
	   
		
		// path(경로)
	    // tomcat(server)
	    String filepath = mConfig.getServletContext().getRealPath("/upload");
	    System.out.println("filepath1 : " + filepath);
	    System.out.println("newfilename : " + newfilename);

	    // 폴더
//	    String filepath = "d:\\tmp";
	    filepath = filepath + "/" + newfilename; // 윈도우노트북: 경로 확인 후 다르면 \\로 바꿔주기
	    System.out.println("filepath2 : " + filepath);
	   
	    File f = new File(filepath);
			
		if(f.exists()){
			f.delete();
			System.out.println("파일 삭제됨");
		}else{
			System.out.println("파일 없음");
		}
		
		response.sendRedirect("crewdelAf.jsp?seq=" + request.getParameter("seq"));
	}

	
	
}
