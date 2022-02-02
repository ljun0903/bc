package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.ChatDto;
import dto.CrewDto;

public class CrewDao {
	
	private static CrewDao cd = new CrewDao();
	
	public CrewDao() {
		DBConnection.initConnection();
	}
	
	public static CrewDao getInstance() {
		return cd;
	}
	
	
	
	public boolean crewMemberdelete(int seq, String id) {
		
		String sql = " DELETE FROM CREWMEMBER  "
				   + " WHERE CREWNUM=? AND MEMBER_ID=? ";

		Connection conn = null;			// DB 연결
		PreparedStatement psmt = null;	// Query문을 실행

		int count = 0;
		
		try {
		conn = DBConnection.getConnection();
		System.out.println("1/3 crewMemberdelete success");

		psmt = conn.prepareStatement(sql);
		psmt.setInt(1, seq);
		psmt.setString(2, id);
		System.out.println("2/3 crewMemberdelete success");

		count = psmt.executeUpdate();  // 실행된 레코드 수 반환
		System.out.println("3/3 crewMemberdelete success");
		
		} catch (SQLException e) {
		e.printStackTrace();
		System.out.println("crewMemberdelete fail");
		
		} finally {
		DBClose.close(conn, psmt, null);
		}
	
		return count>0?true:false;
	}
	

	
	public boolean checkCrewMember(String seq, String id) {
//	INSERT INTO CREWMEMBER(SEQ, CREWNUM, MEMBER_ID, MEMBER_NAME) "
// 		      + " VALUES(SEQ_CREW.NEXTVAL, ?, ?, ?) ";
	
		String sql = " SELECT SEQ "
				   + " FROM CREWMEMBER "
				   + " WHERE CREWNUM=? AND MEMBER_ID=?";
		
		Connection conn = null;			// DB 연결
		PreparedStatement psmt = null;	// Query문을 실행
		ResultSet rs = null;			// 결과 취득

		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 checkCrewMember success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, seq);
			psmt.setString(2, id);

			System.out.println("2/4 checkCrewMember success");

