package member.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import common.JDBCTemplate;
import member.model.vo.BuyProduct;
import member.model.vo.Comments;
import member.model.vo.Member;
import recipe.model.vo.Recipe;

public class MemberDao {

	public boolean emailCheck(String email, Connection conn) {
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		boolean result = false;

		try {
			prop.load(new FileReader(path + "resources/memberQuery.properties"));
			String query = prop.getProperty("emailCheck");

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			rset = pstmt.executeQuery();

			if (rset.next())
				result = true;
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

		final String id = "dna1234a@gmail.com";
		final String pwd = "dansiback0";
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

		Session session = Session.getInstance(p, new javax.mail.Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(id, pwd);
			}
		});
		session.setDebug(true);

		try {
			MimeMessage msg = new MimeMessage(session);

			msg.setSubject("인증번호 발급", "utf-8");
			Address fromAddr = new InternetAddress("dna1234a@gmail.com", "수상한레시피", "utf-8");
			msg.setFrom(fromAddr);
			Address toAddr = new InternetAddress(email);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent("[수상한 레시피]인증번호 : [" + code + "] 를 입력해주세요.", "text/plain;charset=KSC5601");
			Transport.send(msg);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public boolean idCheck(String userId, Connection conn) {
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		boolean result = false;

		try {
			prop.load(new FileReader(path + "resources/memberQuery.properties"));
			String query = prop.getProperty("idCheck");

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();

			if (rset.next())
				result = true;

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	public Member insertMember(Connection conn, Member m) {

		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();

		PreparedStatement pstmt = null;

		int result = 0;
		Member m2 = null;

		try {
			prop.load(new FileReader(path + "resources/memberQuery.properties"));

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
			pstmt.setString(9, m.getProfile());
			pstmt.setString(10, m.getNickName());

			result = pstmt.executeUpdate();
			
			if (result > 0) {
				JDBCTemplate.commit(conn);
				m2 = insertSession(conn,m);
				
			} else {
				JDBCTemplate.rollback(conn);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return m2;
	}

	private Member insertSession(Connection conn, Member m) {
		String path = JDBCTemplate.class.getResource("..").getPath();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Properties prop = new Properties();
		Member m2=null;
		
		try {
			prop.load(new FileReader(path + "resources/memberQuery.properties"));
			String query = "select member_no, member_name, TO_CHAR(birth_date,'YYMMDD') as birth_date, phone, email, address, profile, nickname from member where member_id = ?";
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, m.getMemberId());

			rset = pstmt.executeQuery();

			if(rset.next()) {
				m2 = new Member();

				m2.setMemberNo(rset.getInt("MEMBER_NO"));
				m2.setMemberId(m.getMemberId());
				m2.setMemberPwd(m.getMemberPwd());
				m2.setMemberName(rset.getString("MEMBER_NAME"));
				m2.setBirthDate(rset.getString("BIRTH_DATE"));
				m2.setPhone(rset.getString("PHONE"));
				m2.setEmail(rset.getString("EMAIL"));
				m2.setAddress(rset.getString("ADDRESS"));
				m2.setProfile(rset.getString("PROFILE"));
				m2.setNickName(rset.getString("NICKNAME"));
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return m2;
	}


	public Member login(String loginId, String loginPwd, Connection conn) {

		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;

		try {
			prop.load(new FileReader(path + "resources/memberQuery.properties"));
			String query = "select member_no, member_name, TO_CHAR(birth_date,'YYMMDD') as BIRTH_DATE, "
					+ "phone, email, address, profile, nickname from member where member_id = ? and member_pwd = ?";

			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, loginId);
			pstmt.setString(2, loginPwd);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				m = new Member();

				m.setMemberNo(rset.getInt("MEMBER_NO"));
				m.setMemberId(loginId);
				m.setMemberPwd(loginPwd);
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

	public boolean pwdCheck(Connection conn, String id, String password) {
		boolean result = false;
		String path = JDBCTemplate.class.getResource("..").getPath();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		Properties prop = new Properties();
		try {
			prop.load(new FileReader(path + "resources/memberQuery.properties"));
			String query = prop.getProperty("pwdCheck");

			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, id);
			pstmt.setString(2, password);

			rset = pstmt.executeQuery();

			if (rset.next())
				result = true;

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	@SuppressWarnings("resource")
	public Member changeInfo(Connection conn, String userId, String fullFilePath, String userPwd, String phone,
			String email, String address, String nickname) {

		int result = 0;
		String path = JDBCTemplate.class.getResource("..").getPath();

		ResultSet rset = null;

		Member m = null;

		PreparedStatement pstmt = null;

		Properties prop = new Properties();

		try {
			prop.load(new FileReader(path + "resources/memberQuery.properties"));
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

			if (result > 0) {
				conn.commit();

				String query2 = "select member_no, member_name, TO_CHAR(birth_date,'YYMMDD') as BIRTH_DATE, "
						+ "phone, email, address, profile, nickname from member where member_id = ?";

				pstmt = conn.prepareStatement(query2);

				pstmt.setString(1, userId);

				rset = pstmt.executeQuery();

				if (rset.next()) {

					m = new Member();

					m.setMemberNo(rset.getInt("MEMBER_NO"));
					m.setMemberId(userId);
					m.setMemberPwd(userPwd);
					m.setMemberName(rset.getString("MEMBER_NAME"));
					m.setBirthDate(rset.getString("BIRTH_DATE"));
					m.setPhone(rset.getString("PHONE"));
					m.setEmail(rset.getString("EMAIL"));
					m.setAddress(rset.getString("ADDRESS"));
					m.setProfile(rset.getString("PROFILE"));
					m.setNickName(rset.getString("NICKNAME"));
				}

			} else {
				conn.rollback();
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}

	// 아름 수정 (회원번호에 따른 계정정보 가져오기)
	public Member selectOneMember(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = new Member();

		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();

		try {
			prop.load(new FileReader(path + "resources/memberQuery.properties"));
			String query = prop.getProperty("selectOneMember");
			pstmt = conn.prepareStatement("select * from member where member_no=?");
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				m.setMemberNo(rset.getInt("MEMBER_NO"));
				m.setMemberName(rset.getString("MEMBER_NAME"));
				m.setBirthDate(rset.getString("BIRTH_DATE"));
				m.setPhone(rset.getString("PHONE"));
				m.setEmail(rset.getString("EMAIL"));
				m.setAddress(rset.getString("ADDRESS"));
				m.setProfile(rset.getString("PROFILE"));
				m.setNickName(rset.getString("NICKNAME"));
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
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return m;
	}

	public ArrayList<BuyProduct> buyProduct(Connection conn, int userNo) {

		String path = JDBCTemplate.class.getResource("..").getPath();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		Properties prop = new Properties();
		ArrayList<BuyProduct> product = new ArrayList<BuyProduct>();

		BuyProduct b = null;

		try {
			prop.load(new FileReader(path + "resources/memberQuery.properties"));
			String query = "select product_1st_pic, product_name, buying_send_yn from product p inner join buying b on p.product_no = b.product_no where p.product_no in (select product_no from member join buying using(member_no) where member_no=?)";

			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, userNo);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				b = new BuyProduct();

				b.setProduct_img(rset.getString("product_1st_pic"));
				b.setProduct_name(rset.getString("product_name"));
				b.setBuying_send_yn(rset.getString("buying_send_yn"));

				product.add(b);
			}

		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return product;
	}

	public ArrayList<Member> selectAll(Connection conn) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;

		ArrayList<Member> list = new ArrayList<Member>();

		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();

		try {
			prop.load(new FileReader(path + "resources/memberQuery.properties"));

			String query = "select * from member";

			pstmt = conn.prepareStatement(query);

			rset = pstmt.executeQuery();

			while (rset.next()) {

				m = new Member();

				m.setMemberNo(rset.getInt("MEMBER_NO"));
				m.setMemberId(rset.getString("MEMBER_ID"));
				m.setMemberPwd(rset.getString("MEMBER_PWD"));
				m.setMemberName(rset.getString("MEMBER_NAME"));
				m.setBirthDate(rset.getString("BIRTH_DATE"));
				m.setPhone(rset.getString("PHONE"));
				m.setEmail(rset.getString("EMAIL"));
				m.setAddress(rset.getString("ADDRESS"));
				m.setProfile(rset.getString("PROFILE"));
				m.setNickName(rset.getString("NICKNAME"));

				list.add(m);
			}

		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return list;
	}

	public ArrayList<Comments> comments(Connection conn, int userNo) {
		String path = JDBCTemplate.class.getResource("..").getPath();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		Properties prop = new Properties();
		ArrayList<Comments> comments = new ArrayList<Comments>();
		Comments c;

		try {
			prop.load(new FileReader(path + "resources/memberQuery.properties"));
			String query = prop.getProperty("comments");

			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, userNo);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				c = new Comments();

				c.setCommentNO(rset.getInt("comment_no"));
				c.setRecipeName(rset.getString("recipe_title"));
				c.setCommentContents(rset.getString("comment_contents"));
				c.setCommentEnrollDate(rset.getTimestamp("comment_enroll_date"));

				comments.add(c);
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return comments;
	}

	public String findId(Connection conn, String userName, String email) {
		String path = JDBCTemplate.class.getResource("..").getPath();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String userId = null;
		Properties prop = new Properties();

		try {
			prop.load(new FileReader(path + "resources/memberQuery.properties"));
			String query = prop.getProperty("findId");

			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, userName);
			pstmt.setString(2, email);

			rset = pstmt.executeQuery();

			if (rset.next())
				userId = rset.getString("member_id");

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return userId;
	}

	public int findPwd(Connection conn, String userId, String userName, String email, String uuid) {
		String path = JDBCTemplate.class.getResource("..").getPath();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Properties prop = new Properties();
		int result = 0;
		int memberNo = 0;
		try {
			prop.load(new FileReader(path + "resources/memberQuery.properties"));
			String query = prop.getProperty("findPwd");

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userName);
			pstmt.setString(3, email);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				memberNo = rset.getInt("member_no");
				final String id = "dna1234a@gmail.com";
				final String pwd = "dansiback0";
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

				Session session = Session.getInstance(p, new javax.mail.Authenticator() {
					@Override
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(id, pwd);
					}
				});
				session.setDebug(true);

				try {
					MimeMessage msg = new MimeMessage(session);

					msg.setSubject("임시비빌번호 발급", "utf-8");
					Address fromAddr = new InternetAddress("dna1234a@gmail.com", "수상한레시피", "utf-8");
					msg.setFrom(fromAddr);
					Address toAddr = new InternetAddress("and0904@naver.com");
					msg.addRecipient(Message.RecipientType.TO, toAddr);
					msg.setContent("임시비빌번호 : " + uuid, "text/plain;charset=KSC5601");
					Transport.send(msg);

				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			result = new MemberDao().temporaryPwd(conn, uuid, memberNo);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	public int temporaryPwd(Connection conn, String uuid, int memberNo) {
		String path = JDBCTemplate.class.getResource("..").getPath();
		PreparedStatement pstmt = null;
		Properties prop = new Properties();
		int result = 0;

		try {
			prop.load(new FileReader(path + "resources/memberQuery.properties"));
			String query = "update member set member_pwd=? where member_no=?";

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, uuid);
			pstmt.setInt(2, memberNo);

			result = pstmt.executeUpdate();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	public int deleteRecipe(Connection conn, int recipeNo) {
		String path = JDBCTemplate.class.getResource("..").getPath();
		PreparedStatement pstmt = null;
		Properties prop = new Properties();
		int result = 0;

		try {
			prop.load(new FileReader(path + "resources/memberQuery.properties"));
			String query = "delete from recipe where recipe_no=?";

			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, recipeNo);

			result = pstmt.executeUpdate();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	public ArrayList<Recipe> recipe(Connection conn, int userNo) {
		String path = JDBCTemplate.class.getResource("..").getPath();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		Properties prop = new Properties();
		ArrayList<Recipe> recipe = new ArrayList<Recipe>();
		Recipe r = null;

		try {
			prop.load(new FileReader(path + "resources/memberQuery.properties"));
			String query = "select recipe_no, recipe_title, posted_date, recipe_views from recipe where member_no=?";

			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, userNo);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				r = new Recipe();

				r.setRecipeNo(rset.getInt("recipe_no"));
				r.setRecipeTitle(rset.getString("recipe_title"));
				r.setPostedDate(rset.getDate("posted_date"));
				r.setRecipeViews(rset.getInt("recipe_views"));

				recipe.add(r);
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return recipe;
	}

	public ArrayList<Member> getMemberInfo(Connection conn) {

		String path = JDBCTemplate.class.getResource("..").getPath();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		Properties prop = new Properties();

		ArrayList<Member> list = new ArrayList<Member>();

		String query = "select member_no, profile, nickname from member";
		try {

			prop.load(new FileReader(path + "resources/memberQuery.properties"));

			pstmt = conn.prepareStatement(query);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				m = new Member();

				m.setMemberNo(rset.getInt("member_no"));
				m.setProfile(rset.getString("profile"));
				m.setNickName(rset.getString("nickname"));

				list.add(m);
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int totalBascket(Connection conn, int member_no) {

		String path = JDBCTemplate.class.getResource("..").getPath();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		int result = 0;

		Properties prop = new Properties();

		String query = "select count(*) as totalBascket FROM member INNER JOIN bascket ON member.member_no=bascket.member_no where member.member_no = bascket.member_no and member.member_no = ?";

		try {

			prop.load(new FileReader(path + "resources/memberQuery.properties"));

			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, member_no);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				result = rset.getInt("totalBascket");
			}

		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	// 추가
	public boolean loginCheck(Connection conn, String userId, String userPwd) {
		Properties prop = new Properties();
		String path = JDBCTemplate.class.getResource("..").getPath();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		boolean result = false;

		try {
			prop.load(new FileReader(path + "resources/memberQuery.properties"));
			String query = "select member_id from member where member_id=? and member_pwd=?";

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);

			rset = pstmt.executeQuery();

			if (rset.next())
				result = true;

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
