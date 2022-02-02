package dto;

public class CrewMemberDto {
	
	private int seq;
	private int crewnum;
	private String memberid;
	private String membername;
	
	public CrewMemberDto(int seq, int crewnum, String memberid, String membername) {
		super();
		this.seq = seq;
		this.crewnum = crewnum;
		this.memberid = memberid;
		this.membername = membername;
	}
	

	public CrewMemberDto(int crewnum, String memberid, String membername) {
		super();
		this.crewnum = crewnum;
		this.memberid = memberid;
		this.membername = membername;
	}


	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getCrewnum() {
		return crewnum;
	}

	public void setCrewnum(int crewnum) {
		this.crewnum = crewnum;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getMembername() {
		return membername;
	}

	public void setMembername(String membername) {
		this.membername = membername;
	}

	@Override
	public String toString() {
		return "CrewMemberDto [seq=" + seq + ", crewnum=" + crewnum + ", memberid=" + memberid + ", membername="
				+ membername + "]";
	}
	
	
	
}