			rs = psmt.executeQuery();
			System.out.println("3/4 checkCrewMember success");
			if(rs.next()) {
				count = rs.getInt(1);
			}
			System.out.println("4/4 checkCrewMember success");
			
		} catch (SQLException e) {
			System.out.println("checkCrewMember fail");
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return count>0?true:false; 	
	}
	
	public List<ChatDto> getChat(int crewseq) {
		
		String sql = " SELECT SEQ, CHATNUM, NAME, REGTIME, CONTENT "
				   + " FROM CHAT "
				   + " WHERE CHATNUM=? ";
		
		Connection conn = null;			// DB 연결
		PreparedStatement psmt = null;	// Query문을 실행
		ResultSet rs = null;			// 결과 취득
		
		List<ChatDto> list = new ArrayList<ChatDto>();

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getChat success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, crewseq);
			System.out.println("2/4 getChat success");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 getChat success");
			
			while(rs.next()) {
			int n = 1;
			ChatDto dto = new ChatDto(rs.getInt(n++), 
										rs.getInt(n++), 
										rs.getString(n++), 
										rs.getString(n++), 
										rs.getString(n++) 
										);
				list.add(dto);
			}
			System.out.println("4/4 getChat success");
			
		} catch (SQLException e) {
			System.out.println("getChat fail");
	        e.printStackTrace();

		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return list;		
	}
	
	
	public boolean chat(String crewseq, String name, String date, String content) {
		   
		   String sql = " INSERT INTO CHAT(SEQ, CHATNUM, NAME, REGTIME, CONTENT) "
		   		      + " VALUES(SEQ_CHAT.NEXTVAL, ?, ?, ?, ?) ";
		   
		   	  Connection conn = null;
		      PreparedStatement psmt = null;
		      
		      int count = 0;
		      
		      try {
		          conn = DBConnection.getConnection();
		          System.out.println("1/3 chat Success!!");
		          
		          psmt = conn.prepareStatement(sql);
		          psmt.setString(1, crewseq);
		          psmt.setString(2, name);
		          psmt.setString(3, date);
		          psmt.setString(4, content);

		          
		          System.out.println("2/3 chat Success!!");
		          
		          count = psmt.executeUpdate();
		          System.out.println("3/3 chat Success!!");
		          
		       } catch (SQLException e) {
		          System.out.println("chat Fail..");
		          e.printStackTrace();
		       } finally {
		          DBClose.close(conn, psmt, null);
		       }
				return count>0?true:false;   
	   } 
	
	
	
	public void curcount(int seq) {
		String sql = " UPDATE CREW "
					+ " SET CURCOUNT=CURCOUNT+1 "
					+ " WHERE SEQ=?";
		
		Connection conn = null;			
		PreparedStatement psmt = null;

		try {
	
			conn = DBConnection.getConnection();

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			
			
			psmt.executeQuery();  // 실행된 레코드 수 반환
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			DBClose.close(conn, psmt, null);
		}
	}
	
	public void curcountDrop(int seq) {
		String sql = " UPDATE CREW "
					+ " SET CURCOUNT=CURCOUNT-1 "
					+ " WHERE SEQ=?";
		
		Connection conn = null;			
		PreparedStatement psmt = null;

		try {
	
			conn = DBConnection.getConnection();

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			
			
			psmt.executeQuery();  // 실행된 레코드 수 반환
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			DBClose.close(conn, psmt, null);
		}
	}
	
	
	
	public boolean joinCrew(int crewseq, String id, String name) {
		   
		   String sql = " INSERT INTO CREWMEMBER(SEQ, CREWNUM, MEMBER_ID, MEMBER_NAME) "
		   		      + " VALUES(SEQ_CREW.NEXTVAL, ?, ?, ?) ";
		   
		   	  Connection conn = null;
		      PreparedStatement psmt = null;
		      
		      int count = 0;
		      
		      try {
		          conn = DBConnection.getConnection();
		          System.out.println("1/3 joinCrew Success!!");
		          
		          psmt = conn.prepareStatement(sql);
		          psmt.setInt(1, crewseq);
		          psmt.setString(2, id);
		          psmt.setString(3, name);
		         


		          
		          System.out.println("2/3 joinCrew Success!!");
		          
		          count = psmt.executeUpdate();
		          System.out.println("3/3 joinCrew Success!!");
		          
		          curcount(crewseq);
		          
		       } catch (SQLException e) {
		          System.out.println("joinCrew Fail..");
		          e.printStackTrace();
		       } finally {
		          DBClose.close(conn, psmt, null);
		       }
				return count>0?true:false;   
	   } 
	
	public boolean crewdelete(int seq) {
		
		String sql = " DELETE FROM CREW  "
				   + " WHERE SEQ=? ";

		Connection conn = null;			// DB 연결
		PreparedStatement psmt = null;	// Query문을 실행

		int count = 0;
		
		try {
		conn = DBConnection.getConnection();
		System.out.println("1/3 crewdelete success");

		psmt = conn.prepareStatement(sql);
		psmt.setInt(1, seq);
		System.out.println("2/3 crewdelete success");

		count = psmt.executeUpdate();  // 실행된 레코드 수 반환
		System.out.println("3/3 crewdelete success");
		
		} catch (SQLException e) {
		e.printStackTrace();
		System.out.println("crewdelete fail");
		
		} finally {
		DBClose.close(conn, psmt, null);
		}
	
		return count>0?true:false;
	}
	
	
