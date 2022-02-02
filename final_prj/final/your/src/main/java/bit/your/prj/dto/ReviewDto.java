package bit.your.prj.dto;

public class ReviewDto {

	private int seq;
	private String nickname;
	private String ordernum;
	private int itemnum;
	private String title;
	private String content;
	private String rdate;
	
	public ReviewDto() {}

	public ReviewDto(int seq, String nickname, String ordernum, int itemnum, String title, String content,
			String rdate) {
		super();
		this.seq = seq;
		this.nickname = nickname;
		this.ordernum = ordernum;
		this.itemnum = itemnum;
		this.title = title;
		this.content = content;
		this.rdate = rdate;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(String ordernum) {
		this.ordernum = ordernum;
	}

	public int getItemnum() {
		return itemnum;
	}

	public void setItemnum(int itemnum) {
		this.itemnum = itemnum;
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

	@Override
	public String toString() {
		return "ReviewDto [seq=" + seq + ", nickname=" + nickname + ", ordernum=" + ordernum + ", itemnum=" + itemnum
				+ ", title=" + title + ", content=" + content + ", rdate=" + rdate + "]";
	}
	
	
	
	
	
	

}
