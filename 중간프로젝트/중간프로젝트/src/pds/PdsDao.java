package pds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;

public class PdsDao {
	private static PdsDao pd = new PdsDao();
	
	private PdsDao() {
	}
	
	public static PdsDao getInstance() {
		return pd;
	}
	
	public List<PdsDto> getPdsList() {
		String sql = " SELECT SEQ, ID, NAME, TITLE, CONTENT, FILENAME, NEWFILENAME, "
				+ " READCOUNT, PDSNUM, REGDATE "
				+ " FROM PDS ";
		
		Connection conn = null;			
		PreparedStatement psmt = null;	
		ResultSet rs = null;			
		
		List<PdsDto> list = new ArrayList<PdsDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getPdsList success");
				
			psmt = conn.prepareStatement(sql);
			System.out.println("2/4 getPdsList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 getPdsList success");
			
			
			
			while(rs.next()) {
				int i = 1;
				PdsDto dto = new PdsDto(rs.getInt(i++), 
										rs.getString(i++), 
										rs.getString(i++), 
										rs.getString(i++),
										rs.getString(i++), 
										rs.getString(i++), 
										rs.getString(i++),
										rs.getInt(i++), 
										rs.getInt(i++), 
										rs.getString(i++));
				list.add(dto);
			}	
			System.out.println("4/4 getPdsList success");
			
		} catch (SQLException e) {
			System.out.println("getPdsList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return list;
	}
	
	public boolean writePds(PdsDto pds) {
		String sql = " INSERT INTO PDS(SEQ, ID, NAME, TITLE, CONTENT, FILENAME, NEWFILENAME, "
					+ " READCOUNT, PDSNUM, REGDATE) "
					+ " VALUES(SEQ_PDS.NEXTVAL, ?, ?, ?, ?, ?, ?, 0, ?, SYSDATE) ";

		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 writePds Success!!");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pds.getId());
			psmt.setString(2, pds.getName());
			psmt.setString(3, pds.getTitle());
			psmt.setString(4, pds.getContent());
			psmt.setString(5, pds.getFilename());
			psmt.setString(6, pds.getNewFilename());
			psmt.setInt(7, pds.getPdsnum());
			System.out.println("2/3 writePds Success!!");

			count = psmt.executeUpdate();
			System.out.println("3/3 writePds Success!!");
			
		} catch (SQLException e) {			
			System.out.println("writePds Fail..");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		return count>0?true:false;
	}
	
	public PdsDto getPds(int seq) {
		String sql = " SELECT SEQ, ID, NAME, TITLE, CONTENT, FILENAME, NEWFILENAME, "
					+ " READCOUNT, PDSNUM, REGDATE "
					+ " FROM PDS "
					+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		PdsDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getPds Success!!");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/4 getPds Success!!");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 getPds Success!!");
			
			while(rs.next()) {
								dto = new PdsDto();
								dto.setSeq(rs.getInt(1));
								dto.setId(rs.getString(2));
								dto.setName(rs.getString(3));
								dto.setTitle(rs.getString(4));
								dto.setContent(rs.getString(5));
								dto.setFilename(rs.getString(6));
								dto.setNewFilename(rs.getString(7));
								dto.setReadcount(rs.getInt(8));
								dto.setPdsnum(rs.getInt(9));
								dto.setRegdate(rs.getString(10));
			}
			
			System.out.println("4/4 getPds Success!!");
			
		} catch (SQLException e) {
			System.out.println("getPds Fail..");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return dto;
	}
		
	public boolean pdsReadCount(int seq) {
		int count=0;
		String sql=" UPDATE PDS SET " +
				" READCOUNT=READCOUNT+1 " +
				" WHERE  SEQ=? ";
		
		Connection conn=null;
		PreparedStatement psmt=null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 S  pdsReadCount");
			
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1, seq );
			System.out.println("2/3 S  pdsReadCount");
			
			count=psmt.executeUpdate();
			System.out.println("3/3 S  pdsReadCount");
			
		} catch (Exception e) {
			System.out.println("F pdsReadCount");
		}finally{
			DBClose.close(conn, psmt, null);
		}
		return count>0?true:false;
	}
	
	public boolean updatePds(int seq, String title, String content) {
		String sql = " UPDATE PDS SET "
				+ " TITLE=?, CONTENT=? "
				+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 S updateBbs");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setInt(3, seq);
			
			System.out.println("2/3 S updateBbs");
			
			count = psmt.executeUpdate();
			System.out.println("3/3 S updateBbs");
			
		} catch (Exception e) {			
			e.printStackTrace();
		} finally{
			DBClose.close(conn, psmt, null);			
		}		
		
		return count>0?true:false;
	}
	
