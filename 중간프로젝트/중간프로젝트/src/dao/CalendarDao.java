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

public class CalendarDao {

	private static CalendarDao dao = new CalendarDao();
	
	private CalendarDao() {
	}
	
	public static CalendarDao getInstance() {
		return dao;
	}
	
	// id별로 캘린더 리스트 가져오기
	public List<CalendarDto> getCalendarList(String id, String yyyyMM) {
		
		String sql = " SELECT SEQ, ID, NAME, TITLE, CONTENT, RDATE, WDATE, LABELCOL "
				+ "    FROM (SELECT ROW_NUMBER()OVER(PARTITION BY SUBSTR(RDATE, 1, 8) ORDER BY RDATE ASC) AS RNUM, "
				+ "			 SEQ, ID, NAME, TITLE, CONTENT, RDATE, WDATE, LABELCOL "
				+ "	  		 FROM CALENDAR "
				+ "	         WHERE ID=? AND SUBSTR(RDATE, 1, 6)=? ) "
				+ "    WHERE RNUM BETWEEN 1 AND 5 ";
		
		Connection conn = null;			
		PreparedStatement psmt = null;	
		ResultSet rs = null;		

		List<CalendarDto> list = new ArrayList<CalendarDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getCalendarList success");
				
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, yyyyMM);
			System.out.println("2/4 getCalendarList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 getCalendarList success");
			
			while(rs.next()) {
				int i = 1;
				CalendarDto dto = new CalendarDto(	rs.getInt(i++), 
													rs.getString(i++), 
													rs.getString(i++), 
													rs.getString(i++), 
													rs.getString(i++), 
													rs.getString(i++), 
													rs.getString(i++),
													rs.getString(i++));
				list.add(dto);
			}
			System.out.println("4/4 getCalendarList success");
			
		} catch (SQLException e) {
			System.out.println("getCalendarList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return list;
	}
	
// crew별로 캘린더 리스트 가져오기	
// crewdetail페이지에서 crew의 seq값 가져와서 대입 
// 해당 crew페이지에서 캘린더 누를떄 value="<%= seq%>" 넣는다. 	
public List<CalendarDto> getCrewCalendarList(int crewid, String yyyyMM) {
		
		String sql = " SELECT SEQ, CREWID, ID, NAME, TITLE, CONTENT, RDATE, WDATE, LABELCOL "
				+ "    FROM (SELECT ROW_NUMBER()OVER(PARTITION BY SUBSTR(RDATE, 1, 8) ORDER BY RDATE ASC) AS RNUM, "
				+ "			 SEQ, CREWID, ID, NAME, TITLE, CONTENT, RDATE, WDATE, LABELCOL "
				+ "	  		 FROM CALENDAR "
				+ "	         WHERE CREWID=? AND SUBSTR(RDATE, 1, 6)=? ) "
				+ "    WHERE RNUM BETWEEN 1 AND 5 ";
		
		Connection conn = null;			
		PreparedStatement psmt = null;	
		ResultSet rs = null;		

		List<CalendarDto> list = new ArrayList<CalendarDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getCalendarList success");
				
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, crewid);
			psmt.setString(2, yyyyMM);
			System.out.println("2/4 getCalendarList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 getCalendarList success");
			
			while(rs.next()) {
				int i = 1;
				CalendarDto dto = new CalendarDto(	rs.getInt(i++), 
													rs.getInt(i++),
													rs.getString(i++), 
													rs.getString(i++), 
													rs.getString(i++), 
													rs.getString(i++), 
													rs.getString(i++), 
													rs.getString(i++),
													rs.getString(i++));
				list.add(dto);
			}
			System.out.println("4/4 getCalendarList success");
			
		} catch (SQLException e) {
			System.out.println("getCalendarList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return list;
	}
	
	public CalendarDto getDay(int seq) {
		
		String sql = " SELECT SEQ, ID, NAME, TITLE, CONTENT, RDATE, WDATE, LABELCOL "
				+ "	   FROM CALENDAR "
				+ "    WHERE SEQ=? ";
		
		Connection conn = null;			
		PreparedStatement psmt = null;	
		ResultSet rs = null;	
		
		CalendarDto dto = null;		
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 getDay success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/3 getDay success");
			
			rs = psmt.executeQuery();	
			if(rs.next()) {
				int n = 1;
				dto = new CalendarDto(	rs.getInt(n++),
										rs.getString(n++), 
										rs.getString(n++), 
										rs.getString(n++), 
										rs.getString(n++), 
										rs.getString(n++),
										rs.getString(n++),
										rs.getString(n++)); 

			}	
			System.out.println("3/3 getDay success");
			
		} catch (SQLException e) {
			System.out.println("getDay fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return dto;
	}
	
	public boolean addCalendar(CalendarDto cal) {
		
		System.out.println(cal.toString());
		
		String sql = " INSERT INTO CALENDAR(SEQ, CREWID, ID, NAME, TITLE, CONTENT, RDATE, WDATE, LABELCOL) "
				   + " VALUES(SEQ_CAL.NEXTVAL, 1, ?, ?, ?, ?, ?, SYSDATE, ?) ";
		
		Connection conn = null;			
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 addCalendar success");
			
			psmt = conn.prepareStatement(sql);
		//	psmt.setInt(1, cal.getCrewid());
			
			psmt.setString(1, cal.getId());
			psmt.setString(2, cal.getName());
			psmt.setString(3, cal.getTitle());
			psmt.setString(4, cal.getContent());
			psmt.setString(5, cal.getRdate());
			psmt.setString(6, cal.getLabelcol());
			
			System.out.println("2/3 addCalendar success");
			
			count = psmt.executeUpdate();
			System.out.println("3/3 addCalendar success");
			
		} catch (SQLException e) {
			System.out.println("addCalendar fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		return count>0?true:false;
	}
	
	public boolean deleteCal(int seq) {
		
		String sql = " DELETE FROM "
					+ " CALENDAR "
					+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 S deleteCal");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/3 S deleteCal");
			
			count = psmt.executeUpdate();
			System.out.println("3/3 S deleteCal");
			
		} catch (Exception e) {		
			System.out.println("fail deleteCal");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);			
		}
		
		return count>0?true:false;
	}
	
