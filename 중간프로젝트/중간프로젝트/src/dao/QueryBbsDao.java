package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
/*import dto.BbsDto;*/
import dto.QueryBbsDto;

public class QueryBbsDao {

	private static QueryBbsDao dao = null;
	
	private QueryBbsDao() {
	}
	
	public static QueryBbsDao getInstance() {
		if(dao == null) {
			dao = new QueryBbsDao();
		}		
		return dao;
	}
	
	public List<QueryBbsDto> getBbsList() {
		
		String sql = " SELECT SEQ, ID, REF, STEP, DEPTH, "
				   + " 		TITLE, CONTENT, WDATE, DEL, READCOUNT "
				   + " FROM QUERYBBS "
				   + " ORDER BY REF DESC, STEP ASC ";
		
		Connection conn = null;			// DB 연결
		PreparedStatement psmt = null;	// Query문을 실행
		ResultSet rs = null;			// 결과 취득
		
		List<QueryBbsDto> list = new ArrayList<QueryBbsDto>();

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getBbsList success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/4 getBbsList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 getBbsList success");
			
			while(rs.next()) {
				QueryBbsDto dto = new QueryBbsDto(rs.getInt(1), 
										rs.getString(2), 
										rs.getInt(3), 
										rs.getInt(4), 
										rs.getInt(5), 
										rs.getString(6), 
										rs.getString(7), 
										rs.getString(8), 
										rs.getInt(9), 
										rs.getInt(10));
				list.add(dto);
			}
			System.out.println("4/4 getBbsList success");
			
		} catch (SQLException e) {
			System.out.println("getBbsList fail");
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return list;		
	}
	
	public boolean writeBbs(QueryBbsDto dto) {
	
		String sql = " INSERT INTO QUERYBBS(SEQ, ID, REF, STEP, DEPTH,"
				   + "                 TITLE, CONTENT, WDATE,"
				   + "                 DEL, READCOUNT) "
				   + " VALUES(SEQ_QUERYBBS.NEXTVAL, ?, "
				   + "					(SELECT NVL(MAX(REF), 0)+1 FROM QUERYBBS), 0, 0, "
				   + "					?, ?, SYSDATE, "
				   + "					0, 0) ";
		
		Connection conn = null;			
		PreparedStatement psmt = null;	
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();			
			System.out.println("1/3 writeBbs success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			System.out.println("2/3 writeBbs success");
			
			count = psmt.executeUpdate();
			System.out.println("3/3 writeBbs success");
			
		} catch (SQLException e) {
			System.out.println("writeBbs fail");
		} finally {
			DBClose.close(conn, psmt, null);
		}
		return count>0?true:false;
	}
	