public boolean crewMemberdelete(int seq) { // 크루삭제시 크루멤버테이블에서 삭제
		
		String sql = " DELETE FROM CREWMEMBER  "
				   + " WHERE CREWNUM=? ";

		Connection conn = null;			// DB 연결
		PreparedStatement psmt = null;	// Query문을 실행

		int count = 0;
		
		try {
		conn = DBConnection.getConnection();
		System.out.println("1/3 crewMemberdelete success");

		psmt = conn.prepareStatement(sql);
		psmt.setInt(1, seq);
		System.out.println("2/3 crewMemberdelete success");

		count = psmt.executeUpdate();  // 실행된 레코드 수 반환
		System.out.println("3/3 crewMemberdelete success");
		
		} catch (SQLException e) {
		e.printStackTrace();
		System.out.println("crewMemberdelete fail");
		
		} finally {
		DBClose.close(conn, psmt, null);
		}
	
		return count>0?true:false;
	}
	
	public boolean crewmodify(CrewDto dto) {
		
		String sql = " UPDATE CREW SET GNAME=?, PERIOD=?, CREWDATE=?, MAXCOUNT=?, CONTENT=?, "
				   + " FILENAME=?, NEWFILEPATH=?, MEETLOC=?, COURSE=?, LOC=? "
				   + " WHERE SEQ=? ";
		

		Connection conn = null;			// DB 연결
		PreparedStatement psmt = null;	// Query문을 실행
		
		int count = 0;
		
		try {
			System.out.println("1/3 crewmodify success");

			conn = DBConnection.getConnection();

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getGname());
			psmt.setString(2, dto.getPeriod());
			psmt.setString(3, dto.getDate());
			psmt.setInt(4, dto.getMaxcount());
			psmt.setString(5, dto.getContent());
			psmt.setString(6, dto.getFilename());
			psmt.setString(7, dto.getNewfilename());
			psmt.setString(8, dto.getMeetloc());
			psmt.setString(9, dto.getCourse());
			psmt.setString(10, dto.getLoc());
			psmt.setInt(11, dto.getSeq());

			System.out.println("2/3 crewmodify success");

			count = psmt.executeUpdate();  // 실행된 레코드 수 반환
			System.out.println("3/3 crewmodify success");
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("crewmodify fail");
			
		} finally {
			DBClose.close(conn, psmt, null);
		}
		
		return count>0?true:false;
	}
	
		// 글의 총수
		public int getAllCrew(String loc, String period, String choice, String search) {
			
			String sql = " SELECT COUNT(*) FROM CREW ";
			
			String sWord = ""; // 검색분류
			if(choice.equals("crewname")) {
				sWord = " WHERE GNAME LIKE '%" + search + "%' ";
			}else if(choice.equals("content")) {
				sWord = " WHERE CONTENT LIKE '%" + search + "%' ";
			}else if(choice.equals("leader")) {
				sWord = " WHERE LEADERID='" + search + "' ";
			} else if(loc == "" && search == "" && period == "") { 
			    sWord = "";
			} else {
				sWord = " WHERE ";
			}
			System.out.println(sWord);
			System.out.println("choice: " + choice);
			sql = sql + sWord;
			
			String psort = ""; // 기간분류
			if(period.equals("일일모임")) { // 전체기간 따로 쓰기 귀찮...
				psort = " AND PERIOD='" + period + "' ";
			} else if(period.equals("정기모임")) {
				psort = " AND PERIOD='" + period + "' ";
			} // 전체 기간일때는 PERIOD조건이 들어가지 않는다.
			sql = sql + psort;
			
			String location = ""; // 지역분류
			if(choice == "" && loc != "") {
				location = " LOC='" + loc + "' ";
			} else if(loc == "") { 
				location = "";
		    } else {
				location = " AND LOC='" + loc + "' ";
			} 
			System.out.println(loc);

			System.out.println(location);
			sql = sql + location;
			
			
			Connection conn = null;			// DB 연결
			PreparedStatement psmt = null;	// Query문을 실행
			ResultSet rs = null;			// 결과 취득
			
			int len = 0; // length
			
			

			
			try {
				conn = DBConnection.getConnection();
				System.out.println("1/3 getAllCrew success");
				
				psmt = conn.prepareStatement(sql);
				System.out.println("2/3 getAllCrew success");
				
				rs = psmt.executeQuery();
				if(rs.next()) {
					len = rs.getInt(1);
				}
				System.out.println("3/3 getAllCrew success");

			} catch (SQLException e) {
				System.out.println("getAllCrew fail");
				e.printStackTrace();
			}
			
			return len;
			
		}
		
	
	public CrewDto getCrewDetail(String seq) {
		
		String sql = " SELECT SEQ, GNAME, LOC, PERIOD, CREWDATE, "
				   + " CURCOUNT, MAXCOUNT, CONTENT, FILENAME, NEWFILEPATH, LEADERID, LEADERNAME, MEETLOC, COURSE "
				   + " FROM CREW "
				   + " WHERE SEQ=? ";
		
		Connection conn = null;			// DB 연결
		PreparedStatement psmt = null;	// Query문을 실행
		ResultSet rs = null;			// 결과 취득
		
		CrewDto dto = null;

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getCrewDetail success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, seq);
			System.out.println("2/4 getCrewDetail success");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 getCrewDetail success");
			
			if(rs.next()) {
				int n = 1;
				dto = new CrewDto(rs.getInt(n++), 
										rs.getString(n++), 
										rs.getString(n++), 
										rs.getString(n++), 
										rs.getString(n++), 
										rs.getInt(n++), 
										rs.getInt(n++), 
										rs.getString(n++),
										rs.getString(n++),
										rs.getString(n++),
										rs.getString(n++),
										rs.getString(n++),
										rs.getString(n++),
										rs.getString(n++));
				
			}
			System.out.println("4/4 getCrewDetail success");
			
		} catch (SQLException e) {
			System.out.println("getCrewDetail fail");
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return dto;		
	}
	
	
	public List<CrewDto> getCrewPagingList(String loc, String period, String choice, String search, int pageNumber) {
		
		String sql = " SELECT SEQ, GNAME, LOC, PERIOD, CREWDATE, "
			   + " CURCOUNT, MAXCOUNT, CONTENT, FILENAME, NEWFILEPATH, LEADERID, LEADERNAME, MEETLOC, COURSE "
			   + " FROM ";
		
		    // SEQ순 ( 최신순 )으로 번호를 매긴다.
			sql += "(SELECT ROW_NUMBER()OVER(ORDER BY SEQ DESC) AS SEQNUM, "
				+ " SEQ, GNAME, LOC, PERIOD, CREWDATE, "
				+ " CURCOUNT, MAXCOUNT, CONTENT, FILENAME, NEWFILEPATH, LEADERID, LEADERNAME, MEETLOC, COURSE "
				+ "	FROM CREW ";
			
		String sWord = ""; // 검색분류
		if(choice.equals("crewname")) {
			sWord = " WHERE GNAME LIKE '%" + search + "%' ";
		}else if(choice.equals("content")) {
			sWord = " WHERE CONTENT LIKE '%" + search + "%' ";
		}else if(choice.equals("leader")) {
			sWord = " WHERE LEADERID='" + search + "' ";
		} else if(loc == "" && search == "" && period == "") { 
		    sWord = "";
		} else {
			sWord = " WHERE ";
		}
		System.out.println(sWord);
		System.out.println("choice: " + choice);
		sql = sql + sWord;
		
		String psort = ""; // 기간분류
		if(period.equals("일일모임")) {
			psort = " AND PERIOD='" + period + "' ";
		} else if(period.equals("정기모임")) {
			psort = " AND PERIOD='" + period + "' ";
		} // 전체 기간일때는 PERIOD조건이 들어가지 않는다.
		sql = sql + psort;
		
		String location = ""; // 지역분류
		if(choice == "" && loc != "") {
			location = " LOC='" + loc + "' ";
		} else if(loc == "") { 
			location = "";
	    } else {
			location = " AND LOC='" + loc + "' ";
		} 
		System.out.println(loc);

		System.out.println(location);
		sql = sql + location;
		
		sql = sql + " ORDER BY SEQ DESC) ";
		
		sql = sql + " WHERE SEQNUM >= ? AND SEQNUM <= ? ";

		

		
		int start, end;
		start = 1 + 9 * pageNumber;	// 0 -> 1 ~ 10	1 -> 11 ~ 20
		end = 9 + 9 * pageNumber;		
		
		Connection conn = null;			// DB 연결
		PreparedStatement psmt = null;	// Query문을 실행
		ResultSet rs = null;			// 결과 취득
		
		List<CrewDto> list = new ArrayList<CrewDto>();

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getCrewList success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);
			System.out.println("2/4 getCrewList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 getCrewList success");
			
			while(rs.next()) {
				int n = 1;
				CrewDto dto = new CrewDto(rs.getInt(n++), 
						rs.getString(n++), 
						rs.getString(n++), 
						rs.getString(n++), 
						rs.getString(n++), 
						rs.getInt(n++), 
						rs.getInt(n++), 
						rs.getString(n++),
						rs.getString(n++),
						rs.getString(n++),
						rs.getString(n++),
						rs.getString(n++),
						rs.getString(n++),
						rs.getString(n++));
				list.add(dto);
			}
			System.out.println("4/4 getCrewList success");
			
		} catch (SQLException e) {
			System.out.println("getCrewList fail");
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return list;		
	}
	

	
	public List<CrewDto> getCrewList() {
		
		String sql = " SELECT SEQ, GNAME, LOC, PERIOD, CREWDATE, "
				   + " CURCOUNT, MAXCOUNT, CONTENT, FILENAME, NEWFILEPATH, LEADERID, LEADERNAME, MEETLOC, COURSE "
				   + " FROM CREW "
				   + " ORDER BY SEQ DESC ";
		
		Connection conn = null;			// DB 연결
		PreparedStatement psmt = null;	// Query문을 실행
		ResultSet rs = null;			// 결과 취득
		
		List<CrewDto> list = new ArrayList<CrewDto>();

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getCrewList success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/4 getCrewList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 getCrewList success");
			
			while(rs.next()) {
				int n = 1;
				CrewDto dto = new CrewDto(rs.getInt(n++), 
										rs.getString(n++), 
										rs.getString(n++), 
										rs.getString(n++), 
										rs.getString(n++), 
										rs.getInt(n++), 
										rs.getInt(n++), 
										rs.getString(n++),
										rs.getString(n++),
										rs.getString(n++),
										rs.getString(n++),
										rs.getString(n++),
										rs.getString(n++),
										rs.getString(n++));
				list.add(dto);
			}
			System.out.println("4/4 getCrewList success");
			
		} catch (SQLException e) {
			System.out.println("getCrewList fail");
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return list;		
	}
	
	
	
	
	
	public int getCrewNum(String leaderId, String crewname) {
		
		String sql = " SELECT SEQ "
				   + " FROM CREW "
				   + " WHERE LEADERID=? AND GNAME=? ";
		
		Connection conn = null;			// DB 연결
		PreparedStatement psmt = null;	// Query문을 실행
		ResultSet rs = null;			// 결과 취득
		
		int seq = 0;

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getCrewNum success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, leaderId);
			psmt.setString(2, crewname);

			System.out.println("2/4 getCrewNum success");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 getCrewNum success");
			
			if(rs.next()) {
				seq = rs.getInt(1);
										
			}
			System.out.println("4/4 getCrewNum success");
			
		} catch (SQLException e) {
			System.out.println("getCrewNum fail");
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return seq;		
	}
	
	public boolean createCrew(CrewDto cto) {
		   
		   String sql = " INSERT INTO CREW(SEQ, GNAME, LOC, PERIOD, CREWDATE, CURCOUNT, MAXCOUNT, CONTENT, FILENAME, NEWFILEPATH, LEADERID, LEADERNAME, MEETLOC, COURSE) "
		   		      + " VALUES(SEQ_CREW.NEXTVAL, ?, ?, ?, ?, 0, ?, ?, ?, ?, ?, ?, ?, ?) ";
		   
		   	  Connection conn = null;
		      PreparedStatement psmt = null;
		      
		      int count = 0;
		      
		      try {
		          conn = DBConnection.getConnection();
		          System.out.println("1/3 createCrew Success!!");
		          
		          psmt = conn.prepareStatement(sql);
		          psmt.setString(1, cto.getGname());
		          psmt.setString(2, cto.getLoc());
		          psmt.setString(3, cto.getPeriod());
		          psmt.setString(4, cto.getDate());
		          psmt.setInt(5, cto.getMaxcount());
		          psmt.setString(6, cto.getContent());		          
		          psmt.setString(7, cto.getFilename());
		          psmt.setString(8, cto.getNewfilename());
		          psmt.setString(9, cto.getLeaderId());
		          psmt.setString(10, cto.getLeaderName());
		          psmt.setString(11, cto.getMeetloc());
		          psmt.setString(12, cto.getCourse());


		          
		          System.out.println("2/3 createCrew Success!!");
		          
		          count = psmt.executeUpdate();
		          System.out.println("3/3 createCrew Success!!");
		          
		       } catch (SQLException e) {
		          System.out.println("createCrew Fail..");
		          e.printStackTrace();
		       } finally {
		          DBClose.close(conn, psmt, null);
		       }
				return count>0?true:false;   
	   } 
