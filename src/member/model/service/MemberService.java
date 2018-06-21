package member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import member.model.dao.MemberDao;
import member.model.vo.BuyProduct;
import member.model.vo.Comments;
import member.model.vo.Member;

public class MemberService {

	public boolean sendEmail(String email, String code) {
		Connection conn = JDBCTemplate.getConnection();
		boolean result = new MemberDao().emailCheck(email, conn);

		if (result == false) {
			new MemberDao().sendEmail(email, code);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public boolean idCheck(String userId) {

		Connection conn = JDBCTemplate.getConnection();
		boolean result = new MemberDao().idCheck(userId, conn);
		JDBCTemplate.close(conn);
		return result;
	}

	public int insertMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().insertMember(conn, m);

		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;

	}

	public Member login(String loginId, String loginPwd) {
		Connection conn = JDBCTemplate.getConnection();
		Member m = new MemberDao().login(loginId, loginPwd, conn);
		JDBCTemplate.close(conn);
		return m;
	}

	public boolean pwdCheck(String password, String id) {
		Connection conn = JDBCTemplate.getConnection();
		boolean result = new MemberDao().pwdCheck(conn, password, id);
		JDBCTemplate.close(conn);
		return result;
	}

	public int changInfo(String userId, String fullFilePath, String userPwd, String phone, String email, String address,
			String nickname) {

		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().changeInfo(conn, userId, fullFilePath, userPwd, phone, email, address, nickname);

		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}

	// 아름 수정 (회원번호에 따른 계정정보 가져오기)
	public Member selectOneMember(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		Member member = new MemberDao().selectOneMember(conn, memberNo);
		JDBCTemplate.close(conn);
		return member;
	}
	
	
	public ArrayList<BuyProduct> buyProduct(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<BuyProduct> list = new MemberDao().buyProduct(conn, userNo);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<Member> selectAll() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = new MemberDao().selectAll(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	
	public ArrayList<Comments> comments(int userNo) {
	      Connection conn = JDBCTemplate.getConnection();
	      ArrayList<Comments> list = new MemberDao().comments(conn, userNo);
	      JDBCTemplate.close(conn);
	      return list;
	  }

}
