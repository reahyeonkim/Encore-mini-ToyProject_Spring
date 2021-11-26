package com.a.bss.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.a.bbs.service.BssVO;
import com.a.users.servicee.impl.JDBCUtil;

@Repository("bssDAO")
public class BssDAO {

	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	private final String Bss_INSERT = "insert into bss (seq, title, writer, content) values ((select nvl(max(seq), 0)+1 from bss), ?, ?, ?)";
	private final String Bss_UPDATE = "update bss set title=?, content=? where seq=?";
	private final String Bss_DELETE = "delete from bss where seq=?";
	private final String Bss_GET = "select * from bss where seq=?";
	private final String Bss_LIST = "select * from bss order by seq desc";

	public BssDAO() {
	}

	public void insertBss(BssVO vo) {
		System.out.println("JDBC 로 insertBaord() 주입  " + vo.toString());

		try {
			this.conn = JDBCUtil.getConnection();
			this.stmt = this.conn.prepareStatement(Bss_INSERT);
			this.stmt.setString(1, vo.getTitle());
			this.stmt.setString(2, vo.getWriter());
			this.stmt.setString(3, vo.getContent());
			this.stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	public void updateBss(BssVO vo) {
		System.out.println(" JDBC 로 updateBss() 주입" + vo.toString());

		try {
			this.conn = JDBCUtil.getConnection();
			this.stmt = this.conn.prepareStatement(Bss_UPDATE);
			this.stmt.setString(1, vo.getTitle());
			this.stmt.setString(2, vo.getWriter());
			this.stmt.setInt(3, vo.getSeq());
			this.stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	public void deleteBss(BssVO vo) {
		System.out.println("JDBC 로 deleteBss() 주입" + vo.toString());

		try {
			this.conn = JDBCUtil.getConnection();
			this.stmt = this.conn.prepareStatement(Bss_DELETE);
			this.stmt.setInt(1, vo.getSeq());
			this.stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	public BssVO getBss(BssVO vo) {
		System.out.println("JDBC 로 getBss() 주입" + vo.toString());
		BssVO board = null;

		try {
			this.conn = JDBCUtil.getConnection();
			this.stmt = this.conn.prepareStatement(Bss_GET);
			this.stmt.setInt(1, vo.getSeq());
			this.rs = this.stmt.executeQuery();

			if (this.rs.next()) {
				board = new BssVO();
				board.setSeq(this.rs.getInt("seq"));
				board.setTitle(this.rs.getString("title"));
				board.setWriter(this.rs.getString("writer"));
				board.setContent(this.rs.getString("content"));
				board.setRegDate(this.rs.getDate("regdate"));
				board.setCnt(this.rs.getInt("cnt"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return board;
	}

	public List<BssVO> getBssList(BssVO vo) {
		System.out.println("===> J===> JDBC 로 getBssList() 주입안료" + vo.toString());

		List<BssVO> bssList = new ArrayList<BssVO>();

		try {
			this.conn = JDBCUtil.getConnection();
			this.stmt = this.conn.prepareStatement(Bss_LIST);
			this.rs = this.stmt.executeQuery();

			while (this.rs.next()) {
				BssVO bss = new BssVO();
				bss.setSeq(this.rs.getInt("seq"));
				bss.setTitle(this.rs.getString("title"));
				bss.setWriter(this.rs.getString("writer"));
				bss.setContent(this.rs.getString("content"));
				bss.setRegDate(this.rs.getDate("regdate"));
				bss.setCnt(this.rs.getInt("cnt"));
				bssList.add(bss);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return bssList;
	}
}
