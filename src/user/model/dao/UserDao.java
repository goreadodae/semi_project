package user.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class UserDao {

	public int emailCheck(String email, String code, Connection conn) {
		PreparedStatement pstmt = null;`
		
		if(result>0) {
			new UserDao().sendEmail(email, code);
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

			msg.setSubject("안녕나야");
			Address fromAddr = new InternetAddress("dna1234a@gmail.com"); 
			msg.setFrom(fromAddr);
			Address toAddr = new InternetAddress(email);    
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent("인증번호 : "+code, "text/plain;charset=KSC5601"); 
			Transport.send(msg);

		}catch (Exception e) {
			e.printStackTrace();
		}
	}



}