public List<Integer> myCrewSeq(String id) {
		
		String sql = " SELECT CREWNUM "
				   + " FROM CREWMEMBER "
				   + " WHERE MEMBER_ID=? ";
		
		Connection conn = null;			// DB 연결
		PreparedStatement psmt = null;	// Query문을 실행
		ResultSet rs = null;			// 결과 취득
		
		List<Integer> list = new ArrayList<>();

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 myCrewSeq success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			System.out.println("2/4 myCrewSeq success");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 myCrewSeq success");
			
			while(rs.next()) {
				int n = rs.getInt(1) ;
				list.add(n);
			}
			System.out.println("4/4 myCrewSeq success");
			
		} catch (SQLException e) {
			System.out.println("myCrewSeq fail");
			 e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return list;		
	}
	
	
	public List<CrewDto> myCrewList(int seq) {
		
		String sql = " SELECT SEQ, GNAME, LOC, PERIOD, CREWDATE, "
				   + " CURCOUNT, MAXCOUNT, CONTENT, FILENAME, NEWFILEPATH, LEADERID, LEADERNAME, MEETLOC, COURSE "
				   + " FROM CREW "
				   + " WHERE SEQ=? ";
		
		Connection conn = null;			// DB 연결
		PreparedStatement psmt = null;	// Query문을 실행
		ResultSet rs = null;			// 결과 취득
		
		List<CrewDto> list = new ArrayList<CrewDto>();

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 myCrewList success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/4 myCrewList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 myCrewList success");
			
			while(rs.next()) {
				int n = 1;
				CrewDto dto = new CrewDto(rs.getInt(n++), 
										rs.getString(n++), 
										rs.getString(n++), 
										rs.getString(n++), 
										rs.getString(n++), 
										rs.getInt(n++), 
										rs.getInt(n++), 
										rs.getString(n++),
										rs.getString(n++),
										rs.getString(n++),
										rs.getString(n++),
										rs.getString(n++),
										rs.getString(n++),
										rs.getString(n++));
				list.add(dto);
			}
			System.out.println("4/4 myCrewList success");
			
		} catch (SQLException e) {
			System.out.println("myCrewList fail");
			 e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return list;		
	}
	
	public CrewDto myCrewList2(int seq) {
		
		String sql = " SELECT SEQ, GNAME, LOC, PERIOD, CREWDATE, "
				   + " CURCOUNT, MAXCOUNT, CONTENT, FILENAME, NEWFILEPATH, LEADERID, LEADERNAME, MEETLOC, COURSE "
				   + " FROM CREW "
				   + " WHERE SEQ=? ";
		
		Connection conn = null;			// DB 연결
		PreparedStatement psmt = null;	// Query문을 실행
		ResultSet rs = null;			// 결과 취득
		CrewDto dto = null;
		

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 myCrewList2 success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/4 myCrewList2 success");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 myCrewList2 success");
			
			
			while(rs.next()) {
				int n = 1;
				dto = new CrewDto(rs.getInt(n++), 
										rs.getString(n++), 
										rs.getString(n++), 
										rs.getString(n++), 
										rs.getString(n++), 
										rs.getInt(n++), 
										rs.getInt(n++), 
										rs.getString(n++),
										rs.getString(n++),
										rs.getString(n++),
										rs.getString(n++),
										rs.getString(n++),
										rs.getString(n++),
										rs.getString(n++));
				
			}
			System.out.println("4/4 myCrewList2 success");
			
		} catch (SQLException e) {
			System.out.println("myCrewList2 fail");
			 e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return dto;		
	}

}
