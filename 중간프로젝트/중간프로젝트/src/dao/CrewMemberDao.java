package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.CalendarDto;
import dto.CrewMemberDto;

public class CrewMemberDao {
	
	private static CrewMemberDao dao = new CrewMemberDao();
	
	
	
	private CrewMemberDao() {}
	
	public static CrewMemberDao getInstance() {
		return dao;
	}
	
	
	// crewid 즉 게시판 별로 리스트를 가져온다
	public List<CrewMemberDto> getMemberBbsList(int crewid){
		
		String sql = "SELECT SEQ, CREWNUM, MEMBER_ID, MEMBER_NAME "
				+ "   FROM CREWMEMBER "
				+ "   WHERE CREWNUM=? ";
		
		Connection conn = null;			
		PreparedStatement psmt = null;	
		ResultSet rs = null;
		
		List<CrewMemberDto> list = new ArrayList<CrewMemberDto>();		
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 getDay success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, crewid);
			System.out.println("2/3 getDay success");
			
			
			
			rs = psmt.executeQuery();	
			while(rs.next()) {
				int n = 1;
			CrewMemberDto dto = new CrewMemberDto(rs.getInt(n++),
												  rs.getInt(n++), 
												  rs.getString(n++), 
												  rs.getString(n++)); 
				list.add(dto);
			}	
			System.out.println("3/3 getDay success");
			
		} catch (SQLException e) {
			System.out.println("getDay fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return list;
	}
	
	
	// 크루 가입하기 누르면 실행시켜서 CREWMEMBER 테이블에 
	// 데이터를 저장시킨다.
	public boolean addCrewMember(CrewMemberDto dto) {
		
		String sql = " INSERT INTO CREWMEMBER(SEQ, CREWNUM, MEMBER_ID, MEMBER_NAME ) "
				+ "    VALUES(SEQ_CREWMEMBER.NEXTVAL, ?, ?, ?) ";
		
		Connection conn = null;			
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 addCrewMember success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getCrewnum());
			psmt.setString(2, dto.getMemberid());
			psmt.setString(3, dto.getMembername());
			System.out.println("2/3 addCrewMember success");
			
			count = psmt.executeUpdate();
			System.out.println("3/3 addCrewMember success");
			
		} catch (SQLException e) {
			System.out.println("addCrewMember fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		return count>0?true:false;
	}
}