public boolean deletePds(int seq) {
		
		System.out.println(seq);
		String sql = " DELETE PDS "
					+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 S deletePds");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/3 S deletePds");
			
			count = psmt.executeUpdate();
			System.out.println("3/3 S deletePds");
			
		} catch (Exception e) {		
			System.out.println("fail deletePds");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);			
		}
		
		return count>0?true:false;
	}



public List<PdsDto> getPdsSearchList(String name, int pdsnum, String choice, String search) {		// 게시판 글 전체
	
	String sql = " SELECT SEQ, ID, NAME, TITLE, CONTENT, FILENAME, NEWFILENAME, "
				+ " READCOUNT, PDSNUM, REGDATE "
				+ " FROM PDS "
				+ " WHERE NAME=? AND PDSNUM=? ";
	
	String sWord = "";		// 초기값 설정
	
	if(choice.equals("title")) {
		sWord = " AND TITLE LIKE '%" + search + "%' ";	// Like : 포함된 문자
	}else if(choice.equals("content")) {
		sWord = " AND CONTENT LIKE '%" + search + "%' ";
	}
	
	sql = sql + sWord;
	
	Connection conn = null;			// 목적 : DB 연결
	PreparedStatement psmt = null;	// 목적 : Query문을 실행하기 위한
	ResultSet rs = null;			// 목적 : 결과 값을 취득(산출)하기 위한
	
	List<PdsDto> list = new ArrayList<PdsDto>();
	
	
	try {
		conn = DBConnection.getConnection();
		System.out.println("1/4 getPdsSearchList Success!");
		
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, name);
		psmt.setInt(2, pdsnum);
		System.out.println("2/4 getPdsSearchList Success!");
		
		rs = psmt.executeQuery();
		System.out.println("3/4 getPdsSearchList Success!");
		
		while(rs.next()) {	// 검색이 됐다면
			PdsDto dto = new PdsDto(rs.getInt(1), 
									rs.getString(2), 
									rs.getString(3), 
									rs.getString(4),
									rs.getString(5),
									rs.getString(6),
									rs.getString(7), 
									rs.getInt(8), 
									rs.getInt(9),
									rs.getString(10));
			list.add(dto);
			System.out.println("4/4 getPdsSearchList Success!");
		}
	} catch (SQLException e) {
		System.out.println("getPdsSearchList Fail!");
	} finally {
		DBClose.close(conn, psmt, rs);
	}
	
	return list; 
}

public List<PdsDto> getPdsPagingList( int pdsnum, String choice, String search, int pageNumber) {		// 게시판 글 전체
	
	String sql = " SELECT SEQ, ID, NAME, TITLE, CONTENT, FILENAME, NEWFILENAME, READCOUNT, PDSNUM, REGDATE "
				+ " FROM ";
	
	// number 설정
	sql += "(SELECT ROW_NUMBER()OVER(ORDER BY SEQ ASC) AS RNUM, "
			+ " SEQ, ID, NAME, TITLE, CONTENT, FILENAME, NEWFILENAME, READCOUNT, PDSNUM, REGDATE "
			+ " FROM PDS WHERE PDSNUM=?";
	
	String sWord = "";		// 초기값 설정
	
	if(choice.equals("title")) {
		sWord = " AND TITLE LIKE '%" + search + "%' ";	// Like : 포함된 문자
	}else if(choice.equals("content")) {
		sWord = " AND CONTENT LIKE '%" + search + "%' ";
	}
	
	sql = sql + sWord;
	
	sql = sql + " ORDER BY SEQ DESC )";
	
	sql = sql + " WHERE RNUM >= ? AND RNUM <= ? ";
	
	int start, end;
	start = 1 + 10 * pageNumber;	// 0 -> 1 ~10	1 -> 11~ 20
	end = 10+ 10 * pageNumber;
	
	
	Connection conn = null;			// 목적 : DB 연결
	PreparedStatement psmt = null;	// 목적 : Query문을 실행하기 위한
	ResultSet rs = null;			// 목적 : 결과 값을 취득(산출)하기 위한
	
	List<PdsDto> list = new ArrayList<PdsDto>();
	
	
	try {
		conn = DBConnection.getConnection();
		System.out.println("1/4 getPdsPagingList Success!");
		
		psmt = conn.prepareStatement(sql);
		psmt.setInt(1, pdsnum);
		psmt.setInt(2, start);
		psmt.setInt(3, end);
		
		
		System.out.println("2/4 getPdsPagingList Success!");
		
		rs = psmt.executeQuery();
		System.out.println("3/4 getPdsPagingList Success!");
		
		while(rs.next()) {	// 검색이 됐다면
			PdsDto dto = new PdsDto(rs.getInt(1), 
									rs.getString(2), 
									rs.getString(3), 
									rs.getString(4),
									rs.getString(5),
									rs.getString(6),
									rs.getString(7), 
									rs.getInt(8), 
									rs.getInt(9),
									rs.getString(10));
			list.add(dto);
			System.out.println("4/4 getPdsPagingList Success!");
		}
		System.out.println(list.toString());
	} catch (SQLException e) {
		System.out.println("getPdsPagingList Fail!");
	} finally {
		DBClose.close(conn, psmt, rs);
	}
	
	return list; 
}

