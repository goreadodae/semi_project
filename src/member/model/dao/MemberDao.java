package member.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import common.JDBCTemplate;
import member.model.vo.Member;
import ranking.model.dao.RankingDao;

public class MemberDao {

	public boolean emailCheck(String email, Connection conn) {
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		boolean result= false;
		
		try {
			prop.load(new FileReader(path+"resources/memberQuery.properties"));
			String query = prop.getProperty("emailCheck");
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			rset = pstmt.executeQuery();
			
			if(rset.next()) result = true;
			System.out.println(result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return result;
	}



	public void sendEmail(String email, String code) {

		final String id ="dna1234a@gmail.com";
		final String pwd ="dansiback0";
		System.out.println(id);
		Properties p = new Properties();
		p.put("mail.smtp.user", "dna1234a@gmail.com"); 
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");

		Session session = Session.getInstance(p, 
				new javax.mail.Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(id, pwd);
			}
		});
		session.setDebug(true);

		try {
			MimeMessage msg = new MimeMessage(session);

			msg.setSubject("이메일 인증");
			Address fromAddr = new InternetAddress("dna1234a@gmail.com","수상한레시피","utf-8"); 
			msg.setFrom(fromAddr);
			Address toAddr = new InternetAddress(email);    
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent("인증번호 : "+code, "text/plain;charset=KSC5601"); 
			Transport.send(msg);

		}catch (Exception e) {
			e.printStackTrace();
		}
	}



	public boolean idCheck(String userId, Connection conn) {
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		boolean result= false;
		
		try {
			prop.load(new FileReader(path+"resources/memberQuery.properties"));
			String query = prop.getProperty("idCheck");
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();

			if(rset.next()) result = true;
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}



	public int insertMember(Connection conn, Member m) {
		
		PreparedStatement pstmt = null;
		int result =0;
		
		try {
			
			String query = "insert into member values (member_SEQ.NEXTVAL, ?, ?, ?,TO_DATE(?, 'YY-MM-DD'), ?, ?, ?, ?, SYSDATE)";
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPwd());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getBirthDate());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getGender());
			pstmt.setString(7, m.getEmail());
			pstmt.setString(8, m.getAddress());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}



	public Member login(String loginId, String loginPwd, Connection conn) {
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m=null;
		
		try {
			prop.load(new FileReader(path+"resources/memberQuery.properties"));
			String query = prop.getProperty("login");
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, loginId);
			pstmt.setString(2, loginPwd);
			
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				m = new Member();
				m.setMemberId(loginId);
				m.setMemberName(rset.getString("MEMBER_NAME"));
				m.setBirthDate(rset.getString("TO_CHAR(BIRTH_DATE,'YYMMDD')"));
				m.setPhone(rset.getString("PHONE"));
				m.setGender(rset.getString("GENDER"));
				m.setEmail(rset.getString("EMAIL"));
				m.setAddress(rset.getString("ADDRESS"));
				m.setEnrollDate(rset.getString("TO_CHAR(ENROLL_DATE,'YYMMDD')"));
			}
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return m;
	}



	public boolean pwdCheck(Connection conn, String id,  String password) {
		boolean result = false;
		String path = JDBCTemplate.class.getResource("..").getPath();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Properties prop = new Properties();
		try {
			prop.load(new FileReader(path+"resources/memberQuery.properties"));
			String query = prop.getProperty("pwdCheck");
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) 
				result=true;
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}



}