public boolean updateCal(CalendarDto dto) {
		
		String sql = " UPDATE CALENDAR SET "
				+ " TITLE=?, CONTENT=?, RDATE=?, WDATE=SYSDATE , LABELCOL=? "
				+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 S updateCalendar");	
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getRdate());
			psmt.setString(4, dto.getLabelcol());
			psmt.setInt(5, dto.getSeq());
			System.out.println("2/3 S updateCalendar");	
			
			count = psmt.executeUpdate();
			System.out.println("3/3 S updateCalendar");	
			
		} catch (Exception e) {			
			e.printStackTrace();
		} finally{
			DBClose.close(conn, psmt, null);				
		}
		
		return count>0?true:false;
	}
	
	public List<CalendarDto> getDayList(String id, String yyyymmdd){
		
		String sql = " SELECT SEQ, CREWID, ID, NAME, TITLE, CONTENT, RDATE, WDATE, LABELCOL "
				  +  " FROM CALENDAR "
				  +	 " WHERE ID=? AND SUBSTR(RDATE, 1, 8)=? "
				  +	 " ORDER BY RDATE ASC ";
		
		Connection conn = null;			
		PreparedStatement psmt = null;	
		ResultSet rs = null;	
		
		List<CalendarDto> list = new ArrayList<CalendarDto>();
		
		
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 S getDayList");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, yyyymmdd);
			System.out.println("2/4 S getDayList");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 S getDayList");
			
			while(rs.next()) {
				int i = 1;
				CalendarDto dto = new CalendarDto(	rs.getInt(i++),
													rs.getInt(i++),
													rs.getString(i++),
													rs.getString(i++),
													rs.getString(i++), 
													rs.getString(i++), 
													rs.getString(i++), 
													rs.getString(i++),
													rs.getString(i++));
				list.add(dto);
			}
			System.out.println("4/4 S getDayList");
		} catch (SQLException e) {
			System.out.println("getDayList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return list;
		
	}
	
	
}
