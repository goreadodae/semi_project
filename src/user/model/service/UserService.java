package user.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import user.model.dao.UserDao;

public class UserService {

	public void sendEmail(String email, String code) {
		
		Connection conn = JDBCTemplate.getConnection();
		int result = new UserDao().emailCheck(email, code, conn);
		
	}

}
