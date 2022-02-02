<%@page import="java.io.IOException"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="dto.CrewDto"%>
<%@page import="dao.CrewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
// 실제 파일 업로드를 실시하는 함수
public String processUploadFile(FileItem fileItem, String newfilename, String dir)throws IOException{
	// dir:directory, IOException : 파일이 없을 수 있으므로
   
   String f = fileItem.getName();   // 파일명
   long sizeInBytes = fileItem.getSize();   // 바이트 크기가 어느정도인지
   
   String fileName = "";
   String fpost = "";
   
   // 업로드한 파일이 정상일 경우
   if(f != null){
   if(sizeInBytes > 0){   // 0보다 컸을 경우 파일이 있다! d:\\tmp\\abc.txt       d:/tmp/abc.txt
      int idx = f.lastIndexOf("\\");
      if(idx == -1){
         idx = f.lastIndexOf("/");
         System.out.println("idx: " + idx);
      }
      fileName = f.substring(idx + 1);      // abc.txt
      System.out.println("file2: " + fileName);
      try{
        // File uploadFile = new File(dir, fileName);   // 새로 파일(file Name)을 만들어서 넘겨줌
           File uploadFile = new File(dir, newfilename); // 새로운 파일명

         fileItem.write(uploadFile);         // 실제로 업로드하는 부분
      }catch(Exception e){
         e.printStackTrace();
      };
   }
   } else {
	   fileName = "";
   }
   return fileName;
}



%>    
    
<%
    request.setCharacterEncoding("utf-8");
	String sseq = "";
	int seq = 0;
	
String period = "";
String regular = "";
String day = "";
String date = "";
String time = "";
String meetloc = "";
String course = "";

String loc = "";
String crewname = "";
String smaxcount = "";
int maxcount = 0;
String content = "";
String image = ""; 
String hfilename = ""; // 히든 파일네임 사진변경안했을때 사용
String hnewfilename = "";
String name = "";
String id = "";
    
  
  
    String fupload = application.getRealPath("/upload");
    //String fupload = "/Users/jinha/Desktop/JAVA/upload/";

    System.out.println("파일업로드:" + fupload);

    String yourTempDir = fupload;

    int yourMaxRequestSize = 100 * 1024 * 1024;      // 1MB

    int yourMAxMemorySize = 100 * 1024;            // 1KB


    // file data
    String filename = "";
    String newfilename = "";

    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    if(isMultipart){
       /////////////////////////// file
       
       // FileItem 오브젝트를 생성하는 클래스
       // 파일 업로드를 하기 위한 설정
       DiskFileItemFactory factory = new DiskFileItemFactory();
       
       factory.setSizeThreshold(yourMAxMemorySize);
       factory.setRepository(new File(yourTempDir));
       
       ServletFileUpload upload = new ServletFileUpload(factory);
       upload.setSizeMax(yourMaxRequestSize);
       
       List<FileItem> items = upload.parseRequest(request);
       Iterator<FileItem> it = items.iterator();         // Iterator : 파일 하나하나를 꺼내는?
       
       while(it.hasNext()){
          FileItem item = it.next();

          
          if(item.isFormField()){      // id, title, content가 넘어왔다
              if(item.getFieldName().equals("period")){
            	  period = item.getString("utf-8");
            	  
              }
              else if(item.getFieldName().equals("regular")){
            	  regular = item.getString("utf-8");
              }
           
              else if(item.getFieldName().equals("day")){
                  day = item.getString("utf-8");
              }
          
              else if(item.getFieldName().equals("loc")){
            	  loc = item.getString("utf-8");
            	  System.out.println("loc: "+ loc);

              }
          
              else if(item.getFieldName().equals("crewname")){
            	  crewname = item.getString("utf-8");
              }
          
              else if(item.getFieldName().equals("maxcount")){
            	  smaxcount = item.getString("utf-8");
            	  maxcount = Integer.parseInt(smaxcount); 
            	  
            	  System.out.println("smaxcount: " + smaxcount);
            	  System.out.println("maxcount: " + maxcount);


              }
          
              else if(item.getFieldName().equals("content")){
            	  content = item.getString("utf-8");
              }
          
              else if(item.getFieldName().equals("time")){
            	  time = item.getString("utf-8");
            	  System.out.println("time: "+ time);
              }          
          
              else if(item.getFieldName().equals("meetloc")){
            	  meetloc = item.getString("utf-8");
              }         
          
              else if(item.getFieldName().equals("course")){
            	  course = item.getString("utf-8");
              }   

              else if(item.getFieldName().equals("seq")){
            	  sseq = item.getString("utf-8");
            	  seq = Integer.parseInt(sseq);
              }  
          
              else if(item.getFieldName().equals("filename")){
            	  hfilename = item.getString("utf-8");
              	  System.out.println("hfilename: "+ hfilename);

              }  
          
              else if(item.getFieldName().equals("newfilename")){
            	  hnewfilename = item.getString("utf-8");
              	  System.out.println("hnewfilename: "+ hnewfilename);

              }  
          
              else if(item.getFieldName().equals("name")){
            	  name = item.getString("utf-8");
              }   
          
              else if(item.getFieldName().equals("id")){
            	  id = item.getString("utf-8");
              }  
          
          
          
          
           }else{
          // file
          	
             if(item.getFieldName().equals("file")){
            	String filefile = item.getString("utf-8");
            	System.out.println("filefile: "+ filefile);
            
            	// 확장자명
            	
            	String fileName = item.getName(); // abc.txt
            	System.out.println("fileName: "+ fileName);

            	if(fileName != ""){ // 사진 변경 했을 때
            	int lastInNum = fileName.lastIndexOf(".");
            	String exName = fileName.substring(lastInNum);
            	 
            	// 새로운 파일명
            	newfilename = (new Date().getTime()) + "";	// 435425234
            	newfilename = newfilename + exName;
            	 
                filename = processUploadFile(item, newfilename, fupload);
                
                } else { // 파일변경 안했을때
                	
                	
                }
              }
             
          }
       }
       
    }else{
       System.out.println("Multipart가 아님");
    }
    
    System.out.println("파일네임1:" + filename);
    System.out.println("뉴파일네임1:" + newfilename);
    
    if(filename == ""){
    	
    	filename = hfilename;
        newfilename = hnewfilename;
        
    	System.out.println("hfilename2: "+ hfilename);
    	System.out.println("hnewfilename2: "+ hnewfilename);
    }
    
    System.out.println("파일업로드:" + fupload);
    System.out.println("파일네임2:" + filename);
    System.out.println("뉴파일네임2:" + newfilename);
    
    
	if(period.equals("정기모임")){
		date = regular;
	} else {
		date = day + time;
		System.out.println("일일모임:" + date);
	}
    
    
    
    
 
    
    
    CrewDao dao = CrewDao.getInstance();
    CrewDto dto = new CrewDto(seq, crewname, loc, period, date, 0, maxcount, content, filename, newfilename, id, name, meetloc, course);


    boolean isS = dao.crewmodify(dto);
    if(isS){
    %>
<script>
alert('수정되었습니다.');

var seq = <%=seq%>;

location.href="crewdetail.jsp?seq="+ seq;
</script>
<% 
} else {
%>
<script>
alert('실패했습니다.');
</script>  
<% 
}
%>   