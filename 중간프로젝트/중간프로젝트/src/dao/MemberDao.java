package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.MemberDto;

public class MemberDao {

	private static MemberDao dao = new MemberDao();
	
	private MemberDao() {
		DBConnection.initConnection();
	}
	
	public static MemberDao getInstance() {
		return dao;
	}
	
	public MemberDto newLogin(MemberDto dto) {
		String sql = " SELECT SEQ, ID, NAME, PWD, EMAIL, AUTH, LOC "
				   + " FROM MEMBER "
				   + " WHERE ID=? ";
		
		Connection conn = null;			
		PreparedStatement psmt = null;	
		ResultSet rs = null;
		
		MemberDto mem = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 login success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			System.out.println("2/3 login success");
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				int seq = rs.getInt(1);
				String id = rs.getString(2);
				String name = rs.getString(3);
				String pwd = rs.getString(4);
				String email = rs.getString(5);
				int auth = rs.getInt(6);
				String loc = rs.getString(7);
				
				mem = new MemberDto(seq, id, name, pwd, email, auth, loc);
				
			}
			System.out.println("3/3 login success");
			
		} catch (SQLException e) {
			System.out.println("login fail");
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return mem;		
	}
	
	public boolean addMember(MemberDto dto) {
		
		String sql = " INSERT INTO MEMBER(SEQ, ID, NAME, PWD, EMAIL, AUTH, LOC) "
				   + " VALUES(SEQ_MEMBER.NEXTVAL, ?, ?, ?, ?, 3, ?) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 addMember success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getPwd());
			psmt.setString(4, dto.getEmail());
			psmt.setString(5, dto.getLoc());
			System.out.println("2/3 addMember success");
			
			System.out.println(dto.getId()+" "+dto.getPwd()+" " + dto.getName()+ " "
								+ dto.getEmail() + " " + dto.getLoc());
			
			count = psmt.executeUpdate();
			System.out.println("3/3 addMember success");
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("addMember fail");
		} finally {
			DBClose.close(conn, psmt, null);
		}
		
		return count>0?true:false;
	}
	
	
	public MemberDto login(MemberDto dto) {
		String sql = " SELECT SEQ, ID, NAME, EMAIL, AUTH, LOC "
				   + " FROM MEMBER "
				   + " WHERE ID=? AND PWD=? ";
		
		Connection conn = null;			
		PreparedStatement psmt = null;	
		ResultSet rs = null;
		
		MemberDto mem = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 login success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPwd());
			System.out.println("2/3 login success");
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				int seq = rs.getInt(1);
				String id = rs.getString(2);
				String name = rs.getString(3);
				String email = rs.getString(4);
				int auth = rs.getInt(5);
				String loc = rs.getString(6);
				
				mem = new MemberDto(seq, id, name, null, email, auth, loc);
			}
			System.out.println("3/3 login success");
			
		} catch (SQLException e) {
			System.out.println("login fail");
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return mem;		
	}
	
	public MemberDto getMember(String name) {
		String sql = " SELECT SEQ, ID, NAME, PWD, EMAIL, AUTH, LOC "
					+ " FROM MEMBER "
					+ " WHERE NAME=? ";		
		
		Connection conn = null;	
		PreparedStatement psmt = null;	
		ResultSet rs = null;			
		
		MemberDto dto = null;
	
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 getMember Success!");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			System.out.println("2/3 getMember Success!");
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				int n = 1;
				dto = new MemberDto(rs.getInt(n++), 	
									rs.getString(n++), 
									rs.getString(n++),
									rs.getString(n++),
									rs.getString(n++), 
									rs.getInt(n++),
									rs.getString(n++));
			}
			
			System.out.println("3/3 getMember Success!");
			
		} catch (SQLException e) {
			System.out.println("getMember Fail!");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return dto;
	}
	
	public boolean getName(String name) {
		String sql = " SELECT NAME "
					+ " FROM MEMBER "
					+ " WHERE NAME=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		boolean b = false;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 getName Success!!");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			System.out.println("2/3 getName Success!!");
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				b = true;
			}
			System.out.println("3/3 getName Success!!");
			
		} catch (SQLException e) {
			System.out.println("getName Fail..");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return b;
	}
		public boolean memberUpdate(String id, String name, String pwd, String email, String loc) {
	      String sql = " UPDATE MEMBER "
	               + " SET NAME=?, PWD=?, EMAIL=?, LOC=? "
	               + " WHERE ID=? " ;
	      
	      Connection conn = null;
	      PreparedStatement psmt = null;
	      int count = 0;
	      
	      try {
	         conn = DBConnection.getConnection();
	         System.out.println("1/3 memberUpdate Success!!");
	         
	         psmt = conn.prepareStatement(sql);
	         psmt.setString(1, name);
	         psmt.setString(2, pwd);
	         psmt.setString(3, email);
	         psmt.setString(4, loc);
	         psmt.setString(5, id);
	         System.out.println("2/3 memberUpdate Success!!");
	      
	         
	         count = psmt.executeUpdate();
	         System.out.println("3/3 memberUpdate Success!!");
	         
	      } catch (SQLException e) {
	         System.out.println("memberUpdate Fail..");
	         e.printStackTrace();
	      } finally {
	         DBClose.close(conn, psmt, null);
	      }
	      return count>0?true:false;
	   }
	
		public boolean memberDelete(String id) {
		String sql = " DELETE FROM MEMBER "
					+ " WHERE id=? ";

		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 memberDelete Success!!");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			System.out.println("2/3 memberDelete Success!!");
			
			count = psmt.executeUpdate();
			System.out.println("3/3 memberDelete Success!!");
			
		} catch (SQLException e) {
			System.out.println("memberDelete Fail..");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		return count>0?true:false;
	}
	
	public boolean memberDeleteUp(String id) {
		String sql = " UPDATE MEMBER "
					+ " SET AUTH=0 "
					+ " WHERE ID=? " ;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 memberDeleteUp Success!!");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			System.out.println("2/3 memberDeleteUp Success!!");
			
			count = psmt.executeUpdate();
			System.out.println("3/3 memberDeleteUp Success!!");
			
		} catch (SQLException e) {
			System.out.println("memberDeleteUp Fail..");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		return count>0?true:false;
	}
	
	
	public boolean getId(String id) {
		
		String sql = " SELECT ID "
				   + " FROM MEMBER "
				   + " WHERE ID=? ";

		Connection conn = null;			
		PreparedStatement psmt = null;	
		ResultSet rs = null;			
		
		boolean findId = false;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 getId success");
				
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			System.out.println("2/3 getId success");
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				findId = true;
			}
			System.out.println("3/3 getId success");
		
		} catch (SQLException e) {
			System.out.println("getId fail");			
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return findId;
	}
	public List<MemberDto> getuserPagingList(String choice, String search, int pageNumber) {
		
		String sql = " SELECT SEQ, ID, NAME, PWD, EMAIL, "
				   + " 		AUTH, LOC "
				   + " FROM ";
		
		// 1. number설정
		sql += "(SELECT ROW_NUMBER()OVER(ORDER BY SEQ DESC) AS RNUM, "
				+ "		SEQ, ID, NAME, PWD, EMAIL, AUTH, LOC "
				+ "	FROM MEMBER";
		
		String sWord = "";
		if(choice.equals("ID")) {
			sWord = " WHERE ID LIKE '%" + search + "%' ";
		}else if(choice.equals("NAME")) {
			sWord = " WHERE NAME LIKE '%" + search + "%' ";
		}else if(choice.equals("LOC")) {
			sWord = " WHERE LOC='" + search + "' ";
		}		
		sql = sql + sWord;		
		
		sql = sql + " ORDER BY SEQ DESC) ";
		
		sql = sql + " WHERE RNUM >= ? AND RNUM <= ? ";
		
		int start, end;
		start = 1 + 10 * pageNumber;
		end = 10 + 10 * pageNumber;		
		
		Connection conn = null;			
		PreparedStatement psmt = null;	
		ResultSet rs = null;			
		
		List<MemberDto> list = new ArrayList<MemberDto>();

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getMemberList success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);
			System.out.println("2/4 getMemberist success");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 getMemberList success");
			
			while(rs.next()) {
				MemberDto dto = new MemberDto(rs.getInt(1), 
										rs.getString(2), 
										rs.getString(3), 
										rs.getString(4), 
										rs.getString(5), 
										rs.getInt(6), 
										rs.getString(7));
				list.add(dto);
			}
			System.out.println("4/4 getMemberList success");
			
		} catch (SQLException e) {
			System.out.println("getMemberList fail");
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return list;		
	}
	public MemberDto getId(int seq) {
		String sql = " SELECT SEQ, ID, NAME, PWD, EMAIL, AUTH, LOC "
				   + " FROM MEMBER "
				+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		MemberDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getId success");	
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/4 getId success");	
			
			rs = psmt.executeQuery();
			System.out.println("3/4 getId success");	
			
			if(rs.next()){
				dto = new MemberDto();
				dto.setSeq(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setPwd(rs.getString(4));
				dto.setEmail(rs.getString(5));
				dto.setAuth(rs.getInt(6));
				dto.setLoc(rs.getString(7));
			}	
			System.out.println("4/4 getId success");			
						
		} catch (Exception e) {			
			e.printStackTrace();
		} finally{
			DBClose.close(conn, psmt, rs);					
		}		
		
		return dto;
	}
	
		public boolean deleteUser(int seq) {
		
		String sql = " DELETE FROM MEMBER"
				+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 S deleteMEMBER");	
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/3 S deleteMEMBER");	
			
			count = psmt.executeUpdate();
			System.out.println("3/3 S deleteMEMBER");				
			
		} catch (Exception e) {			
			e.printStackTrace();
		} finally{
			DBClose.close(conn, psmt, null);	
		}
		
		return count>0?true:false;
	}
public int getAllUser(String choice, String search) {
			
			String sql = " SELECT COUNT(*) FROM MEMBER ";
			
			String sWord = "";
			if(choice.equals("id")) {
				sWord = " WHERE TITLE LIKE '%" + search + "%' ";
			}else if(choice.equals("name")) {
				sWord = " WHERE CONTENT LIKE '%" + search + "%' ";
			}else if(choice.equals("email")) {
				sWord = " WHERE ID='" + search + "' ";
			}		
			sql = sql + sWord;
			
			Connection conn = null;			
			PreparedStatement psmt = null;
			ResultSet rs = null;			
			
			int len = 0;
			
			try {
				conn = DBConnection.getConnection();
				System.out.println("1/3 getAllUser success");
				
				psmt = conn.prepareStatement(sql);
				System.out.println("2/3 getAllUser success");
				
				rs = psmt.executeQuery();
				if(rs.next()) {
					len = rs.getInt(1);
				}
				System.out.println("3/3 getAllUser success");
				
			} catch (SQLException e) {
				System.out.println("getAllUser fail");
				e.printStackTrace();
			} finally {
				DBClose.close(conn, psmt, rs);
			}
			
			return len;
		}
}