public List<PdsDto> getMyPdsPagingList(String name, int pdsnum, String choice, String search, int pageNumber) {		// 게시판 글 전체
	
	String sql = " SELECT SEQ, ID, NAME, TITLE, CONTENT, FILENAME, NEWFILENAME, READCOUNT, PDSNUM, REGDATE "
				+ " FROM ";
	
	// number 설정
	sql += "(SELECT ROW_NUMBER()OVER(ORDER BY SEQ ASC) AS RNUM, "
			+ " SEQ, ID, NAME, TITLE, CONTENT, FILENAME, NEWFILENAME, READCOUNT, PDSNUM, REGDATE "
			+ " FROM PDS WHERE NAME=? AND PDSNUM=?";
	
	String sWord = "";		// 초기값 설정
	
	if(choice.equals("title")) {
		sWord = " AND TITLE LIKE '%" + search + "%' ";	// Like : 포함된 문자
	}else if(choice.equals("content")) {
		sWord = " AND CONTENT LIKE '%" + search + "%' ";
	}
	
	sql = sql + sWord;
	
	sql = sql + " ORDER BY SEQ ASC )";
	
	sql = sql + " WHERE RNUM >= ? AND RNUM <= ? ";
	
	int start, end;
	start = 1 + 10 * pageNumber;	// 0 -> 1 ~10	1 -> 11~ 20
	end = 10+ 10 * pageNumber;
	
	
	Connection conn = null;			// 목적 : DB 연결
	PreparedStatement psmt = null;	// 목적 : Query문을 실행하기 위한
	ResultSet rs = null;			// 목적 : 결과 값을 취득(산출)하기 위한
	
	List<PdsDto> list = new ArrayList<PdsDto>();
	
	
	try {
		conn = DBConnection.getConnection();
		System.out.println("1/4 getPdsPagingList Success!");
		
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, name);
		psmt.setInt(2, pdsnum);
		psmt.setInt(3, start);
		psmt.setInt(4, end);
		
		
		System.out.println("2/4 getPdsPagingList Success!");
		
		rs = psmt.executeQuery();
		System.out.println("3/4 getPdsPagingList Success!");
		
		while(rs.next()) {	// 검색이 됐다면
			PdsDto dto = new PdsDto(rs.getInt(1), 
									rs.getString(2), 
									rs.getString(3), 
									rs.getString(4),
									rs.getString(5),
									rs.getString(6),
									rs.getString(7), 
									rs.getInt(8), 
									rs.getInt(9),
									rs.getString(10));
			list.add(dto);
			System.out.println("4/4 getPdsPagingList Success!");
		}
		System.out.println(list.toString());
	} catch (SQLException e) {
		System.out.println("getPdsPagingList Fail!");
	} finally {
		DBClose.close(conn, psmt, rs);
	}
	
	return list; 
}

