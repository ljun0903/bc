package comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;

public class CommentDao {

	
	
	
	private static CommentDao dao = new CommentDao();
	
	public CommentDao() {
		DBConnection.initConnection();
	}
	
	public static CommentDao getInstance() {
		return dao;
	}
	
	public ArrayList<CommentDto> search(String name){
		String sql = "SELECT * FROM COMMENTDB WHERE NAME LIKE ?";
		 
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		ArrayList<CommentDto> list = new ArrayList<CommentDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getSearchComList success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, "%" + name + "%"); //와일드 카드 넣어줌
			System.out.println("2/4 getSearchComList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 getSearchComList success");
			
			while(rs.next()) {
				int i = 1;
				CommentDto dto = new CommentDto(rs.getInt(i++), 
												rs.getInt(i++), 
												rs.getInt(i++),
												rs.getString(i++), 
												rs.getString(i++), 
												rs.getString(i++),
												rs.getString(i++),
												rs.getInt(i++), 
												rs.getInt(i++));
					list.add(dto);
			}
			System.out.println("4/4 getSearchComList success");
		} catch (Exception e) {
			System.out.println("getSearchComList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return list;
	}
	
	public int register(CommentDto dto) {
		
		String sql = "INSERT INTO COMMENTDB VALUES(SEQ_COMMENT.NEXTVAL, 3, 0, ?, ?, SYSDATE, ?, 0, 0)";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 addComment success");
			
			psmt = conn.prepareStatement(sql);
//			psmt.setInt(1, dto.getBbsnum());
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			System.out.println("2/3 addComment success");
			
			count = psmt.executeUpdate();
			System.out.println("3/3 addComment success");
			
		} catch (Exception e) {
			System.out.println("addComment false");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		return -1; // DB오류
	}
	
	public List<CommentDto> getComlist(int bbsid, int comstep){
		
		String sql = " SELECT SEQ, BBSID, COMSTEP, ID, NAME, REGDATE, "
				+ "    		  CONTENT, LIKECOUNT, DISLIKECOUNT "
				+ "	   FROM COMMENTDB "
				+ "	   WHERE BBSID=? AND COMSTEP=? "
				+ "	   ORDER BY REGDATE DESC ";
		
		Connection conn = null;			// DB 연결
		PreparedStatement psmt = null;	// Query문을 실행
		ResultSet rs = null;			// 결과 취득
		
		List<CommentDto> list = new ArrayList<CommentDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getComlist success");
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, bbsid);
			psmt.setInt(2, comstep);
			System.out.println("2/4 getComlist success");
			rs = psmt.executeQuery();
			System.out.println("3/4 getComlist success");
			
			while(rs.next()) {
				int i = 1;
				CommentDto dto = new CommentDto(rs.getInt(i++), 
												rs.getInt(i++), 
												rs.getInt(i++),
												rs.getString(i++), 
												rs.getString(i++), 
												rs.getString(i++),
												rs.getString(i++),
												rs.getInt(i++), 
												rs.getInt(i++));
				list.add(dto);
			}
			System.out.println("4/4 getComlist success");
			
		} catch (SQLException e) {
			System.out.println("getComlist fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return list;
	}
	
	
	public int addcom(CommentDto dto) {
		
		String sql = "INSERT INTO COMMENTDB(SEQ, BBSID, COMSTEP, ID, NAME, REGDATE, CONTENT, LIKECOUNT, DISLIKECOUNT)"
				+ "	  VALUES(SEQ_COMMENT.NEXTVAL, ?, ?, ?, ?, SYSDATE, ?, 0, 0) ";
	
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;	
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 addComment success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getBbsid());
			psmt.setInt(2, dto.getComstep());
			psmt.setString(3, dto.getId());
			psmt.setString(4, dto.getName());
			psmt.setString(5, dto.getContent());
			System.out.println("2/3 addComment success");
			
			count = psmt.executeUpdate();
			System.out.println("3/3 addComment success");
			
		} catch (Exception e) {
			System.out.println("addComment false");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		return -1; // DB오류
	
	}
	

}
