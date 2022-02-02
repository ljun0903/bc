package dto;

public class ChatDto {

	int seq;
	int crewseq;
	String name;
	String date;
	String content;
	
	public ChatDto() {

	}
	
	public ChatDto(int seq, int crewseq, String name, String date, String content) {
		super();
		this.seq = seq;
		this.crewseq = crewseq;
		this.name = name;
		this.date = date;
		this.content = content;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getCrewseq() {
		return crewseq;
	}

	public void setCrewseq(int crewseq) {
		this.crewseq = crewseq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "ChatDto [seq=" + seq + ", crewseq=" + crewseq + ", name=" + name + ", date=" + date + ", content="
				+ content + "]";
	}
	
	
}
