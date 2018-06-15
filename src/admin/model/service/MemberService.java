package admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import admin.model.dao.MemberDao;
import admin.model.vo.Member;
import common.JDBCTemplate;

public class MemberService {

	public ArrayList<Member> viewAllMember() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = new MemberDao().viewAllMember(conn);
		JDBCTemplate.close(conn);
		
		
		return list;
	}

}
