package member.model.service;

import java.sql.Connection;

import common.JDBCTemplate;

import member.model.dao.MemberDao;
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

}
