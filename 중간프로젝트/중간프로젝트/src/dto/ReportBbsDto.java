package dto;

public class ReportBbsDto {
	private int seq;		//seq
	private String title;	//신고글
	private String id;		//신고당한 아이디
	private int bbsnum;
	private int pdsnum;
	private String reporter;  //신고한 아이디
	private String reason;	//신고이유
	private String reportcontent;  //내용

	
	public ReportBbsDto() {
	}


	public ReportBbsDto(String title, String id, int bbsnum, int pdsnum, String reporter, String reason,
			String reportcontent) {
		super();
		this.title = title;
		this.id = id;
		this.bbsnum = bbsnum;
		this.pdsnum = pdsnum;
		this.reporter = reporter;
		this.reason = reason;
		this.reportcontent = reportcontent;
	}


	public ReportBbsDto(int seq, String title, String id, int bbsnum, int pdsnum, String reporter, String reason,
			String reportcontent) {
		super();
		this.seq = seq;
		this.title = title;
		this.id = id;
		this.bbsnum = bbsnum;
		this.pdsnum = pdsnum;
		this.reporter = reporter;
		this.reason = reason;
		this.reportcontent = reportcontent;
	}


	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public int getBbsnum() {
		return bbsnum;
	}


	public void setBbsnum(int bbsnum) {
		this.bbsnum = bbsnum;
	}


	public int getPdsnum() {
		return pdsnum;
	}


	public void setPdsnum(int pdsnum) {
		this.pdsnum = pdsnum;
	}


	public String getReporter() {
		return reporter;
	}


	public void setReporter(String reporter) {
		this.reporter = reporter;
	}


	public String getReason() {
		return reason;
	}


	public void setReason(String reason) {
		this.reason = reason;
	}


	public String getReportcontent() {
		return reportcontent;
	}


	public void setReportcontent(String reportcontent) {
		this.reportcontent = reportcontent;
	}


	@Override
	public String toString() {
		return "ReportBbsDto [seq=" + seq + ", title=" + title + ", id=" + id + ", bbsnum=" + bbsnum + ", pdsnum="
				+ pdsnum + ", reporter=" + reporter + ", reason=" + reason + ", reportcontent=" + reportcontent + "]";
	}

	
	
}
