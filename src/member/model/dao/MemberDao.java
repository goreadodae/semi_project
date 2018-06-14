package member.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import common.JDBCTemplate;
import member.model.vo.Member;

public class MemberDao {

	public ArrayList<Member> viewAllMember(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		Member m = null;
		ArrayList<Member> list = new ArrayList<Member>();
		
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		
		try {
			prop.load(new FileReader(path+"resources/adminQuery.properties"));
			String query = prop.getProperty("viewAllMember");
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next())
			{
				m = new Member();
				m.setMemberNo(rset.getInt("member_no"));
				m.setMemberId(rset.getString("Member_id"));
				m.setMemberPwd(rset.getString("member_pwd"));
				m.setMemberName(rset.getString("member_name"));
				m.setBirthDate(rset.getDate("birth_date"));
				m.setPhone(rset.getString("phone"));
				m.setGender(rset.getString("gender"));
				m.setEmail(rset.getString("email"));
				m.setEnrollDate(rset.getDate("enroll_date"));
				list.add(m);
			}

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return list;
		
		
		
		
		
	}

}
