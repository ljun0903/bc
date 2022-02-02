package dto;

public class CrewBbsDto {
	
	private int seq;
	private String id;
	private String name;
	private String title;
	private String content;
	private String filename;
	private String newfilename;
	private int readcount;
	private int likecount;
	private int comcount;
	private String regdate;
	private int bbsid;
	
	public CrewBbsDto() {}


	public CrewBbsDto(int seq, String id, String name, String title, String content, 
			String filename, String newfilename,int readcount, int likecount, int comcount, String regdate, int bbsid) {
		super();
		this.seq = seq;
		this.id = id;
		this.name = name;
		this.title = title;
		this.content = content;
		this.filename = filename;
		this.newfilename = newfilename;
		this.readcount = readcount;
		this.likecount = likecount;
		this.comcount = comcount;
		this.regdate = regdate;
		this.bbsid = bbsid;
	}

	public CrewBbsDto(String id, String name, String title, String content, 
					String filename, String newfilename, int bbsid) {
		super();
		this.id = id;
		this.name = name;
		this.title = title;
		this.content = content;
		this.filename = filename;
		this.newfilename = newfilename;
		this.bbsid = bbsid;
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

	public String getNewfilename() {
		return newfilename;
	}

	public void setNewfilename(String newfilename) {
		this.newfilename = newfilename;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getLikecount() {
		return likecount;
	}

	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}

	public int getComcount() {
		return comcount;
	}

	public void setComcount(int comcount) {
		this.comcount = comcount;
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
	
	public int getBbsid() {
		return bbsid;
	}

	public void setBbsid(int bbsid) {
		this.bbsid = bbsid;
	}

	@Override
	public String toString() {
		return "CrewBbsDto [seq=" + seq + ", id=" + id + ", name=" + name + ", title=" + title + ", content=" + content
				+ ", filename=" + filename + ", newfilename=" + newfilename + ", readcount=" + readcount
				+ ", likecount=" + likecount + ", comcount=" + comcount + ", regdate=" + regdate + "]";
	}


}
