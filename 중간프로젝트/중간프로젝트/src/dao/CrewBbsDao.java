package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.CrewBbsDto;

public class CrewBbsDao {

	private static CrewBbsDao dao = null;
	
	private CrewBbsDao() {
	}
	
	public static CrewBbsDao getInstance() {
		if(dao == null) {
			dao = new CrewBbsDao();
		}		
		return dao;
	}
	
	public List<CrewBbsDto> getCrewBbsList() {
		
		String sql = " SELECT SEQ, ID, NAME, TITLE, CONTENT, FILENAME, NEWFILENAME, "
				   + " 		READCOUNT, LIKECOUNT, COMCOUNT, REGDATE, BBSID"
				   + " FROM CREWBBS ";
		//		   + " ORDER BY REF DESC, STEP ASC ";
		
		Connection conn = null;			// DB 연결
		PreparedStatement psmt = null;	// Query문을 실행
		ResultSet rs = null;			// 결과 취득
		
		List<CrewBbsDto> list = new ArrayList<CrewBbsDto>();

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getCrewBbsList success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/4 getCrewBbsList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 getCrewBbsList success");
			
			while(rs.next()) {
				int i = 1;
				CrewBbsDto dto = new CrewBbsDto(rs.getInt(i++), 
												rs.getString(i++),
												rs.getString(i++),
												rs.getString(i++),
												rs.getString(i++), 
												rs.getString(i++), 
												rs.getString(i++), 
												rs.getInt(i++),
												rs.getInt(i++), 
												rs.getInt(i++), 
												rs.getString(i++), 
												rs.getInt(i++));
				list.add(dto);
			}
			System.out.println("4/4 getCrewBbsList success");
			
		} catch (SQLException e) {
			System.out.println("getCrewBbsList fail");
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return list;		
	}
	
	
public List<CrewBbsDto> getMyCrewBbsList(int seq) {
		
		String sql = " SELECT SEQ, ID, NAME, TITLE, CONTENT, FILENAME, NEWFILENAME, "
				   + " 		READCOUNT, LIKECOUNT, COMCOUNT, REGDATE, BBSID"
				   + " FROM CREWBBS "
				   + " WHERE BBSID=? ";
				   //+ " ORDER BY SEQ DESC ";
		
		Connection conn = null;			// DB 연결
		PreparedStatement psmt = null;	// Query문을 실행
		ResultSet rs = null;			// 결과 취득
		
		List<CrewBbsDto> list = new ArrayList<CrewBbsDto>();

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getMyCrewBbsList success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/4 getMyCrewBbsList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 getMyCrewBbsList success");
			
			while(rs.next()) {
				int i = 1;
				CrewBbsDto dto = new CrewBbsDto(rs.getInt(i++), 
												rs.getString(i++),
												rs.getString(i++),
												rs.getString(i++),
												rs.getString(i++), 
												rs.getString(i++), 
												rs.getString(i++), 
												rs.getInt(i++),
												rs.getInt(i++), 
												rs.getInt(i++), 
												rs.getString(i++), 
												rs.getInt(i++));
				list.add(dto);
			}
			System.out.println("4/4 getMyCrewBbsList success");
			
		} catch (SQLException e) {
			System.out.println("getMyCrewBbsList fail");
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return list;		
	}
	
