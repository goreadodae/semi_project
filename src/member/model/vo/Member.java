package member.model.vo;

import java.sql.Date;

public class Member {
	private int memberNo;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String birthDate;
	private String phone;
	private String address;
	private String gender;
	private String email;
	private String enrollDate;
	private String profile;
	private String nickname;
	
	public Member () {}
	
	
	
	public int getMemberNo() {
		return memberNo;
	}
	

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}



	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}



	public String getProfile() {
		return profile;
	}



	public void setProfile(String profile) {
		this.profile = profile;
	}



	public String getNickname() {
		return nickname;
	}



	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	

	
	
	
	/*member_no      NUMBER          NOT NULL, 
    member_id      VARCHAR2(20)    NOT NULL UNIQUE, 
    member_pwd     VARCHAR2(20)    NOT NULL, 
    member_name    VARCHAR2(10)    NOT NULL, 
    birth_date     DATE            NOT NULL, 
    phone          VARCHAR2(13)    NOT NULL, 
    gender         CHAR(1)         NOT NULL  CHECK (gender IN ('M','F')),
    email          VARCHAR2(30)    NOT NULL UNIQUE, 
    enroll_date    DATE            NOT NULL, 
    CONSTRAINT MEMBER_PK PRIMARY KEY (member_no)*/
}
