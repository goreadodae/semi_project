package admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import admin.model.dao.MemberDao;
import admin.model.vo.Member;
import admin.model.vo.MemberPageData;
import common.JDBCTemplate;
import notice.model.vo.PageData;

public class MemberService {

	public MemberPageData viewAllMember(int currentPage) {
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		ArrayList<Member> list = new MemberDao().getCurrentPage(conn,currentPage,recordCountPerPage);
		String pageNavi = new MemberDao().getPageNavi(conn,currentPage,recordCountPerPage,naviCountPerPage);
		
		MemberPageData mpd = null;
		if(!list.isEmpty() &&!pageNavi.isEmpty())
		{
			mpd = new MemberPageData();
			mpd.setDataList(list);
			mpd.setPageNavi(pageNavi);
			
		}
		JDBCTemplate.close(conn);
		
		return mpd;
	}
	
	
	

}