	public boolean writeCrewBbs(CrewBbsDto dto) {
	
		String sql = " INSERT INTO CREWBBS(SEQ, ID, NAME, TITLE, CONTENT, FILENAME, NEWFILENAME, "
				   + "                 READCOUNT, LIKECOUNT, COMCOUNT, REGDATE, BBSID) "
				   + " VALUES(SEQ_CREWBBS.NEXTVAL, ?, ?, ?, ?, "
				   + "					?, ?, 0, "
				   + "					0, 0, SYSDATE, ?) ";
		
		Connection conn = null;			
		PreparedStatement psmt = null;	
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();			
			System.out.println("1/3 writeCrewBbs success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			System.out.println(dto.getId());
			
			psmt.setString(2, dto.getName());
			System.out.println(dto.getName());
			
			psmt.setString(3, dto.getTitle());
			System.out.println(dto.getTitle());
			
			psmt.setString(4, dto.getContent());
			System.out.println(dto.getContent());
			
			psmt.setString(5, dto.getFilename());
			System.out.println(dto.getFilename());
			
			psmt.setString(6, dto.getNewfilename());
			System.out.println(dto.getNewfilename());
			
			psmt.setInt(7, dto.getBbsid());
			System.out.println(dto.getBbsid());
			
			System.out.println("2/3 writeCrewBbs success");
			
			count = psmt.executeUpdate();
			System.out.println("3/3 writeCrewBbs success");
			
		} catch (SQLException e) {
			System.out.println("writeCrewBbs fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		return count>0?true:false;
	}
	
	public CrewBbsDto getCrewBbs(int seq) {
		
		String sql = " SELECT SEQ, ID, NAME, TITLE, CONTENT, FILENAME, NEWFILENAME, "
				+ "			READCOUNT, LIKECOUNT, COMCOUNT, REGDATE, BBSID "
				+ "	   FROM CREWBBS "
				+ "    WHERE SEQ=? ";
		
		Connection conn = null;			
		PreparedStatement psmt = null;	
		ResultSet rs = null;	
		
		CrewBbsDto dto = null;		
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 getCrewBbs success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/3 getCrewBbs success");
			
			rs = psmt.executeQuery();	
			if(rs.next()) {
				int i = 1;
				dto = new CrewBbsDto(rs.getInt(i++), 
									rs.getString(i++),
									rs.getString(i++),
									rs.getString(i++),
									rs.getString(i++), 
									rs.getString(i++), 
									rs.getString(i++), 
									rs.getInt(i++),
									rs.getInt(i++), 
									rs.getInt(i++), 
									rs.getString(i++), 
									rs.getInt(i++));
			}	
			System.out.println("3/3 getCrewBbs success");
			
		} catch (SQLException e) {
			System.out.println("getCrewBbs fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return dto;
	}
	
	public void crewReadcount(int seq) {
		String sql = " UPDATE CREWBBS "
				   + " SET READCOUNT=READCOUNT+1 "
				   + " WHERE SEQ=? ";
		
		Connection conn = null;			
		PreparedStatement psmt = null;	
		
		try {
			conn = DBConnection.getConnection();
				
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			
			psmt.executeQuery();
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}		
	}
	
	
	
	public List<CrewBbsDto> getCrewBbsSearchList(String choice, String search) {
		
		String sql = " SELECT SEQ, ID, NAME, TITLE, CONTENT, FILENAME, NEWFILENAME, "
				   + " 		READCOUNT, LIKECOUNT, COMCOUNT, REGDATE, BBSID ";
		
		String sWord = "";
		if(choice.equals("title")) {
			sWord = " WHERE TITLE LIKE '%" + search + "%' ";
		}else if(choice.equals("content")) {
			sWord = " WHERE CONTENT LIKE '%" + search + "%' ";
		}else if(choice.equals("writer")) {
			sWord = " WHERE NAME='" + search + "' ";
		}		
		sql = sql + sWord;
		
//		sql = sql + " ORDER BY REF DESC, STEP ASC ";
		
		Connection conn = null;			// DB 연결
		PreparedStatement psmt = null;	// Query문을 실행
		ResultSet rs = null;			// 결과 취득
		
		List<CrewBbsDto> list = new ArrayList<CrewBbsDto>();

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getCrewBbsSearchList success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/4 getCrewBbsSearchList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 getCrewBbsSearchList success");
			
			while(rs.next()) {
				int i = 1;
				CrewBbsDto dto = new CrewBbsDto(rs.getInt(i++), 
												rs.getString(i++),
												rs.getString(i++),
												rs.getString(i++),
												rs.getString(i++), 
												rs.getString(i++), 
												rs.getString(i++), 
												rs.getInt(i++),
												rs.getInt(i++), 
												rs.getInt(i++), 
												rs.getString(i++), 
												rs.getInt(i++));
				list.add(dto);
			}
			System.out.println("4/4 getCrewBbsSearchList success");
			
		} catch (SQLException e) {
			System.out.println("getCrewBbsSearchList fail");
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return list;		
	}
	
	// 글의 총수
	public int getAllCrewBbs(String choice, String search) {
		
		String sql = " SELECT COUNT(*) FROM CREWBBS ";
		
		String sWord = "";
		if(choice.equals("title")) {
			sWord = " WHERE TITLE LIKE '%" + search + "%' ";
		}else if(choice.equals("content")) {
			sWord = " WHERE CONTENT LIKE '%" + search + "%' ";
		}else if(choice.equals("writer")) {
			sWord = " WHERE NAME='" + search + "' ";
		}		
		sql = sql + sWord;
		
		Connection conn = null;			// DB 연결
		PreparedStatement psmt = null;	// Query문을 실행
		ResultSet rs = null;			// 결과 취득
		
		int len = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 getAllCrewBbs success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/3 getAllCrewBbs success");
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				len = rs.getInt(1);
			}
			System.out.println("3/3 getAllCrewBbs success");
			
		} catch (SQLException e) {
			System.out.println("getAllCrewBbs fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return len;
	}
	
	public List<CrewBbsDto> getCrewBbsPagingList(int bbsid,String choice, String search, int pageNumber) {
		
		System.out.println("bbsid: "+bbsid);
		System.out.println("choice: "+choice);
		System.out.println("pageNumber: "+pageNumber);
		String sql = " SELECT SEQ, ID, NAME, TITLE, CONTENT, FILENAME, NEWFILENAME, "
				   + " 		READCOUNT, LIKECOUNT, COMCOUNT, REGDATE, BBSID  "
				   + " FROM ";
		
		// 1. number설정
		sql += "(SELECT ROW_NUMBER()OVER(ORDER BY SEQ ASC) AS RNUM, "
				+ "		SEQ, ID, NAME, TITLE, CONTENT, FILENAME, NEWFILENAME, READCOUNT, LIKECOUNT, COMCOUNT, REGDATE, BBSID "
				+ "	FROM CREWBBS WHERE BBSID=?";
				
		
		String sWord = "";
		if(choice.equals("title")) {
			sWord = " WHERE TITLE LIKE '%" + search + "%' ";
		}else if(choice.equals("content")) {
			sWord = " WHERE CONTENT LIKE '%" + search + "%' ";
		}else if(choice.equals("writer")) {
			sWord = " WHERE NAME='" + search + "' ";
		}		
		sql = sql + sWord;
		
		sql = sql + " ORDER BY SEQ ASC) ";
		
		sql = sql + " WHERE RNUM >= ? AND RNUM <= ? ";
		
		int start, end;
		start = 1 + 10 * pageNumber;	// 0 -> 1 ~ 10	1 -> 11 ~ 20
		end = 10 + 10 * pageNumber;		
		
		Connection conn = null;			// DB 연결
		PreparedStatement psmt = null;	// Query문을 실행
		ResultSet rs = null;			// 결과 취득
		
		List<CrewBbsDto> list = new ArrayList<CrewBbsDto>();

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getCrewBbsPagingList success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, bbsid);
			psmt.setInt(2, start);
			psmt.setInt(3, end);
			System.out.println("2/4 getCrewBbsPagingList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 getCrewBbsPagingList success");
			
			while(rs.next()) {
				int i = 1;
				CrewBbsDto dto = new CrewBbsDto(rs.getInt(i++), 
												rs.getString(i++),
												rs.getString(i++),
												rs.getString(i++),
												rs.getString(i++), 
												rs.getString(i++), 
												rs.getString(i++), 
												rs.getInt(i++),
												rs.getInt(i++), 
												rs.getInt(i++), 
												rs.getString(i++), 
												rs.getInt(i++));
				list.add(dto);
			}
			System.out.println("4/4 getCrewBbsPagingList success");
			
		} catch (SQLException e) {
			System.out.println("getCrewBbsPagingList fail");
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return list;		
	}
	
	public boolean updateCrewBbs(int seq, String title, String content) {
		String sql = " UPDATE CREWBBS SET "
				+ " TITLE=?, CONTENT=? "
				+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 S updateCrewBbs");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setInt(3, seq);
			
			System.out.println("2/3 S updateCrewBbs");
			
			count = psmt.executeUpdate();
			System.out.println("3/3 S updateCrewBbs");
			
		} catch (Exception e) {			
			e.printStackTrace();
		} finally{
			DBClose.close(conn, psmt, null);			
		}		
		
		return count>0?true:false;
	}
	
	public boolean deleteCrewBbs(int seq) {
		
		System.out.println(seq);
		String sql = " DELETE CREWBBS "
					+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 S deleteCrewBbs");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/3 S deleteCrewBbs");
			
			count = psmt.executeUpdate();
			System.out.println("3/3 S deleteCrewBbs");
			
		} catch (Exception e) {		
			System.out.println("fail deleteCrewBbs");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);			
		}
		
		return count>0?true:false;
	}
	
}

