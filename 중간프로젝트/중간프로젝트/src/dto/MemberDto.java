package dto;

import java.io.Serializable;

// DTO -> Data Transfer Object
// VO -> Value Object
public class MemberDto implements Serializable{	
							   //    직렬화
	private int seq;
	private String id;
	private String name;
	private String pwd;
	private String email;
	private int auth;	// 3:일반회원  1:관리자
	private String loc;
	
	public MemberDto() {}
	
	
	public MemberDto(int seq, String id, String name, String pwd, String email, int auth, String loc) {
	      super();
	      this.seq = seq;
	      this.id = id;
	      this.name = name;
	      this.pwd = pwd;
	      this.email = email;
	      this.auth = auth;
	      this.loc = loc;
	   }

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getAuth() {
		return auth;
	}
	public void setAuth(int auth) {
		this.auth = auth;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}

	@Override
	public String toString() {
		return "MemberDto [seq=" + seq + ", id=" + id + ", name=" + name + ", pwd=" + pwd + ", email=" + email
				+ ", auth=" + auth + ", loc=" + loc + "]";
	}
	
	
	
	
	
}
