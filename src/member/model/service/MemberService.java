package member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import member.model.dao.MemberDao;
import member.model.vo.BuyProduct;
import member.model.vo.Comments;
import member.model.vo.Member;
import recipe.model.vo.Recipe;

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

	public Member insertMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		Member m2 = new MemberDao().insertMember(conn, m);

		JDBCTemplate.close(conn);
		return m2;
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

	public Member changInfo(String userId, String fullFilePath, String userPwd, String phone, String email,
			String address, String nickname) {

		Connection conn = JDBCTemplate.getConnection();
		Member m = new MemberDao().changeInfo(conn, userId, fullFilePath, userPwd, phone, email, address, nickname);

		if (m != null) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		return m;
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

	public String findId(String userName, String email) {
		Connection conn = JDBCTemplate.getConnection();
		String userId = new MemberDao().findId(conn, userName, email);
		JDBCTemplate.close(conn);
		return userId;
	}

	public int findPwd(String userId, String userName, String email, String uuid) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().findPwd(conn, userId, userName, email, uuid);
		if (result > 0) {
			JDBCTemplate.commit(conn);
			System.out.println(1);
		} else {
			JDBCTemplate.rollback(conn);
			System.out.println(0);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int deleteRecipe(int recipeNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().deleteRecipe(conn, recipeNo);
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<Recipe> recipe(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Recipe> list = new MemberDao().recipe(conn, userNo);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<Member> getMemberInfo() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = new MemberDao().getMemberInfo(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public int totalBascket(int member_no) {
		Connection conn = JDBCTemplate.getConnection();
		int count = new MemberDao().totalBascket(conn, member_no);
		JDBCTemplate.close(conn);
		return count;
	}

	public boolean loginCheck(String userId, String userPwd) {
		Connection conn = JDBCTemplate.getConnection();
		boolean result = new MemberDao().loginCheck(conn, userId, userPwd);

		JDBCTemplate.close(conn);

		return result;
	}

}
