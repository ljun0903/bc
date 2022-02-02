package dto;

import java.io.Serializable;

public class CrewDto implements Serializable {
	
	private int seq;
	private String gname;
	private String loc;
	private String period;
	private String date;
	private int curcount;
	private int maxcount;
	private String content;
	private String filename;
	private String newfilename;
	private String leaderId;
	private String leaderName;
	private String meetloc;
	private String course;
	
	public CrewDto() {
		
	}

	public CrewDto(int seq, String gname, String loc, String period, String date, int curcount, int maxcount,
			String content, String filename, String newfilename, String leaderId, String leaderName, String meetloc,
			String course) {
		super();
		this.seq = seq;
		this.gname = gname;
		this.loc = loc;
		this.period = period;
		this.date = date;
		this.curcount = curcount;
		this.maxcount = maxcount;
		this.content = content;
		this.filename = filename;
		this.newfilename = newfilename;
		this.leaderId = leaderId;
		this.leaderName = leaderName;
		this.meetloc = meetloc;
		this.course = course;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getCurcount() {
		return curcount;
	}

	public void setCurcount(int curcount) {
		this.curcount = curcount;
	}

	public int getMaxcount() {
		return maxcount;
	}

	public void setMaxcount(int maxcount) {
		this.maxcount = maxcount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getNewfilename() {
		return newfilename;
	}

	public void setNewfilename(String newfilename) {
		this.newfilename = newfilename;
	}

	public String getLeaderId() {
		return leaderId;
	}

	public void setLeaderId(String leaderId) {
		this.leaderId = leaderId;
	}

	public String getLeaderName() {
		return leaderName;
	}

	public void setLeaderName(String leaderName) {
		this.leaderName = leaderName;
	}

	public String getMeetloc() {
		return meetloc;
	}

	public void setMeetloc(String meetloc) {
		this.meetloc = meetloc;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	@Override
	public String toString() {
		return "CrewDto [seq=" + seq + ", gname=" + gname + ", loc=" + loc + ", period=" + period + ", date=" + date
				+ ", curcount=" + curcount + ", maxcount=" + maxcount + ", content=" + content + ", filename="
				+ filename + ", newfilename=" + newfilename + ", leaderId=" + leaderId + ", leaderName=" + leaderName
				+ ", meetloc=" + meetloc + ", course=" + course + "]";
	}

	

	

}

	