	public QueryBbsDto getBbs(int seq) {
		
		String sql = " SELECT SEQ, ID, REF, STEP, DEPTH, "
				+ "			TITLE, CONTENT, WDATE, DEL, READCOUNT "
				+ "	   FROM QUERYBBS "
				+ "    WHERE SEQ=? ";
		
		Connection conn = null;			
		PreparedStatement psmt = null;	
		ResultSet rs = null;	
		
		QueryBbsDto dto = null;		
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 getBbs success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/3 getBbs success");
			
			rs = psmt.executeQuery();	
			if(rs.next()) {
				int n = 1;
				dto = new QueryBbsDto(	rs.getInt(n++), 
									rs.getString(n++), 
									rs.getInt(n++), 
									rs.getInt(n++), 
									rs.getInt(n++), 
									rs.getString(n++), 
									rs.getString(n++), 
									rs.getString(n++), 
									rs.getInt(n++), 
									rs.getInt(n++));
			}	
			System.out.println("3/3 getBbs success");
			
		} catch (SQLException e) {
			System.out.println("getBbs fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return dto;
	}
	
	public void readcount(int seq) {
		String sql = " UPDATE QUERYBBS "
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
	
	//					  부모글번호    새로운답글			
	public boolean answer(int seq, QueryBbsDto bbs) {
		// update
		String sql1 = " UPDATE QUERYBBS "
					+ "	SET STEP=STEP+1 "
					+ " WHERE REF = (SELECT REF FROM QUERYBBS WHERE SEQ=? )"
					+ " 	AND STEP > (SELECT STEP FROM QUERYBBS WHERE SEQ=? )";
		
		// insert
		String sql2 = " INSERT INTO QUERYBBS(SEQ, ID, "
					+ "					REF, STEP, DEPTH, "
					+ "					TITLE, CONTENT, WDATE, DEL, READCOUNT ) "
					+ " VALUES(SEQ_QUERYBBS.NEXTVAL, ?, "
					+ "					(SELECT REF FROM QUERYBBS WHERE SEQ=?), "
					+ "					(SELECT STEP FROM QUERYBBS WHERE SEQ=?) + 1, "
					+ "					(SELECT DEPTH FROM QUERYBBS WHERE SEQ=?) + 1, "
					+ "			?, ?, SYSDATE, 0, 0) ";
		
		Connection conn = null;			
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			conn.setAutoCommit(false);
			System.out.println("1/6 answer success");
			
			// update
			psmt = conn.prepareStatement(sql1);
			psmt.setInt(1, seq);
			psmt.setInt(2, seq);
			System.out.println("2/6 answer success");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 answer success");
			
			// psmt 초기화
			psmt.clearParameters();
			
			// insert
			psmt = conn.prepareStatement(sql2);
			psmt.setString(1, bbs.getId());
			psmt.setInt(2, seq);
			psmt.setInt(3, seq);
			psmt.setInt(4, seq);
			psmt.setString(5, bbs.getTitle());
			psmt.setString(6, bbs.getContent());
			System.out.println("4/6 answer success");
			
			count = psmt.executeUpdate();
			System.out.println("5/6 answer success");
			
			conn.commit();
			System.out.println("6/6 answer success");
			
		} catch (SQLException e) {
			System.out.println("answer fail");			
			try {
				conn.rollback();
			} catch (SQLException e1) {				
				e1.printStackTrace();
			}			
			e.printStackTrace();
		} finally {			
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			DBClose.close(conn, psmt, null);			
		}
		
		return count>0?true:false;		
	}
	
	public List<QueryBbsDto> getBbsSearchList(String choice, String search) {
		
		String sql = " SELECT SEQ, ID, REF, STEP, DEPTH, "
				   + " 		TITLE, CONTENT, WDATE, DEL, READCOUNT "
				   + " FROM QUERYBBS ";
		
		String sWord = "";
		if(choice.equals("title")) {
			sWord = " WHERE TITLE LIKE '%" + search + "%' ";
		}else if(choice.equals("content")) {
			sWord = " WHERE CONTENT LIKE '%" + search + "%' ";
		}else if(choice.equals("writer")) {
			sWord = " WHERE ID='" + search + "' ";
		}		
		sql = sql + sWord;
		
		sql = sql + " ORDER BY REF DESC, STEP ASC ";
		
		Connection conn = null;			// DB 연결
		PreparedStatement psmt = null;	// Query문을 실행
		ResultSet rs = null;			// 결과 취득
		
		List<QueryBbsDto> list = new ArrayList<QueryBbsDto>();

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getBbsList success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/4 getBbsList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 getBbsList success");
			
			while(rs.next()) {
				QueryBbsDto dto = new QueryBbsDto(rs.getInt(1), 
										rs.getString(2), 
										rs.getInt(3), 
										rs.getInt(4), 
										rs.getInt(5), 
										rs.getString(6), 
										rs.getString(7), 
										rs.getString(8), 
										rs.getInt(9), 
										rs.getInt(10));
				list.add(dto);
			}
			System.out.println("4/4 getBbsList success");
			
		} catch (SQLException e) {
			System.out.println("getBbsList fail");
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return list;		
	}
	
	// 글의 총수
	public int getAllBbs(String choice, String search) {
		
		String sql = " SELECT COUNT(*) FROM QUERYBBS ";
		
		String sWord = "";
		if(choice.equals("title")) {
			sWord = " WHERE TITLE LIKE '%" + search + "%' ";
		}else if(choice.equals("content")) {
			sWord = " WHERE CONTENT LIKE '%" + search + "%' ";
		}else if(choice.equals("writer")) {
			sWord = " WHERE ID='" + search + "' ";
		}		
		sql = sql + sWord;
		
		Connection conn = null;			// DB 연결
		PreparedStatement psmt = null;	// Query문을 실행
		ResultSet rs = null;			// 결과 취득
		
		int len = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 getAllBbs success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/3 getAllBbs success");
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				len = rs.getInt(1);
			}
			System.out.println("3/3 getAllBbs success");
			
		} catch (SQLException e) {
			System.out.println("getAllBbs fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return len;
	}
	
	public List<QueryBbsDto> getBbsPagingList(String choice, String search, int pageNumber) {
		
		String sql = " SELECT SEQ, ID, REF, STEP, DEPTH, "
				   + " 		TITLE, CONTENT, WDATE, DEL, READCOUNT "
				   + " FROM ";
		
		// 1. number설정
		sql += "(SELECT ROW_NUMBER()OVER(ORDER BY REF DESC, STEP ASC) AS RNUM, "
				+ "		SEQ, ID, REF, STEP, DEPTH, TITLE, CONTENT, WDATE, DEL, READCOUNT "
				+ "	FROM QUERYBBS";
		
		String sWord = "";
		if(choice.equals("title")) {
			sWord = " WHERE TITLE LIKE '%" + search + "%' ";
		}else if(choice.equals("content")) {
			sWord = " WHERE CONTENT LIKE '%" + search + "%' ";
		}else if(choice.equals("writer")) {
			sWord = " WHERE ID='" + search + "' ";
		}		
		sql = sql + sWord;		
		
		sql = sql + " ORDER BY REF DESC, STEP ASC) ";
		
		sql = sql + " WHERE RNUM >= ? AND RNUM <= ? ";
		
		int start, end;
		start = 1 + 10 * pageNumber;	// 0 -> 1 ~ 10	1 -> 11 ~ 20
		end = 10 + 10 * pageNumber;		
		
		Connection conn = null;			// DB 연결
		PreparedStatement psmt = null;	// Query문을 실행
		ResultSet rs = null;			// 결과 취득
		
		List<QueryBbsDto> list = new ArrayList<QueryBbsDto>();

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getBbsList success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);
			System.out.println("2/4 getBbsList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 getBbsList success");
			
			while(rs.next()) {
				QueryBbsDto dto = new QueryBbsDto(rs.getInt(1), 
										rs.getString(2), 
										rs.getInt(3), 
										rs.getInt(4), 
										rs.getInt(5), 
										rs.getString(6), 
										rs.getString(7), 
										rs.getString(8), 
										rs.getInt(9), 
										rs.getInt(10));
				list.add(dto);
			}
			System.out.println("4/4 getBbsList success");
			
		} catch (SQLException e) {
			System.out.println("getBbsList fail");
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return list;		
	}
	
	public boolean updateBbs(int seq, String title, String content) {
		String sql = " UPDATE QUERYBBS SET "
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
	
	public boolean deleteBbs(int seq) {
		
		String sql = " UPDATE QUERYBBS "
					+ " SET DEL=1 "
					+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 S deleteBbs");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/3 S deleteBbs");
			
			count = psmt.executeUpdate();
			System.out.println("3/3 S deleteBbs");
			
		} catch (Exception e) {		
			System.out.println("fail deleteBbs");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);			
		}
		
		return count>0?true:false;
	}
	public boolean myBbsDelete(int seq) {
	      String sql = " DELETE FROM QUERYBBS "
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
	
}

















