package dto;

import java.io.Serializable;

public class CalendarDto implements Serializable{

	private int seq;
	private int crewid;
	private String id;
	private String name;
	private String title;
	private String content;
	private String rdate;
	private String wdate;
	private String labelcol;
	
	public CalendarDto(int seq, int crewid, String id, String name, String title, String content, 
						String rdate, String wdate, String labelcol) 
	{
		super();
		this.name = name;
		this.seq = seq;
		this.crewid = crewid;
		this.id = id;
		this.title = title;
		this.content = content;
		this.rdate = rdate;
		this.wdate = wdate;
		this.labelcol = labelcol;
	}
	public CalendarDto(int seq, String id, String name, String title, String content, 
			String rdate, String wdate, String labelcol) 
		{
		super();
		this.seq = seq;
		this.id = id;
		this.name = name;
		this.title = title;
		this.content = content;
		this.rdate = rdate;
		this.wdate = wdate;
		this.labelcol = labelcol;
		}
	
	public CalendarDto(String id, String name, String title, String content, String rdate) {
		super();
		this.id = id;
		this.name = name;
		this.title = title;
		this.content = content;
		this.rdate = rdate;
	}
	public CalendarDto(String id, String name, String title, String content, String rdate, String labelcol) {
		super();
		this.id = id;
		this.name = name;
		this.title = title;
		this.content = content;
		this.rdate = rdate;
		this.labelcol = labelcol;
	}
	

	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public int getCrewid() {
		return crewid;
	}


	public void setCrewid(int crewid) {
		this.crewid = crewid;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getRdate() {
		return rdate;
	}


	public void setRdate(String rdate) {
		this.rdate = rdate;
	}


	public String getWdate() {
		return wdate;
	}


	public void setWdate(String wdate) {
		this.wdate = wdate;
	}


	public String getLabelcol() {
		return labelcol;
	}


	public void setLabelcol(String labelcol) {
		this.labelcol = labelcol;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "CalendarDto [seq=" + seq + ", crewid=" + crewid + ", id=" + id + ", name=" + name + ", title=" + title
				+ ", content=" + content + ", rdate=" + rdate + ", wdate=" + wdate + ", labelcol=" + labelcol + "]";
	}

	
	
	
	
}
