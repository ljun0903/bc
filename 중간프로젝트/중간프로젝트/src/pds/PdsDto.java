package pds;

import java.io.Serializable;



public class PdsDto implements Serializable{

	private int seq;
	private String id;
	private String name;
	private String title;
	private String content;
	private String filename;		
	private String newFilename;	
	private int readcount;
	private int pdsnum;
	private String regdate;	
	
	public PdsDto() {
	}

	public PdsDto(int seq, String id, String name, String title, String content, String filename, String newFilename, int readcount,
			 String regdate) {
		super();
		this.seq = seq;
		this.id = id;
		this.name = name;
		this.title = title;
		this.content = content;
		this.filename = filename;
		this.newFilename = newFilename;
		this.readcount = readcount;
		this.regdate = regdate;
	}

	public PdsDto(String id, String title, String content, String filename, String newFilename) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.filename = filename;
		this.newFilename = newFilename;
	}
	public PdsDto(String id, String name, String title, String content, String filename, String newFilename, int pdsnum) {
		super();
		this.id = id;
		this.name = name;
		this.title = title;
		this.content = content;
		this.filename = filename;
		this.newFilename = newFilename;
		this.pdsnum = pdsnum;
	}
	public PdsDto(int seq, String id, String name, String title, String content, String filename, String newFilename,
			int readcount, int pdsnum, String regdate) {
		super();
		this.seq = seq;
		this.id = id;
		this.name = name;
		this.title = title;
		this.content = content;
		this.filename = filename;
		this.newFilename = newFilename;
		this.readcount = readcount;
		this.pdsnum = pdsnum;
		this.regdate = regdate;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
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

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getNewFilename() {
		return newFilename;
	}

	public void setNewFilename(String newFilename) {
		this.newFilename = newFilename;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	public int getPdsnum() {
		return pdsnum;
	}

	public void setPdsnum(int pdsnum) {
		this.pdsnum = pdsnum;
	}

	@Override
	public String toString() {
		return "PdsDto [seq=" + seq + ", id=" + id + ", name=" + name + ", title=" + title + ", content=" + content
				+ ", filename=" + filename + ", newFilename=" + newFilename + ", readcount=" + readcount + ", pdsnum="
				+ pdsnum + ", regdate=" + regdate + "]";
	}

	

	
	
}



