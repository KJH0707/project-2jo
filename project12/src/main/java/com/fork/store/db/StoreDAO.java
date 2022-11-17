package com.fork.store.db;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
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
			sql = "select * from store " + "limit ?,? ";
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
	
	// 점주의 가게입력 메서드 -storeJoin(DTO,c_no)
		/**
		 * 점주의 가게추가 메서드
		 * @param dto
		 * @return int형태로 정상 가입: 1, 실패 0, 잘못된 접근 -1
		 */
		public int storeJoin(StoreDTO dto, int c_no) { // 점주의 정보를 파라미터	storeDTO dto
			int s_no = 0;
			int result = -1;

			try {
				con = getConnection();
				// 마지막 가게number를 추가
				sql="select max(s_no) from store";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();

				if(rs.next()) {
					s_no = rs.getInt(1)+1; // 첫번째 인덱스를 가져와서 +1
				}

				sql = "insert into store(s_no,s_name,s_addr,s_tel,s_hours,s_type,s_image,s_content,s_facility,s_menuname,s_menuprice,s_menuImg,s_number,c_no) "
						+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
				pstmt = con.prepareStatement(sql);

				pstmt.setInt(1, s_no);
				pstmt.setString(2,dto.getS_name());
				pstmt.setString(3, dto.getS_addr());
				pstmt.setString(4, dto.getS_tel());
				pstmt.setString(5, dto.getS_hours());
				pstmt.setString(6, dto.getS_type());
				pstmt.setString(7, dto.getS_image());
				pstmt.setString(8, dto.getS_content());
				pstmt.setString(9, dto.getS_facility());
				pstmt.setString(10, dto.getS_menuname());
				pstmt.setString(11, dto.getS_menuprice());
				pstmt.setString(12, dto.getS_menuImg());
				pstmt.setInt(13, dto.getS_number());

				pstmt.setInt(14, c_no);

				result = pstmt.executeUpdate(); // result = 1 / 실패시 0 

				System.out.println(" DAO : 가게입력(1-성공/0-실패) " + result);

			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
				return result;	
		}
		// 점주의 가게입력 메서드 - storeJoin(DTO,c_no)
	
	
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
	
	
	
	
}
