package comment;

public class CommentDto {
	
	private int seq;
	private int bbsid;
	private int comstep;
	private String id;
	private String name;
	private String regdate;
	private String content;
	private int likecount;
	private int dislikecount;
	
	public CommentDto() {}
	
	public CommentDto(int seq, int bbsid, int comstep, String id, String name, String regdate, String content,
			int likecount, int dislikecount) {
		super();
		this.seq = seq;
		this.bbsid = bbsid;
		this.comstep = comstep;
		this.id = id;
		this.name = name;
		this.regdate = regdate;
		this.content = content;
		this.likecount = likecount;
		this.dislikecount = dislikecount;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getBbsid() {
		return bbsid;
	}
	public void setBbsid(int bbsid) {
		this.bbsid = bbsid;
	}
	public int getComstep() {
		return comstep;
	}
	public void setComstep(int comstep) {
		this.comstep = comstep;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getLikecount() {
		return likecount;
	}
	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}
	public int getDislikecount() {
		return dislikecount;
	}
	public void setDislikecount(int dislikecount) {
		this.dislikecount = dislikecount;
	}
	@Override
	public String toString() {
		return "CommentDto [seq=" + seq + ", bbsid=" + bbsid + ", comstep=" + comstep + ", id=" + id + ", name=" + name
				+ ", regdate=" + regdate + ", content=" + content + ", likecount=" + likecount + ", dislikecount="
				+ dislikecount + "]";
	}
	
	
}