public int getAllPds( int pdsnum, String choice, String search) {	// 글의 총수를 구하는 함수
	
	String sql = " SELECT COUNT(*) FROM PDS "
				+ " WHERE PDSNUM=? ";	// 글의 총수
	
	// search 글의 총수도 구해야 하므로
	String sWord = "";		// 초기값 설정
			
	if(choice.equals("title")) {
		sWord = " AND TITLE LIKE '%" + search + "%' ";	// Like : 포함된 문자
	}else if(choice.equals("content")) {
		sWord = " AND CONTENT LIKE '%" + search + "%' ";
	}
	
	sql = sql + sWord;

	Connection conn = null;			// 목적 : DB 연결
	PreparedStatement psmt = null;	// 목적 : Query문을 실행하기 위한
	ResultSet rs = null;			// 목적 : 결과 값을 취득(산출)하기 위한
	
	int len = 0; // length
	
	try {
		conn = DBConnection.getConnection();
		System.out.println("1/3 getAllPds Success!");
		
		psmt = conn.prepareStatement(sql);
		psmt.setInt(1, pdsnum);
		System.out.println("2/3 getAllPds Success!");
		
		rs = psmt.executeQuery();
		
		// 없어도 됨
		if(rs.next()) {
			len = rs.getInt(1);
		}
		System.out.println("3/3 getAllPds Success!");
		
	} catch (SQLException e) {
		System.out.println("getAllPds Fail!");
		e.printStackTrace();
	} finally {
		DBClose.close(conn, psmt, rs);
	}
	return len;
}

public List<PdsDto> myPdsList(String name, int pdsnum) {
	String sql = " SELECT * FROM PDS "
				+ " WHERE NAME=? AND PDSNUM=? ";
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	List<PdsDto> list = new ArrayList<PdsDto>();
	
	try {
		conn = DBConnection.getConnection();
		System.out.println("1/4 getPdsId Success!!");
		
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, name);
		psmt.setInt(2, pdsnum);
		System.out.println("2/4 getPdsId Success!!");

		rs = psmt.executeQuery();
		System.out.println("3/4 getPdsId Success!!");
		
		while(rs.next()) {
			int i = 1;
			PdsDto dto = new PdsDto(rs.getInt(i++), 
									rs.getString(i++), 
									rs.getString(i++), 
									rs.getString(i++),
									rs.getString(i++), 
									rs.getString(i++), 
									rs.getString(i++),
									rs.getInt(i++), 
									rs.getInt(i++), 
									rs.getString(i++));
			
			list.add(dto);
		}
		System.out.println("4/4 getPdsId Success!!");
	} catch (SQLException e) {
		System.out.println(" getPdsId Fail..");
		e.printStackTrace();
	} finally {
		DBClose.close(conn, psmt, rs);
	}
	return list;
}
	

public int getMyAllPds(String name, int pdsnum, String choice, String search) {   // 글의 총수를 구하는 함수
   
   String sql = " SELECT COUNT(*) FROM PDS "
            + " WHERE NAME=? AND PDSNUM=? ";   // 글의 총수
   
   // search 글의 총수도 구해야 하므로
   String sWord = "";      // 초기값 설정
         
   if(choice.equals("title")) {
      sWord = " AND TITLE LIKE '%" + search + "%' ";   // Like : 포함된 문자
   }else if(choice.equals("content")) {
      sWord = " AND CONTENT LIKE '%" + search + "%' ";
   }
   
   sql = sql + sWord;

   Connection conn = null;         // 목적 : DB 연결
   PreparedStatement psmt = null;   // 목적 : Query문을 실행하기 위한
   ResultSet rs = null;         // 목적 : 결과 값을 취득(산출)하기 위한
   
   int len = 0; // length
   
   try {
      conn = DBConnection.getConnection();
      System.out.println("1/3 getAllPds Success!");
      
      psmt = conn.prepareStatement(sql);
      psmt.setString(1, name);
      psmt.setInt(2, pdsnum);
      System.out.println("2/3 getAllPds Success!");
      
      rs = psmt.executeQuery();
      
      // 없어도 됨
      if(rs.next()) {
         len = rs.getInt(1);
      }
      System.out.println("3/3 getAllPds Success!");
      
   } catch (SQLException e) {
      System.out.println("getAllPds Fail!");
      e.printStackTrace();
   } finally {
      DBClose.close(conn, psmt, rs);
   }
   return len;
}

}





