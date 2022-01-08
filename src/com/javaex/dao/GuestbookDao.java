package com.javaex.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.javaex.vo.GuestbookVo;

public class GuestbookDao {
	
	// 0. import java.sql.*;
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//필드
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String id = "webdb";
	private String pw = "webdb";

	//연결하기	
	private void getConnection() {
		try {
			// 1. JDBC 드라이버 (Oracle) 로딩
			Class.forName(driver);
			
			// 2. Connection 얻어오기
			conn = DriverManager.getConnection(url, id, pw);
			
		} catch (ClassNotFoundException e) {
			System.out.println("error: 드라이버 로딩 실패 - " + e);
		} catch (SQLException e) {
			System.out.println("error:" + e);
		}
	}
	
	//닫기 메소드
	public void close() {
			// 5. 자원정리
			try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			System.out.println("error:" + e);
		}
	}
	
	//전체 가져오기
	public List<GuestbookVo> getList() {
		
		List<GuestbookVo> guestbookList = new ArrayList<GuestbookVo>();
		getConnection();
		// 3. SQL문 준비 / 바인딩 / 실행
		
		try {	
			//문자열준비
			String query = "";
			query += " SELECT no, ";
			query += " 		  name, ";
			query += " 		  password, ";
			query += " 		  content, ";
			query += " 		  to_char(reg_date, 'yyyy-mm-dd hh24:mi:ss') reg_date ";
			query += " FROM guestbook ";
			query += " ORDER BY reg_date desc ";
			
			//쿼리문 만들기
			pstmt = conn.prepareStatement(query);
			
			//바인딩(x)
						
			//실행
			rs = pstmt.executeQuery();
				
		// 4.결과처리
			
			while(rs.next()) {
				int no = rs.getInt("no");
				String name = rs.getString("name");
				String password = rs.getString("password");
				String content = rs.getString("content");
				String regDate = rs.getString("reg_date");
				
				GuestbookVo guestbookVo = new GuestbookVo(no, name, password, content, regDate);
				guestbookList.add(guestbookVo);
			}
			
		} catch (SQLException e) {
			System.out.println("error:" + e);
		}
				
		return guestbookList;
	}//getList 끝

	//등록
		public int insert(GuestbookVo vo) {
			
			int count = 0;

			getConnection();
			
			try {
				// 3. SQL문 준비 / 바인딩 / 실행
				String query = " insert into guestbook " + 
				               "        (no, " + 
				               "         name, " +
				               "         password, " +
				               "         content, " +
				               "         reg_date) " +
				               " values (seq_guestbook_no.nextval, " +
				               "         ?, " +
				               "         ?, " +
				               "         ?, " +
				               "         sysdate) " ;	
				
				pstmt = conn.prepareStatement(query);

				pstmt.setString(1, vo.getName());
				pstmt.setString(2, vo.getPassword());
				pstmt.setString(3, vo.getContent());

				count = pstmt.executeUpdate();

				// 4.결과처리
				System.out.println(count + "건 등록");

			} catch (SQLException e) {
				System.out.println("error:" + e);
			} 
			
			close();

			return count;
		}
	
	//삭제
		public int delete(GuestbookVo vo) {
			
			int count = 0;

			getConnection();
			
			try {

				// 3. SQL문 준비 / 바인딩 / 실행
				String query ="";
				query += " delete from guestbook "; 
				query += " where no= ? " ; 
				query += " and password= ? " ;
				
				pstmt = conn.prepareStatement(query);

				pstmt.setInt(1, vo.getNo());
				pstmt.setString(2, vo.getPassword());

				count = pstmt.executeUpdate();

				// 4.결과처리
				System.out.println(count + "건 삭제");

			} catch (SQLException e) {
				System.out.println("error:" + e);
			} 
			
			close();

			return count;
		}
		
		

	}