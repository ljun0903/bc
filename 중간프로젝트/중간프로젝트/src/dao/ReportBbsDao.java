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
import dto.ReportBbsDto;

public class ReportBbsDao {
	
	private static ReportBbsDao dao = null;
	
	private ReportBbsDao() {
	}
	
	public static ReportBbsDao getInstance() {
		if(dao == null) {
			dao = new ReportBbsDao();
		}		
		return dao;
	}
	
	public boolean writereport(ReportBbsDto dto) {
		
		String sql = " INSERT INTO REPORT( SEQ, TITLE, ID, BBSNUM, PDSNUM, REPORTER, REASON, REPORTCONTENT ) "
				   + " VALUES( SEQ_REPORT.NEXTVAL, ?, ?, ?, ?, ?, ?, ? ) ";
		
		Connection conn = null;			
		PreparedStatement psmt = null;	
		
		int count = 0;
		
		try { 
			conn = DBConnection.getConnection();			
			System.out.println("1/3 ReportBbs success");
			/////
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getId());
			psmt.setInt(3, dto.getBbsnum());
			psmt.setInt(4, dto.getPdsnum());
			psmt.setString(5, dto.getReporter());
			psmt.setString(6, dto.getReason());
			psmt.setString(7, dto.getReportcontent());
			System.out.println("2/3 ReportBbs success");
			
			count = psmt.executeUpdate();
			System.out.println("3/3 ReportBbs success");
			
		} catch(SQLException e) {
			System.out.println("ReportBbs fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		return count>0?true:false;
	}
	
	/*
	 * public List<ReportBbsDto> getReportList() {
	 * 
	 * 
	 * String sql =
	 * " SELECT BBSNUM, TITLE, ID, REASON, REPORTCONTENT, REPORTER, DEL " +
	 * " FROM REPORT ";
	 * 
	 * Connection conn = null; // DB 연결 PreparedStatement psmt = null; // Query문을 실행
	 * ResultSet rs = null; // 결과 취득
	 * 
	 * ArrayList<ReportBbsDto> list = new ArrayList<ReportBbsDto>();
	 * 
	 * try { conn = DBConnection.getConnection();
	 * System.out.println("1/4 getReportBbsList success");
	 * 
	 * psmt = conn.prepareStatement(sql);
	 * System.out.println("2/4 getReportBbsList success");
	 * 
	 * rs = psmt.executeQuery(); System.out.println("3/4 getReportBbsList success");
	 * 
	 * while(rs.next()) { ReportBbsDto dto = new ReportBbsDto(rs.getInt(1),
	 * rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
	 * rs.getString(6), rs.getInt(7)); list.add(dto); }
	 * System.out.println("4/4 getReportBbsList success");
	 * 
	 * } catch (SQLException e) { System.out.println("getReportBbsList fail"); }
	 * finally { DBClose.close(conn, psmt, rs); }
	 * 
	 * return list; }
	 */

		public ReportBbsDto getreport(int seq) {
			
			String sql = " SELECT SEQ, TITLE, ID, BBSNUM, PDSNUM, "
					+ "			REPORTER, REASON, REPORTCONTENT "
					+ "	   FROM REPORT "
					+ "    WHERE SEQ=? ";
			
			Connection conn = null;			
			PreparedStatement psmt = null;	
			ResultSet rs = null;	
			
			ReportBbsDto dto = null;		
			
			try {
				conn = DBConnection.getConnection();
				System.out.println("1/3 getreport success");
				
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, seq);
				System.out.println("2/3 getreport success");
				
				rs = psmt.executeQuery();	
				if(rs.next()) {
					int n = 1;
					dto = new ReportBbsDto(	rs.getInt(n++), 
										rs.getString(n++), 
										rs.getString(n++), 
										rs.getInt(n++), 
										rs.getInt(n++), 
										rs.getString(n++), 
										rs.getString(n++),
										rs.getString(n++));
				}	
				System.out.println("3/3 getreport success");
				
			} catch (SQLException e) {
				System.out.println("getreport fail");
				e.printStackTrace();
			} finally {
				DBClose.close(conn, psmt, rs);
			}
			
			return dto;
		}
		public boolean deleteReport(int seq) {
					
					String sql = " DELETE FROM PDS"
							+ " WHERE SEQ=? ";
					
					Connection conn = null;
					PreparedStatement psmt = null;
					
					int count = 0;
					
					try {
						conn = DBConnection.getConnection();
						System.out.println("1/3  deleteReport");	
						
						psmt = conn.prepareStatement(sql);
						psmt.setInt(1, seq);
						System.out.println("2/3  deleteReport");	
						
						count = psmt.executeUpdate();
						System.out.println("3/3  deleteReport");				
						
					} catch (Exception e) {			
						e.printStackTrace();
					} finally{
						DBClose.close(conn, psmt, null);	
					}
					
					return count>0?true:false;
				}
		
