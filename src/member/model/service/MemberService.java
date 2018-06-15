package member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import member.model.dao.MemberDao;
import member.model.vo.Member;

public class MemberService {

	public ArrayList<Member> viewAllMember() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = new MemberDao().viewAllMember(conn);
		JDBCTemplate.close(conn);
		
		
		return list;
	}

}
