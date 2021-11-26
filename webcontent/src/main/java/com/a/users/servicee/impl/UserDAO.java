package com.a.users.servicee.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.a.users.servicee.UserVO;

@Repository("userDAO")
public class UserDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	private final String USER_INSERT = "insert into userssa (id, password, name, email) values (?, ?, ?, ?)";
	private final String USER_UPDATE = "update users set name=?,email=?,where id=?";
	private final String USER_DELETE = "delete from userssa where password=?";
	private final String USER_GET = "select * from userssa  where id=? and password=?";
	private final String USER_LIST = "select * from userssa  order by id desc";

	public UserDAO() {
	}

	public void insertUser(UserVO vo) {
		System.out.println("insertUser 객체 생성" + vo.toString());

		try {
			this.conn = JDBCUtil.getConnection();
			this.pstmt = conn.prepareStatement(USER_INSERT);
			this.pstmt.setString(1, vo.getId());
			this.pstmt.setString(2, vo.getPassword());
			this.pstmt.setString(3, vo.getName());
			this.pstmt.setString(4, vo.getEmail());
			this.pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("insertUser EER " + e.getMessage());
		} finally {
			JDBCUtil.close(pstmt, conn);
		}

	}

	public void updateUser(UserVO vo) {
		System.out.println("updateUser 객체 생성" + vo.toString());

		try {
			this.conn = JDBCUtil.getConnection();
			this.pstmt = conn.prepareStatement(USER_UPDATE);
			this.pstmt.setString(1, vo.getId());
			this.pstmt.setString(2, vo.getPassword());
			this.pstmt.setString(3, vo.getName());
			this.pstmt.setString(4, vo.getEmail());
			this.pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("updateUser EER " + e.getMessage());
		} finally {
			JDBCUtil.close(pstmt, conn);
		}

	}

	public void deleteUser(UserVO vo) {
		System.out.println("deleteUser 객체 생성" + vo.toString());

		try {
			this.conn = JDBCUtil.getConnection();
			this.pstmt = conn.prepareStatement(USER_DELETE);
			this.pstmt.setString(1, vo.getPassword());
			this.pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("deleteUser EER " + e.getMessage());
		} finally {
			JDBCUtil.close(pstmt, conn);
		}

	}

	public UserVO getUser(UserVO vo) {
		UserVO user = null;
		System.out.println("getUser 객체생성");

		try {
			this.conn = JDBCUtil.getConnection();
			this.pstmt = conn.prepareStatement(USER_GET);
			this.pstmt.setString(1, vo.getId());
			this.pstmt.setString(2, vo.getPassword());
			this.rs = pstmt.executeQuery();

			if (this.rs.next()) {
				user = new UserVO();
				user.setId(this.rs.getString("usid"));
				user.setPassword(this.rs.getString("password"));
				user.setName(this.rs.getString("name"));
				user.setEmail(this.rs.getString("email"));
			}

		} catch (Exception e) {
			System.out.println("getUser EER" + e.getMessage());
		} finally {
			JDBCUtil.close(rs, pstmt, conn);

		}
		return user;
	}

	public List<UserVO> getUserList(UserVO vo) {
		List<UserVO> userList = new ArrayList<>();
		System.out.println("getUserList 객체생성");

		try {
			this.conn = JDBCUtil.getConnection();
			this.pstmt = conn.prepareStatement(USER_LIST);
			this.rs = pstmt.executeQuery();

			while (this.rs.next()) {
				UserVO user = new UserVO();
				user.setId(this.rs.getString("id"));
				user.setPassword(this.rs.getString("password"));
				user.setName(this.rs.getString("name"));
				user.setEmail(this.rs.getString("email"));
				userList.add(user);
			}

		} catch (Exception e) {
			System.out.println("getUser EER" + e.getMessage());
		} finally {
			JDBCUtil.close(rs, pstmt, conn);

		}
		return userList;
	}

}