		public List<ReportBbsDto> getReportBbsPagingList(String choice, String search, int pageNumber) {
			
			String sql = " SELECT SEQ, TITLE, ID, BBSNUM, PDSNUM, "
					   + " 						  REPORTER, REASON, REPORTCONTENT "
					   + " FROM ";

			sql += "(SELECT ROW_NUMBER()OVER(ORDER BY SEQ DESC) AS RNUM, " 
			  + "		 SEQ, TITLE, ID, BBSNUM, PDSNUM, REPORTER, REASON, REPORTCONTENT "
			  + "	FROM REPORT ";
			 
			String sWord = "";
			if(choice.equals("title")) {
				sWord = " WHERE TITLE LIKE '%" + search + "%' ";
			}else if(choice.equals("reportcontent")) {
				sWord = " WHERE REPORTCONTENT LIKE '%" + search + "%' ";
			}else if(choice.equals("id")) {
				sWord = " WHERE ID='" + search + "' ";
			}		
			sql = sql + sWord;		
			
			sql = sql + " ORDER BY SEQ DESC) ";
			
			sql = sql + " WHERE RNUM >= ? AND RNUM <= ? ";
			
			int start, end;
			start = 1 + 10 * pageNumber;	// 0 -> 1 ~ 10	1 -> 11 ~ 20
			end = 10 + 10 * pageNumber;		
			
			Connection conn = null;			// DB 연결
			PreparedStatement psmt = null;	// Query문을 실행
			ResultSet rs = null;			// 결과 취득
			
			List<ReportBbsDto> list = new ArrayList<ReportBbsDto>();

			try {
				conn = DBConnection.getConnection();
				System.out.println("1/4 getreportList success");
				
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, start);
				psmt.setInt(2, end);
				System.out.println("2/4 getreportList success");
				
				rs = psmt.executeQuery();
				System.out.println("3/4 getreportList success");
				
				while(rs.next()) {
					ReportBbsDto dto = new ReportBbsDto(rs.getInt(1), 
														rs.getString(2), 
														rs.getString(3), 
														rs.getInt(4), 
														rs.getInt(5), 
														rs.getString(6), 
														rs.getString(7), 
														rs.getString(8));
					list.add(dto);
				}
				System.out.println("4/4 getreportList success");
				
			} catch (SQLException e) {
				System.out.println("getreportList fail");
				e.printStackTrace();			//////////////////
			} finally {
				DBClose.close(conn, psmt, rs);
			}
			
			return list;		
		}
		
		public int getAllreport(String choice, String search) {
			
			String sql = " SELECT COUNT(*) FROM REPORT ";
			
			String sWord = "";
			if(choice.equals("title")) {
				sWord = " WHERE TITLE LIKE '%" + search + "%' ";
			}else if(choice.equals("reportcontent")) {
				sWord = " WHERE CONTENT LIKE '%" + search + "%' ";
			}else if(choice.equals("id")) {
				sWord = " WHERE ID='" + search + "' ";
			}		
			sql = sql + sWord;
			
			Connection conn = null;			// DB 연결
			PreparedStatement psmt = null;	// Query문을 실행
			ResultSet rs = null;			// 결과 취득
			
			int len = 0;
			
			try {
				conn = DBConnection.getConnection();
				System.out.println("1/3 getAllreport success");
				
				psmt = conn.prepareStatement(sql);
				System.out.println("2/3 getAllreport success");
				
				rs = psmt.executeQuery();
				if(rs.next()) {
					len = rs.getInt(1);
				}
				System.out.println("3/3 getAllreport success");
				
			} catch (SQLException e) {
				System.out.println("getAllreport fail");
				e.printStackTrace();
			} finally {
				DBClose.close(conn, psmt, rs);
			}
			
			return len;
		}
		

	public boolean deletereport(int seq) {
			
			String sql = " DELETE FROM REPORT"
					+ " WHERE SEQ=? ";
			
			Connection conn = null;
			PreparedStatement psmt = null;
			
			int count = 0;
			
			try {
				conn = DBConnection.getConnection();
				System.out.println("1/3 S deletere");	
				
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, seq);
				System.out.println("2/3 S deletere");	
				
				count = psmt.executeUpdate();
				System.out.println("3/3 S deletere");				
				
			} catch (Exception e) {			
				e.printStackTrace();
			} finally{
				DBClose.close(conn, psmt, null);	
			}
			
			return count>0?true:false;
		}
	
	public ReportBbsDto getre(int seq) {
		String sql = " SELECT SEQ, TITLE, ID, BBSNUM, PDSNUM, "
				+ "			REPORTER, REASON, REPORTCONTENT "
				+ "	   FROM REPORT "
				+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		ReportBbsDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getre success");	
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/4 getre success");	
			
			rs = psmt.executeQuery();
			System.out.println("3/4 getre success");	
			
			if(rs.next()){
				dto = new ReportBbsDto();
				dto.setSeq(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setId(rs.getString(3));
				dto.setBbsnum(rs.getInt(4));
				dto.setPdsnum(rs.getInt(5));
				dto.setReporter(rs.getString(6));
				dto.setReason(rs.getString(7));
				dto.setReportcontent(rs.getString(8));
			}	
			System.out.println("4/4 getre success");			
						
		} catch (Exception e) {			
			e.printStackTrace();
		} finally{
			DBClose.close(conn, psmt, rs);					
		}		
		
		return dto;
	}
}
