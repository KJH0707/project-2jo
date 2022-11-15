package com.fork.store.db;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Set;
import java.util.TreeSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class StoreDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	// 디비 연결해주는 메서드(커넥션풀)
	private Connection getConnection() throws Exception {
		// 1. 드라이버 로드 // 2. 디비연결
		
		// Context 객체 생성 (JNDI API)
		Context initCTX = new InitialContext();
		// 디비연동정보 불러오기
		DataSource ds = (DataSource)initCTX.lookup("java:comp/env/jdbc/project12");
		// 디비정보(연결)불러오기
		con = ds.getConnection();
		
		System.out.println(" DAO : 디비연결 성공(커넥션풀)");
		System.out.println(" DAO : con : " +con);
		return con;
	}
		
	// 자원해제 메서드 - closeDB()
	public void closeDB() {
		System.out.println(" DAO : 디비연결자원 해제");
		
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	// 자원해제 메서드 - closeDB()
	
	// getStoreList(페이징) 가게 목록 불러오기 start
	
	public ArrayList getBoardList(int cnt) {
		System.out.println(" DAO : getBoardList() 호출 ");
		// 글정보 모두 저장하는 배열
		ArrayList boardList = new ArrayList();
		
		
		
		try {
		// 1.2. 디비 연결
			con = getConnection();
		// 3. sql 작성(select) & pstmt 객체
//			sql = "select * from itwill_board";
			Set set = new TreeSet<>();
			while(set.size()<4) {
				int a = (int)(Math.random()*cnt+1);
				set.add(a);
			}
			Iterator<Integer> it = set.iterator();
			
				while(it.hasNext()) {
				sql = "select * from store where s_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, it.next());
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
				StoreDTO dto = new StoreDTO();
				dto.setC_no(rs.getInt("c_no"));
				dto.setS_image(rs.getString("s_image"));
				dto.setS_name(rs.getString("s_name"));
				dto.setS_star(rs.getDouble("s_star"));
				dto.setS_no(rs.getInt("s_no"));
				dto.setS_type(rs.getString("s_type"));
				//DTO -> List
				
				boardList.add(dto);
				}
		
			} // for
			System.out.println(" DAO : 게시판 목록 저장완료!");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return boardList;
	}
	
	// getStoreList(페이징) 가게 목록 불러오기 end
	
	public ArrayList getBoardList(int startRow, int pageSize) {
		System.out.println(" DAO : getBoardList() 호출 ");
		// 글정보 모두 저장하는 배열
		ArrayList boardList = new ArrayList();
		
		try {
		// 1.2. 디비 연결
			con = getConnection();
		// 3. sql 작성(select) & pstmt 객체
//			sql = "select * from itwill_board";
			sql = "select * from store " + "limit ?,?";
			pstmt = con.prepareStatement(sql);
		// ?????
			pstmt.setInt(1, startRow-1); // 시작행-1
			pstmt.setInt(2, pageSize); // 개수
		// 4. sql 실행
			rs = pstmt.executeQuery();
		// 5. 데이터 처리 (DB -> DTO -> List)
			while(rs.next()) {
				// DB -> DTO
				StoreDTO dto = new StoreDTO();
				dto.setC_no(rs.getInt("c_no"));
				dto.setS_image(rs.getString("s_image"));
				dto.setS_name(rs.getString("s_name"));
				dto.setS_star(rs.getDouble("s_star"));
				dto.setS_no(rs.getInt("s_no"));
				dto.setS_type(rs.getString("s_type"));
				//DTO -> List
				
				boardList.add(dto);
			}//while
			
			System.out.println(" DAO : 게시판 목록 저장완료!");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return boardList;
	}
	
	// getStoreList(페이징X) 가게 목록 전체 불러오기 start
	
	
	
	// getStoreList(페이징X) 가게 목록 전체 불러오기 end
	
	
	// getStoreCount 가게 갯수 start
	
	public int getBoardCount() {
		int cnt = 0;
		
		// 1.2. 디비연결
		try {
			con = getConnection();
			// 3. sql
			sql = "select count(*) from store";
			pstmt = con.prepareStatement(sql);
			
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터처리
			if(rs.next()) {
				
//				cnt = rs.getInt(1);
				cnt = rs.getInt("count(*)");
			}
			System.out.println(" DAO : 전체 글 개수 : " +cnt+"개");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return cnt;
	}
	
	// getStoreCount 가게 갯수 end
	
	// getStoreDetails 가게 상세보기 (s_no) - 추가함
	public StoreDTO getStoreDetails(int s_no) {
		StoreDTO dto = null;
		try {
			con = getConnection();
			sql = "select * from store where s_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,s_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new StoreDTO();
				dto.setS_no(rs.getInt("s_no"));
				dto.setS_name(rs.getString("s_name"));
				dto.setS_addr(rs.getString("s_addr"));
				dto.setS_tel(rs.getString("s_tel"));
				dto.setS_hours(rs.getString("s_hours"));
				dto.setS_type(rs.getString("s_type"));

				dto.setC_no(rs.getInt("c_no"));
				dto.setS_image(rs.getString("s_image"));
				
				dto.setS_content(rs.getString("s_content"));
				dto.setS_facility(rs.getString("s_facility"));
				dto.setS_latitude(rs.getString("s_latitude"));
				dto.setS_longtude(rs.getString("s_longtude"));
				dto.setS_menuname(rs.getString("s_menuname"));
				dto.setS_menuprice(rs.getString("s_menuprice"));
				dto.setS_menuImg(rs.getString("s_menuImg"));
				dto.setS_number(rs.getInt("s_number"));
	
				dto.setS_star(rs.getDouble("s_star"));
				dto.setS_regdate(rs.getTimestamp("s_regdate"));
				
				
				
			}
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			closeDB();
			
		}
		return dto;
	}

	
	
	// getStoreDetails 가게 상세보기 (s_no)
}
