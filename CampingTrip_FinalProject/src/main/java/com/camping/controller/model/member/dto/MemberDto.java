package com.camping.controller.model.member.dto;

public class MemberDto {
	private int myno;
	private String myid;
	private String mypw;
	private String myname;
	private String myaddr;
	private String myphone;
	private String myemail;
	private String mybirth;
	private String mysex;
	private String myenabled;
	private String myrole;
	private int mypenalty;	
	
	
	public MemberDto() {
		super();
	}
		
	public MemberDto(int myno, String myid, String mypw, String myname, String myaddr, String myphone, String myemail,
			String mybirth, String mysex, String myenabled, String myrole, int mypenalty) {
		super();
		this.myno = myno;
		this.myid = myid;
		this.mypw = mypw;
		this.myname = myname;
		this.myaddr = myaddr;
		this.myphone = myphone;
		this.myemail = myemail;
		this.mybirth = mybirth;
		this.mysex = mysex;
		this.myenabled = myenabled;
		this.myrole = myrole;
		this.mypenalty = mypenalty;
	}

	public int getMyno() {
		return myno;
	}
	public void setMyno(int myno) {
		this.myno = myno;
	}
	public String getMyid() {
		return myid;
	}
	public void setMyid(String myid) {
		this.myid = myid;
	}
	public String getMypw() {
		return mypw;
	}
	public void setMypw(String mypw) {
		this.mypw = mypw;
	}
	public String getMyname() {
		return myname;
	}
	public void setMyname(String myname) {
		this.myname = myname;
	}
	public String getMyaddr() {
		return myaddr;
	}
	public void setMyaddr(String myaddr) {
		this.myaddr = myaddr;
	}
	public String getMyphone() {
		return myphone;
	}
	public void setMyphone(String myphone) {
		this.myphone = myphone;
	}
	public String getMyemail() {
		return myemail;
	}
	public void setMyemail(String myemail) {
		this.myemail = myemail;
	}
	public String getMybirth() {
		return mybirth;
	}
	public void setMybirth(String mybirth) {
		this.mybirth = mybirth;
	}
	public String getMysex() {
		return mysex;
	}
	public void setMysex(String mysex) {
		this.mysex = mysex;
	}
	public String getMyenabled() {
		return myenabled;
	}
	public void setMyenabled(String myenabled) {
		this.myenabled = myenabled;
	}
	public String getMyrole() {
		return myrole;
	}
	public void setMyrole(String myrole) {
		this.myrole = myrole;
	}
	public int getMypenalty() {
		return mypenalty;
	}
	public void setMypenalty(int mypenalty) {
		this.mypenalty = mypenalty;
	}

	
}
