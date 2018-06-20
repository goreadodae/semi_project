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

			msg.setSubject("�̸��� ����");
			Address fromAddr = new InternetAddress("dna1234a@gmail.com","�����ѷ�����","utf-8"); 
			msg.setFrom(fromAddr);
			Address toAddr = new InternetAddress(email);    
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent("������ȣ : "+code, "text/plain;charset=KSC5601"); 
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
		
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		
		PreparedStatement pstmt = null;
		
		int result =0;
		
		try {
			prop.load(new FileReader(path+"resources/memberQuery.properties"));
			
			String query = "insert into member values(member_SEQ.NEXTVAL, ?, ?, ?, TO_DATE(?,'YY-MM-DD'), ?, ?, ?, SYSDATE,?,?,?)";
	
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPwd());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getBirthDate());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getGender());
			pstmt.setString(7, m.getEmail());
			pstmt.setString(8, m.getAddress());
			pstmt.setString(9, "");
			pstmt.setString(10, "");
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}



	public Member login(String loginId, String loginPwd, Connection conn) {
		
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		
		try {
			prop.load(new FileReader(path+"resources/memberQuery.properties"));
			String query = "select member_no, member_name, TO_CHAR(birth_date,'YYMMDD') as BIRTH_DATE, "
					+ "phone, email, address, profile, nickname from member where member_id = ? and member_pwd = ?";
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, loginId);
			pstmt.setString(2, loginPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member();
				
				m.setMemberNo(rset.getInt("MEMBER_NO"));
				m.setMemberName(rset.getString("MEMBER_NAME"));
				m.setBirthDate(rset.getString("BIRTH_DATE"));
				m.setPhone(rset.getString("PHONE"));
				m.setEmail(rset.getString("EMAIL"));
				m.setAddress(rset.getString("ADDRESS"));
				m.setProfile(rset.getString("PROFILE"));
				m.setNickName(rset.getString("NICKNAME"));
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

	public int changeInfo(Connection conn, String userId, String fullFilePath, String userPwd, String phone,
	         String email, String address, String nickname) {
	      
	      int result = 0;
	      String path = JDBCTemplate.class.getResource("..").getPath();
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      
	      Properties prop = new Properties();
	      
	      try {
	         prop.load(new FileReader(path+"resources/memberQuery.properties"));
	         String query = "update member set member_pwd=?, phone=?, email=?, address=?, profile=?, nickname=? where member_id=?";

	         pstmt = conn.prepareStatement(query);
	         
	         pstmt.setString(1, userPwd);
	         pstmt.setString(2, phone);
	         pstmt.setString(3, email);
	         pstmt.setString(4, address);
	         pstmt.setString(5, fullFilePath);
	         pstmt.setString(6, nickname);
	         pstmt.setString(7, userId);
	         
	         result = pstmt.executeUpdate();
	         
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
