package com.fork.store.db;

import java.sql.Connection;


import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.json.simple.JSONObject;




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
	
	public ArrayList getRecStoreList() {
		System.out.println(" DAO : getRecBoardList() 호출 ");
		// 글정보 모두 저장하는 배열
		ArrayList boardList = new ArrayList();
		
		try {
		// 1.2. 디비 연결
			con = getConnection();
		// 3. sql 작성(select) & pstmt 객체
//			sql = "select * from itwill_board";
			sql = "select * from store order by rand() limit 0,4";
			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
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
	
			
		// for
			System.out.println(" DAO : Rec게시판 목록 저장완료!");
			
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
				dto.setS_content(rs.getString("s_content"));
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
	
	public ArrayList getKwBoardList(int startRow, int pageSize, String kw) {
		System.out.println(" DAO : getBoardList() 호출 ");
		// 글정보 모두 저장하는 배열
		ArrayList boardList = new ArrayList();
		
		try {
		// 1.2. 디비 연결
			con = getConnection();
		// 3. sql 작성(select) & pstmt 객체
//			sql = "select * from itwill_board";
			sql = "select * from store where s_name Like ? limit ?,? ";
			pstmt = con.prepareStatement(sql);
		// ?????
			pstmt.setString(1, kw);
			pstmt.setInt(2, startRow-1); // 시작행-1
			pstmt.setInt(3, pageSize); // 개수
		// 4. sql 실행
			rs = pstmt.executeQuery();
		// 5. 데이터 처리 (DB -> DTO -> List)
			while(rs.next()) {
				// DB -> DTO
				StoreDTO dto = new StoreDTO();
				dto.setS_content(rs.getString("s_content"));
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
	
	
	public int getCntKwBoardList(int startRow, int pageSize, String kw) {
		System.out.println(" DAO : getBoardList() 호출 ");
		// 글정보 모두 저장하는 배열
		int cnt =0;
		
		try {
		// 1.2. 디비 연결
			con = getConnection();
		// 3. sql 작성(select) & pstmt 객체
//			sql = "select * from itwill_board";
			sql = "select count(*) from store where s_name Like ?";
			pstmt = con.prepareStatement(sql);
		// ?????
			pstmt.setString(1, kw);
			
		// 4. sql 실행
			rs = pstmt.executeQuery();
		// 5. 데이터 처리 (DB -> DTO -> List)
			if(rs.next()) {
				// DB -> DTO
				cnt = rs.getInt("count(*)");
			}//while
			
			System.out.println(" DAO : 게시판 목록 저장완료!");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return cnt;
	}
	
	
	public ArrayList getGuBoardList(int startRow, int pageSize, String gu) {
		System.out.println(" DAO : getBoardList() 호출 ");
		// 글정보 모두 저장하는 배열
		ArrayList boardList = new ArrayList();
		
		try {
		// 1.2. 디비 연결
			con = getConnection();
		// 3. sql 작성(select) & pstmt 객체
//			sql = "select * from itwill_board";
			sql = "SELECT * FROM store where substring(s_addr,7,?)=?";
			pstmt = con.prepareStatement(sql);
		// ?????
			pstmt.setInt(1, gu.length());
			pstmt.setString(2, gu);
			pstmt.setInt(3, startRow-1); // 시작행-1
			pstmt.setInt(4, pageSize); // 개수
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
				dto.setS_content(rs.getString("s_content"));
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

	
	public int getCntGuBoardList(int startRow, int pageSize, String gu) {
		System.out.println(" DAO : getBoardList() 호출 ");
		// 글정보 모두 저장하는 배열
		int cnt = 0;
		
		try {
		// 1.2. 디비 연결
			con = getConnection();
		// 3. sql 작성(select) & pstmt 객체
//			sql = "select * from itwill_board";
			sql = "SELECT count(*) FROM store where substring(s_addr,7,?)=?";
			pstmt = con.prepareStatement(sql);
		// ?????
			pstmt.setInt(1, gu.length());
			pstmt.setString(2, gu);
		// 4. sql 실행
			rs = pstmt.executeQuery();
		// 5. 데이터 처리 (DB -> DTO -> List)
			while(rs.next()) {
				// DB -> DTO
				cnt = rs.getInt("count(*)");
			}//while
			
			System.out.println(" DAO : 게시판 목록 저장완료!");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return cnt;
	}
	
	/** getStoreList(페이징, 가격대) 가게 목록 불러오기 end
	 * 
	 * @param StartRow(시작행),pageSize(한 페이지에 띄울 갯수), price(가격대)
	 * @return 위 사항들로 정제된 가게 리스트
	**/
	
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
	
		
		// 점주의 가게 정보조회(수정용) - getStore(s_no)
		public StoreDTO getStore(int s_no) { // 가게번호를 불러옴
			StoreDTO dto = null;
			
			try {
				con = getConnection();
				sql = "select * from store where s_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, s_no);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					dto = new StoreDTO();
					
					dto.setS_name(rs.getString("s_name"));
					dto.setS_addr(rs.getString("s_addr"));
					dto.setS_tel(rs.getString("s_tel"));
					dto.setS_hours(rs.getString("s_hours"));
					dto.setS_type(rs.getString("s_type"));
					dto.setS_image(rs.getString("s_image"));
					dto.setS_content(rs.getString("s_content"));
					dto.setS_facility(rs.getString("s_facility"));
					dto.setS_menuname(rs.getString("s_menuname"));
					dto.setS_menuImg(rs.getString("s_menuImg"));
					dto.setS_menuprice(rs.getString("s_menuprice"));
					dto.setS_number(rs.getInt("s_number"));
					dto.setS_price(rs.getInt("s_price"));
					
					dto.setS_regdate(rs.getTimestamp("s_regdate"));
				}
				
				System.out.println(" DAO : 가게 정보 조회완료!"+ dto);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return dto;
			
		}
		// 점주의 가게 정보조회(수정용) - getStore(s_no)
	
		// 점주의 가게수정 메서드 - updateStore(s_no)
		public void updateStore(StoreDTO dto) {
			
			try {
				con = getConnection();
				sql = "UPDATE store "
					+ "SET s_name=?,s_addr=?,s_tel=?,s_hours=?,s_type=?,s_price=?,s_image=?,s_content=?,s_facility=?,s_menuname=?,s_menuprice=?,s_menuImg=? "
					+ "WHERE s_no=? && c_no=?";
				pstmt = con.prepareStatement(sql);
				//???
				pstmt.setString(1,dto.getS_name());
				pstmt.setString(2, dto.getS_addr());
				pstmt.setString(3, dto.getS_tel());
				pstmt.setString(4, dto.getS_hours());
				pstmt.setString(5, dto.getS_type());
				pstmt.setInt(6, dto.getS_price());
				pstmt.setString(7, dto.getS_image());
				pstmt.setString(8, dto.getS_content());
				pstmt.setString(9, dto.getS_facility());
				pstmt.setString(10, dto.getS_menuname());
				pstmt.setString(11, dto.getS_menuprice());
				pstmt.setString(12, dto.getS_menuImg());
				
				pstmt.setInt(13, dto.getS_no());
				pstmt.setInt(14, dto.getC_no());
				
				pstmt.executeUpdate();
				
				System.out.println(" DAO : 가게 정보 수정 완료");
				
			}catch (Exception e) {
					// TODO: handle exception
			}finally {
				closeDB();
			}
		}

  public ArrayList getBoardList(int startRow, int pageSize, String price) {
			System.out.println(" DAO : getBoardList() 호출 ");
			// 글정보 모두 저장하는 배열
			ArrayList boardList = new ArrayList();
			
			try {
			// 1.2. 디비 연결
				con = getConnection();
			// 3. sql 작성(select) & pstmt 객체
//				sql = "select * from itwill_board";
				sql = "select * from store where ? < s_price and s_price<?" + "limit ?,? ";
				pstmt = con.prepareStatement(sql);
			// ?????
				pstmt.setString(1, price.split(",")[0]);
				pstmt.setString(2, price.split(",")[1]);
				pstmt.setInt(3, startRow-1); // 시작행-1
				pstmt.setInt(4, pageSize); // 개수
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
					dto.setS_content(rs.getString("s_content"));
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
	
		// getStoreList(페이징, 가격대) 가게 목록 불러오기 end
		
		public int getCntPrBoardList(int startRow, int pageSize, String price) {
			System.out.println(" DAO : getBoardList() 호출 ");
			// 글정보 모두 저장하는 배열
			int cnt=0;
			try {
			// 1.2. 디비 연결
				con = getConnection();
			// 3. sql 작성(select) & pstmt 객체
//				sql = "select * from itwill_board";
				sql = "select count(*) from store where ? < s_price and s_price<?";
				pstmt = con.prepareStatement(sql);
			// ?????
				pstmt.setString(1, price.split(",")[0]);
				pstmt.setString(2, price.split(",")[1]);
				
			// 4. sql 실행
				
				rs = pstmt.executeQuery();
			// 5. 데이터 처리 (DB -> DTO -> List)
				if(rs.next()) {
					// DB -> DTO
					cnt = rs.getInt("count(*)");
				}//while
				
				System.out.println(" DAO : 게시판 목록 저장완료!");
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			
			return cnt;
		}
	
		// getStoreList(페이징, 가격대) 가게 목록 불러오기 end
		
		/** getStoreList(페이징, 카테고리, 가격대) 가게 목록 불러오기 end
		 * 
		 * @param StartRow(시작행),pageSize(한 페이지에 띄울 갯수), category(가게 분류 ex)양식, 한식), price(가격대)
		 * @return 위 사항들로 정제된 가게 리스트
		**/
		
		public ArrayList getBoardList(int startRow, int pageSize, String[] category, String price) {
			System.out.println(" DAO : getBoardList() 호출 ");
			// 글정보 모두 저장하는 배열
			ArrayList boardList = new ArrayList();
			
			try {
			// 1.2. 디비 연결
				con = getConnection();
			// 3. sql 작성(select) & pstmt 객체
//					sql = "select * from itwill_board";
				StringBuffer sql2 = new StringBuffer();
				sql2.append("select * from store where ?<s_price and s_price<? and (");
				
				for (int i=0;i<category.length;i++) {
					sql2.append(" s_type=? or");
				}
				sql2.delete(sql2.length()-3,sql2.length());
				
				sql2.append(") limit ?,?");
				
				pstmt = con.prepareStatement(sql2.toString());
			// ?????
				pstmt.setString(1, price.split(",")[0]);
				pstmt.setString(2, price.split(",")[1]);
				
				for (int i=1;i<category.length+1;i++) {
					pstmt.setString(i+2, category[i-1]);
				}
				pstmt.setInt(category.length+3, startRow-1); // 시작행-1
				pstmt.setInt(category.length+4, pageSize); // 개수
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
					dto.setS_content(rs.getString("s_content"));
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
		
			// getStoreList(페이징, 카테고리) 가게 목록 불러오기 end
			
		public ArrayList getKwPrBoardList(int startRow, int pageSize, String kw, String price) {
			System.out.println(" DAO : getBoardList() 호출 ");
			// 글정보 모두 저장하는 배열
			ArrayList boardList = new ArrayList();
			
			try {
			// 1.2. 디비 연결
				con = getConnection();
			// 3. sql 작성(select) & pstmt 객체
//					sql = "select * from itwill_board";
				sql = "select * from store where ?<s_price and s_price<? and s_name Like ? limit ?,?";
				pstmt = con.prepareStatement(sql);
				
			// ?????
				pstmt.setString(1, price.split(",")[0]);
				pstmt.setString(2, price.split(",")[1]);
				pstmt.setString(3, kw);
				pstmt.setInt(4, startRow-1); // 시작행-1
				pstmt.setInt(5, pageSize);
				
			// 4. sql 실행
				System.out.println("dddddddddddddddddddddddddddddddddd"+pstmt);
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
					dto.setS_content(rs.getString("s_content"));
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
		
		public ArrayList getGuPrBoardList(int startRow, int pageSize, String gu, String price) {
			System.out.println(" DAO : getBoardList() 호출 ");
			// 글정보 모두 저장하는 배열
			ArrayList boardList = new ArrayList();
			
			try {
			// 1.2. 디비 연결
				con = getConnection();
			// 3. sql 작성(select) & pstmt 객체
//					sql = "select * from itwill_board";
				sql = "select * from store where ?<s_price and s_price<? and substring(s_addr,7,?)=? limit ?,?";
				
				
			// ?????
				pstmt.setString(1, price.split(",")[0]);
				pstmt.setString(2, price.split(",")[1]);
				pstmt.setInt(3, gu.length());
				pstmt.setString(4, gu);
				pstmt.setInt(5, startRow-1); // 시작행-1
				pstmt.setInt(6, pageSize);
				
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
					dto.setS_content(rs.getString("s_content"));
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
		
		// CtKw
		public ArrayList getCtKwBoardList(int startRow, int pageSize, String[] category, String kw) {
			System.out.println(" DAO : getBoardList() 호출 ");
			// 글정보 모두 저장하는 배열
			ArrayList boardList = new ArrayList();
			
			try {
			// 1.2. 디비 연결
				con = getConnection();
			// 3. sql 작성(select) & pstmt 객체
//					sql = "select * from itwill_board";
				StringBuffer sql2 = new StringBuffer();
				sql2.append("select * from store where s_name Like ? and (");
				
				for (int i=0;i<category.length;i++) {
					sql2.append(" s_type=? or");
				}
				sql2.delete(sql2.length()-3,sql2.length());
				
				sql2.append(") limit ?,?");
				
				pstmt = con.prepareStatement(sql2.toString());
			// ?????
				pstmt.setString(1, kw);
				
				for (int i=1;i<category.length+1;i++) {
					pstmt.setString(i+1, category[i-1]);
				}
				pstmt.setInt(category.length+2, startRow-1); // 시작행-1
				pstmt.setInt(category.length+3, pageSize); // 개수
				
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
					dto.setS_content(rs.getString("s_content"));
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
		
		public ArrayList getCtGuBoardList(int startRow, int pageSize, String[] category, String gu) {
			System.out.println(" DAO : getBoardList() 호출 ");
			// 글정보 모두 저장하는 배열
			ArrayList boardList = new ArrayList();
			
			try {
			// 1.2. 디비 연결
				con = getConnection();
			// 3. sql 작성(select) & pstmt 객체
//					sql = "select * from itwill_board";
				StringBuffer sql2 = new StringBuffer();
				sql2.append("select * from store where substring(s_addr,7,?)=? (");
				
				for (int i=0;i<category.length;i++) {
					sql2.append(" s_type=? or");
				}
				sql2.delete(sql2.length()-3,sql2.length());
				
				sql2.append(") limit ?,?");
				
				pstmt = con.prepareStatement(sql2.toString());
			// ?????
				pstmt.setString(1, gu);
				
				for (int i=1;i<category.length+1;i++) {
					pstmt.setString(i+1, category[i-1]);
				}
				pstmt.setInt(category.length+2, startRow-1); // 시작행-1
				pstmt.setInt(category.length+3, pageSize); // 개수
				
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
					dto.setS_content(rs.getString("s_content"));
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
		
		public ArrayList getKwGuBoardList(int startRow, int pageSize, String kw, String gu) {
			System.out.println(" DAO : getKwGuBoardList() 호출 ");
			// 글정보 모두 저장하는 배열
			ArrayList boardList = new ArrayList();
			
			try {
			// 1.2. 디비 연결
				con = getConnection();
			// 3. sql 작성(select) & pstmt 객체
//					sql = "select * from itwill_board";
				sql = "select * from store where s_name like ? and substring(s_addr,7,?)=? limit ?,?";
				pstmt = con.prepareStatement(sql);
				
			// ?????
				pstmt.setString(1, kw);
				pstmt.setInt(2, gu.length());
				pstmt.setString(3, gu);
				pstmt.setInt(4, startRow-1); // 시작행-1
				pstmt.setInt(5, pageSize);
				
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
					dto.setS_content(rs.getString("s_content"));
					//DTO -> List
					
					boardList.add(dto);
				}//while
				
				System.out.println(" DAO : KwGu게시판 목록 저장완료!");
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			
			return boardList;
		}
		
		public ArrayList getKwGuPrBoardList(int startRow, int pageSize, String kw, String gu, String price) {
			System.out.println(" DAO : getBoardList() 호출 ");
			// 글정보 모두 저장하는 배열
			ArrayList boardList = new ArrayList();
			
			try {
			// 1.2. 디비 연결
				con = getConnection();
			// 3. sql 작성(select) & pstmt 객체
//					sql = "select * from itwill_board";
				sql = "select * from store where ?<s_price and s_price<? and s_name Like ? and substring(s_addr,7,?)=? limit ?,?";
				pstmt = con.prepareStatement(sql);
				
			// ?????
				pstmt.setString(1, price.split(",")[0]);
				pstmt.setString(2, price.split(",")[1]);
				pstmt.setString(3, kw);
				pstmt.setInt(4,gu.length());
				pstmt.setString(5, gu);
				pstmt.setInt(6, startRow-1); // 시작행-1
				pstmt.setInt(7, pageSize);
				
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
					dto.setS_content(rs.getString("s_content"));
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

		public ArrayList getKwCtPrBoardList(int startRow, int pageSize, String kw, String[] category, String price) {
			System.out.println(" DAO : getBoardList() 호출 ");
			// 글정보 모두 저장하는 배열
			ArrayList boardList = new ArrayList();
			
			try {
			// 1.2. 디비 연결
				con = getConnection();
			// 3. sql 작성(select) & pstmt 객체
//					sql = "select * from itwill_board";
				
				StringBuffer sql2 = new StringBuffer();
				sql2.append("select * from store where ?<s_price and s_price<? and s_name Like ? and (");
				
				for (int i=0;i<category.length;i++) {
					sql2.append(" s_type=? or");
				}
				sql2.delete(sql2.length()-3,sql2.length());
				
				sql2.append(") limit ?,?");
				
				pstmt = con.prepareStatement(sql2.toString());
			// ?????
				pstmt.setString(1, price.split(",")[0]);
				pstmt.setString(2, price.split(",")[1]);
				pstmt.setString(3, kw);
				
				for (int i=1;i<category.length+1;i++) {
					pstmt.setString(i+3, category[i-1]);
				}
				pstmt.setInt(category.length+4, startRow-1); // 시작행-1
				pstmt.setInt(category.length+5, pageSize); // 개수
				
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
					dto.setS_content(rs.getString("s_content"));
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
		
		
		public ArrayList getKwGuCtBoardList(int startRow, int pageSize, String kw, String gu, String[] category) {
			System.out.println(" DAO : getBoardList() 호출 ");
			// 글정보 모두 저장하는 배열
			ArrayList boardList = new ArrayList();
			
			try {
			// 1.2. 디비 연결
				con = getConnection();
			// 3. sql 작성(select) & pstmt 객체
//					sql = "select * from itwill_board";
				
				StringBuffer sql2 = new StringBuffer();
				sql2.append("select * from store where s_name Like ? and substring(s_addr,7,?)=? and (");
				
				for (int i=0;i<category.length;i++) {
					sql2.append(" s_type=? or");
				}
				sql2.delete(sql2.length()-3,sql2.length());
				
				sql2.append(") limit ?,?");
				
				pstmt = con.prepareStatement(sql2.toString());
			// ?????
				pstmt.setString(1, kw);
				pstmt.setInt(2, gu.length());
				pstmt.setString(3, gu);
				
				for (int i=1;i<category.length+1;i++) {
					pstmt.setString(i+3, category[i-1]);
				}
				pstmt.setInt(category.length+4, startRow-1); // 시작행-1
				pstmt.setInt(category.length+5, pageSize); // 개수
				
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
					dto.setS_content(rs.getString("s_content"));
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
			/** getStoreList(페이징, 카테고리) 가게 목록 불러오기 end
			 * 
			 * @param StartRow(시작행),pageSize(한 페이지에 띄울 갯수), category(가게 분류 ex)양식, 한식)
			 * @return 위 사항들로 정제된 가게 리스트
			**/
		public ArrayList getPrGuCtBoardList(int startRow, int pageSize, String price, String gu, String[] category) {
			System.out.println(" DAO : getBoardList() 호출 ");
			// 글정보 모두 저장하는 배열
			ArrayList boardList = new ArrayList();
			
			try {
			// 1.2. 디비 연결
				con = getConnection();
			// 3. sql 작성(select) & pstmt 객체
//					sql = "select * from itwill_board";
				
				StringBuffer sql2 = new StringBuffer();
				sql2.append("select * from store where ?<s_price and s_price<? and substring(s_addr,7,?)=? and (");
				
				for (int i=0;i<category.length;i++) {
					sql2.append(" s_type=? or");
				}
				sql2.delete(sql2.length()-3,sql2.length());
				
				sql2.append(") limit ?,?");
				
				pstmt = con.prepareStatement(sql2.toString());
			// ?????
				pstmt.setString(1, price.split(",")[0]);
				pstmt.setString(2, price.split(",")[1]);
				pstmt.setInt(3, gu.length());
				pstmt.setString(4, gu);
				
				for (int i=1;i<category.length+1;i++) {
					pstmt.setString(i+4, category[i-1]);
				}
				pstmt.setInt(category.length+5, startRow-1); // 시작행-1
				pstmt.setInt(category.length+6, pageSize); // 개수
				
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
					dto.setS_content(rs.getString("s_content"));
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
		
		
		public ArrayList getPrGuCtKwBoardList(int startRow, int pageSize, String price, String gu, String[] category, String kw) {
			System.out.println(" DAO : getBoardList() 호출 ");
			// 글정보 모두 저장하는 배열
			ArrayList boardList = new ArrayList();
			
			try {
			// 1.2. 디비 연결
				con = getConnection();
			// 3. sql 작성(select) & pstmt 객체
//					sql = "select * from itwill_board";
				
				StringBuffer sql2 = new StringBuffer();
				sql2.append("select * from store where s_name Like ? and ?<s_price and s_price<? and substring(s_addr,7,?)=? and (");
				
				for (int i=0;i<category.length;i++) {
					sql2.append(" s_type=? or");
				}
				sql2.delete(sql2.length()-3,sql2.length());
				
				sql2.append(") limit ?,?");
				
				pstmt = con.prepareStatement(sql2.toString());
			// ?????
				pstmt.setString(1, kw);
				pstmt.setString(2, price.split(",")[0]);
				pstmt.setString(3, price.split(",")[1]);
				pstmt.setInt(4, gu.length());
				pstmt.setString(5, gu);
				
				for (int i=1;i<category.length+1;i++) {
					pstmt.setString(i+5, category[i-1]);
				}
				pstmt.setInt(category.length+6, startRow-1); // 시작행-1
				pstmt.setInt(category.length+7, pageSize); // 개수
				
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
					dto.setS_content(rs.getString("s_content"));
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
				public ArrayList getBoardList(int startRow, int pageSize, String[] category) {
					System.out.println(" DAO : getBoardList() 호출 ");
					// 글정보 모두 저장하는 배열
					ArrayList boardList = new ArrayList();
					
					try {
					// 1.2. 디비 연결
						con = getConnection();
					// 3. sql 작성(select) & pstmt 객체
//						sql = "select * from itwill_board";
						StringBuffer sql2 = new StringBuffer();
						sql2.append("select * from store where");
						
						
						for (int i=0;i<category.length;i++) {
							sql2.append(" s_type=? or");
						}
						sql2.delete(sql2.length()-2,sql2.length());
						sql2.append("limit ?,?");
						
						pstmt = con.prepareStatement(sql2.toString());
					// ?????
						for (int i=1;i<category.length+1;i++) {
							pstmt.setString(i, category[i-1]);
						}
						pstmt.setInt(category.length+1, startRow-1); // 시작행-1
						pstmt.setInt(category.length+2, pageSize); // 개수
						
					// 4. sql 실행
						rs = pstmt.executeQuery();
					// 5. 데이터 처리 (DB -> DTO -> List)
						while(rs.next()) {
							// DB -> DTO
							StoreDTO dto = new StoreDTO();
							dto.setS_content(rs.getString("s_content"));
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
			
				// getStoreList(페이징, 카테고리) 가게 목록 불러오기 end
	
				
		public int getCntCtBoardList(int startRow, int pageSize, String[] category) {
			System.out.println(" DAO : getBoardList() 호출 ");
			// 글정보 모두 저장하는 배열
			int cnt=0;
			try {
			// 1.2. 디비 연결
				con = getConnection();
			// 3. sql 작성(select) & pstmt 객체
//						sql = "select * from itwill_board";
				StringBuffer sql2 = new StringBuffer();
				sql2.append("select count(*) from store where");
				
				
				for (int i=0;i<category.length;i++) {
					sql2.append(" s_type=? or");
				}
				sql2.delete(sql2.length()-2,sql2.length());
				
				
				pstmt = con.prepareStatement(sql2.toString());
			// ?????
				for (int i=1;i<category.length+1;i++) {
					pstmt.setString(i, category[i-1]);
				}
				
				
			// 4. sql 실행
				rs = pstmt.executeQuery();
			// 5. 데이터 처리 (DB -> DTO -> List)
				if(rs.next()) {
					// DB -> DTO
					cnt=rs.getInt("count(*)");
				}//while
				
				System.out.println(" DAO : 게시판 목록 저장완료!");
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			
			return cnt;
		}
			
				// getStoreList(페이징, 카테고리) 가게 목록 불러오기 end
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

				sql = "insert into store(s_no,s_name,s_addr,s_tel,s_hours,s_type,s_image,s_content,s_facility,s_menuname,s_menuprice,s_menuImg,s_number,c_no,s_price) "
						+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
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
				pstmt.setInt(15, dto.getS_price());

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
				
//				cnt = rs.getInt("count(*)");
				cnt = rs.getInt(1);
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

		public int getCtPrCnt(int startRow, int pageSize, String[] category, String price) {
			System.out.println(" DAO : getcnt() 호출 ");
			// 글정보 모두 저장하는 배열
			int cnt = 0;
			
			try {
			// 1.2. 디비 연결
				con = getConnection();
			// 3. sql 작성(select) & pstmt 객체
//					sql = "select count(*) from itwill_board";
				StringBuffer sql2 = new StringBuffer();
				sql2.append("select count(*) from store where ?<s_price and s_price<? and (");
				
				for (int i=0;i<category.length;i++) {
					sql2.append(" s_type=? or");
				}
				sql2.delete(sql2.length()-3,sql2.length());
				
				sql2.append(")");
				
				pstmt = con.prepareStatement(sql2.toString());
			// ?????
				pstmt.setString(1, price.split(",")[0]);
				pstmt.setString(2, price.split(",")[1]);
				
				for (int i=1;i<category.length+1;i++) {
					pstmt.setString(i+2, category[i-1]);
				}
				
			// 4. sql 실행
				
				rs = pstmt.executeQuery();
			// 5. 데이터 처리 (DB -> DTO -> List)
				if(rs.next()) {
					// DB -> DTO
					cnt = rs.getInt("count(*)");
					
				}//if
				
				System.out.println(" DAO : 게시판 목록 저장완료!");
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			
			return cnt;
		}
		
		////
		
		public int getKwPrCnt(int startRow, int pageSize, String kw, String price) {
			System.out.println(" DAO : getcnt() 호출 ");
			// 글정보 모두 저장하는 배열
			int cnt = 0;
			
			try {
			// 1.2. 디비 연결
				con = getConnection();
			// 3. sql 작성(select) & pstmt 객체
//					sql = "select count(*) from itwill_board";
				sql = "select count(*) from store where ?<s_price and s_price<? and s_name Like ?";
				pstmt=con.prepareStatement(sql);
				
			// ?????
				pstmt.setString(1, price.split(",")[0]);
				pstmt.setString(2, price.split(",")[1]);
				pstmt.setString(3, kw);
				
				
			// 4. sql 실행
				
				rs = pstmt.executeQuery();
			// 5. 데이터 처리 (DB -> DTO -> List)
				if(rs.next()) {
					// DB -> DTO
					cnt = rs.getInt("count(*)");
					
				}//if
				
				System.out.println(" DAO : 게시판 목록 저장완료!");
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			
			return cnt;
		}		
		
		/////
		
		public int getGuPrCnt(int startRow, int pageSize, String gu, String price) {
			System.out.println(" DAO : getcnt() 호출 ");
			// 글정보 모두 저장하는 배열
			int cnt = 0;
			
			try {
			// 1.2. 디비 연결
				con = getConnection();
			// 3. sql 작성(select) & pstmt 객체
//					sql = "select count(*) from itwill_board";
				sql = "select count(*) from store where ?<s_price and s_price<? and substring(s_addr,7,?)=?";
				
				
			// ?????
				pstmt.setString(1, price.split(",")[0]);
				pstmt.setString(2, price.split(",")[1]);
				pstmt.setInt(3, gu.length());
				pstmt.setString(4, gu);
				
				
			// 4. sql 실행
				
				rs = pstmt.executeQuery();
			// 5. 데이터 처리 (DB -> DTO -> List)
				if(rs.next()) {
					// DB -> DTO
					cnt = rs.getInt("count(*)");
					
				}//if
				
				System.out.println(" DAO : 게시판 목록 저장완료!");
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			
			return cnt;
		}	
		///////
		
		public int getCtKwCnt(int startRow, int pageSize, String[] category, String kw) {
			System.out.println(" DAO : getcnt() 호출 ");
			// 글정보 모두 저장하는 배열
			int cnt = 0;
			
			try {
			// 1.2. 디비 연결
				con = getConnection();
			// 3. sql 작성(select) & pstmt 객체
//					sql = "select count(*) from itwill_board";
				StringBuffer sql2 = new StringBuffer();
				sql2.append("select count(*) from store where s_name Like ? and (");
				
				for (int i=0;i<category.length;i++) {
					sql2.append(" s_type=? or");
				}
				sql2.delete(sql2.length()-3,sql2.length());
				
				sql2.append(")");
				
				pstmt = con.prepareStatement(sql2.toString());
			// ?????
				pstmt.setString(1, kw);
				
				for (int i=1;i<category.length+1;i++) {
					pstmt.setString(i+1, category[i-1]);
				}
				
				
				rs = pstmt.executeQuery();
			// 5. 데이터 처리 (DB -> DTO -> List)
				if(rs.next()) {
					// DB -> DTO
					cnt = rs.getInt("count(*)");
					
				}//if
				
				System.out.println(" DAO : 게시판 목록 저장완료!");
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			return cnt;
		}
		// 점주의 가게수정 메서드 - updateStore(s_no)
		
		public int getCtGuCnt(int startRow, int pageSize, String[] category, String gu) {
			System.out.println(" DAO : getcnt() 호출 ");
			// 글정보 모두 저장하는 배열
			int cnt = 0;
			
			try {
			// 1.2. 디비 연결
				con = getConnection();
			// 3. sql 작성(select) & pstmt 객체
//					sql = "select count(*) from itwill_board";
				StringBuffer sql2 = new StringBuffer();
				sql2.append("select count(*) from store where substring(s_addr,7,?)=? (");
				
				for (int i=0;i<category.length;i++) {
					sql2.append(" s_type=? or");
				}
				sql2.delete(sql2.length()-3,sql2.length());
				
				sql2.append(")");
				
				pstmt = con.prepareStatement(sql2.toString());
			// ?????
				pstmt.setString(1, gu);
				
				for (int i=1;i<category.length+1;i++) {
					pstmt.setString(i+1, category[i-1]);
				}
				
				rs = pstmt.executeQuery();
			// 5. 데이터 처리 (DB -> DTO -> List)
				if(rs.next()) {
					// DB -> DTO
					cnt = rs.getInt("count(*)");
					
				}//if
				
				System.out.println(" DAO : 게시판 목록 저장완료!");
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			
			return cnt;
		}
		///////
		
		public int getKwGuCnt(int startRow, int pageSize, String kw, String gu) {
			System.out.println(" DAO : getcnt() 호출 ");
			// 글정보 모두 저장하는 배열
			int cnt = 0;
			
			try {
			// 1.2. 디비 연결
				con = getConnection();
			// 3. sql 작성(select) & pstmt 객체
//					sql = "select count(*) from itwill_board";
				sql = "select count(*) from store where s_name like ? and substring(s_addr,7,?)=?";
				pstmt = con.prepareStatement(sql);
				
			// ?????
				pstmt.setString(1, kw);
				pstmt.setInt(2, gu.length());
				pstmt.setString(3, gu);
				
			// 4. sql 실행
				
				rs = pstmt.executeQuery();
			// 5. 데이터 처리 (DB -> DTO -> List)
				if(rs.next()) {
					// DB -> DTO
					cnt = rs.getInt("count(*)");
					
				}//if
				
				System.out.println(" DAO : 게시판 목록 저장완료!");
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			
			return cnt;
		}
		
		//////
		
		public int getKwCtPrCnt(int startRow, int pageSize, String kw, String[] category, String price) {
			System.out.println(" DAO : getcnt() 호출 ");
			// 글정보 모두 저장하는 배열
			int cnt = 0;
			
			try {
			// 1.2. 디비 연결
				con = getConnection();
			// 3. sql 작성(select) & pstmt 객체
//					sql = "select count(*) from itwill_board";
				
				StringBuffer sql2 = new StringBuffer();
				sql2.append("select count(*) from store where ?<s_price and s_price<? and s_name Like ? and (");
				
				for (int i=0;i<category.length;i++) {
					sql2.append(" s_type=? or");
				}
				sql2.delete(sql2.length()-3,sql2.length());
				
				sql2.append(")");
				
				pstmt = con.prepareStatement(sql2.toString());
			// ?????
				pstmt.setString(1, price.split(",")[0]);
				pstmt.setString(2, price.split(",")[1]);
				pstmt.setString(3, kw);
				
				for (int i=1;i<category.length+1;i++) {
					pstmt.setString(i+3, category[i-1]);
				}
				
				rs = pstmt.executeQuery();
			// 5. 데이터 처리 (DB -> DTO -> List)
				if(rs.next()) {
					// DB -> DTO
					cnt = rs.getInt("count(*)");
					
				}//if
				
				System.out.println(" DAO : 게시판 목록 저장완료!");
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			
			return cnt;
		}		
		//////
		public int getKwGuPrCnt(int startRow, int pageSize, String kw, String gu, String price) {
			System.out.println(" DAO : getcnt() 호출 ");
			// 글정보 모두 저장하는 배열
			int cnt = 0;
			
			try {
			// 1.2. 디비 연결
				con = getConnection();
			// 3. sql 작성(select) & pstmt 객체
//					sql = "select count(*) from itwill_board";
				sql = "select count(*) from store where ?<s_price and s_price<? and s_name Like ? and substring(s_addr,7,?)=?";
				pstmt = con.prepareStatement(sql);
				
			// ?????
				pstmt.setString(1, price.split(",")[0]);
				pstmt.setString(2, price.split(",")[1]);
				pstmt.setString(3, kw);
				pstmt.setInt(4,gu.length());
				pstmt.setString(5, gu);
				
			// 4. sql 실행
				
				rs = pstmt.executeQuery();
			// 5. 데이터 처리 (DB -> DTO -> List)
				if(rs.next()) {
					// DB -> DTO
					cnt = rs.getInt("count(*)");
					
				}//if
				
				System.out.println(" DAO : 게시판 목록 저장완료!");
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}

			
			return cnt;
		}
		///////
		public int getPrGuCtCnt(int startRow, int pageSize, String price, String gu, String[] category) {
			System.out.println(" DAO : getcnt() 호출 ");
			// 글정보 모두 저장하는 배열
			int cnt = 0;
			
			try {
			// 1.2. 디비 연결
				con = getConnection();
			// 3. sql 작성(select) & pstmt 객체
//					sql = "select count(*) from itwill_board";
				
				StringBuffer sql2 = new StringBuffer();
				sql2.append("select count(*) from store where ?<s_price and s_price<? and substring(s_addr,7,?)=? and (");
				
				for (int i=0;i<category.length;i++) {
					sql2.append(" s_type=? or");
				}
				sql2.delete(sql2.length()-3,sql2.length());
				
				sql2.append(")");
				
				pstmt = con.prepareStatement(sql2.toString());
			// ?????
				pstmt.setString(1, price.split(",")[0]);
				pstmt.setString(2, price.split(",")[1]);
				pstmt.setInt(3, gu.length());
				pstmt.setString(4, gu);
				
				for (int i=1;i<category.length+1;i++) {
					pstmt.setString(i+4, category[i-1]);
				}
				
				
				rs = pstmt.executeQuery();
			// 5. 데이터 처리 (DB -> DTO -> List)
				if(rs.next()) {
					// DB -> DTO
					cnt = rs.getInt("count(*)");
					
				}//if
				
				System.out.println(" DAO : 게시판 목록 저장완료!");
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			
			return cnt;
		}			
		
		///////
		
		public int getKwGuCtCnt(int startRow, int pageSize, String kw, String gu, String[] category) {
			System.out.println(" DAO : getcnt() 호출 ");
			// 글정보 모두 저장하는 배열
			int cnt = 0;
			
			try {
			// 1.2. 디비 연결
				con = getConnection();
			// 3. sql 작성(select) & pstmt 객체
//					sql = "select count(*) from itwill_board";
				
				StringBuffer sql2 = new StringBuffer();
				sql2.append("select count(*) from store where s_name Like ? and substring(s_addr,7,?)=? and (");
				
				for (int i=0;i<category.length;i++) {
					sql2.append(" s_type=? or");
				}
				sql2.delete(sql2.length()-3,sql2.length());
				
				sql2.append(")");
				
				pstmt = con.prepareStatement(sql2.toString());
			// ?????
				pstmt.setString(1, kw);
				pstmt.setInt(2, gu.length());
				pstmt.setString(3, gu);
				
				for (int i=1;i<category.length+1;i++) {
					pstmt.setString(i+3, category[i-1]);
				}
				
				rs = pstmt.executeQuery();
			// 5. 데이터 처리 (DB -> DTO -> List)
				if(rs.next()) {
					// DB -> DTO
					cnt = rs.getInt("count(*)");
					
				}//if
				
				System.out.println(" DAO : 게시판 목록 저장완료!");
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			
			return cnt;
		}		
		
		//////
		
		public int getPrGuCtKwCnt(int startRow, int pageSize, String price, String gu, String[] category, String kw) {
			System.out.println(" DAO : getcnt() 호출 ");
			// 글정보 모두 저장하는 배열
			int cnt = 0;
			
			try {
			// 1.2. 디비 연결
				con = getConnection();
			// 3. sql 작성(select) & pstmt 객체
//					sql = "select count(*) from itwill_board";
				
				StringBuffer sql2 = new StringBuffer();
				sql2.append("select count(*) from store where s_name Like ? and ?<s_price and s_price<? and substring(s_addr,7,?)=? and (");
				
				for (int i=0;i<category.length;i++) {
					sql2.append(" s_type=? or");
				}
				sql2.delete(sql2.length()-3,sql2.length());
				
				sql2.append(")");
				
				pstmt = con.prepareStatement(sql2.toString());
			// ?????
				pstmt.setString(1, kw);
				pstmt.setString(2, price.split(",")[0]);
				pstmt.setString(3, price.split(",")[1]);
				pstmt.setInt(4, gu.length());
				pstmt.setString(5, gu);
				
				for (int i=1;i<category.length+1;i++) {
					pstmt.setString(i+5, category[i-1]);
				}
				
				rs = pstmt.executeQuery();
			// 5. 데이터 처리 (DB -> DTO -> List)
				if(rs.next()) {
					// DB -> DTO
					cnt = rs.getInt("count(*)");
					
				}//if
				
				System.out.println(" DAO : 게시판 목록 저장완료!");
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			
			return cnt;
		}
		
		// getStoreDetails 가게 상세보기 (s_no)
		
				
				// 조회수 1증가 - updateReadcount(bno)
		public void updateReadcount(int s_no) {
			
			try {
				// 1.2. 디비연결
				con = getConnection();
				// 3. sql 작성(update) & pstmt 객체
				sql = "update store set s_readcount=s_readcount+1 "
						+ " where s_no=?";
				pstmt = con.prepareStatement(sql);
				// ???
				pstmt.setInt(1, s_no);
				
				// 4. sql 실행
				pstmt.executeUpdate();
				
				System.out.println(" DAO : 조회수 1증가 완료! ");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
		}
				// 조회수 1증가 - updateReadcount(bno)
		public ArrayList ranStore() {
			ArrayList list =  new ArrayList();
			try {
				con = getConnection();
				sql = "select * from store order by rand() limit 4";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					StoreDTO dto = new StoreDTO();
					dto.setC_no(rs.getInt("c_no"));
					dto.setS_image(rs.getString("s_image"));
					dto.setS_name(rs.getString("s_name"));
					dto.setS_star(rs.getDouble("s_star"));
					dto.setS_no(rs.getInt("s_no"));
					dto.setS_type(rs.getString("s_type"));
					dto.setS_image(rs.getString("s_image"));
					//DTO -> List
					
					list.add(dto);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
				return list;
		}
    
    // openAPI데이터 입력 메서드 - APIstore(DTO)
		public void APIstore(StoreDTO dto) { // 점주의 정보를 파라미터	storeDTO dto
			int s_no = 0;
			
			try {
				con = getConnection();
				// 마지막 가게 number를 추가
				sql="select max(s_no) from store";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					s_no = rs.getInt(1)+1; // 첫번째 인덱스를 가져와서 +1
				}
				
				sql = "insert into store(s_no,s_name,s_addr,s_tel,s_hours,s_type,s_image,s_content,s_facility,s_menuname,s_menuprice,s_menuImg,s_number,s_price,c_no,api_ID) "
						+ "values("
						+ "?,?,?,?,?,"
						+ "?,?,?,?,?,"
						+ "?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, s_no);
				pstmt.setString(2, dto.getS_name());
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
				
				pstmt.setInt(14, dto.getS_price());
				pstmt.setInt(15, dto.getC_no()); // 기본값 입력
				pstmt.setInt(16, dto.getApi_ID()); // 기본값 입력
				
				pstmt.executeUpdate(); // result = 1 / 실패시 0 
				
				System.out.println(" DAO : 가게입력 완료");
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
		}
		// openAPI데이터 입력 메서드 - APIstore(DTO)
		
		// openAPI데이터 중복 체크 - APIDataCheck(api_ID)
		public int APIDataCheck(String key) {
			int result = 0; // 중복x - 데이터 추가(0), 중복o - 해당 map 삭제(1)
			int tmp = Integer.parseInt(key.trim());
			try {
				con = getConnection();
				sql = "select * from store where api_ID=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, tmp);
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = 1;
					System.out.println(" DAO : 중복 데이터 ");
				}
				System.out.println(" DAO : 데이터 결과 : "+ result);
    
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			return result;
		}
		// openAPI데이터 중복 체크 - APIDataCheck(api_ID)
		
		// openAPI데이터 업데이트 - APIUpdate(dto)
		public void APIUpdate(StoreDTO dto) {
			
			try {
				con = getConnection();
				sql = "UPDATE store "
						+ "SET s_name=?,s_addr=?,s_hours=?,s_type=?,s_tel=?,s_content=?,s_facility=? "
						+ "WHERE api_ID=?";
				
				pstmt = con.prepareStatement(sql);
				
				//???
				pstmt.setString(1, dto.getS_name());
				pstmt.setString(2, dto.getS_addr());
				pstmt.setString(3, dto.getS_hours());
				pstmt.setString(4, dto.getS_type());
				pstmt.setString(5, dto.getS_tel());
				pstmt.setString(6, dto.getS_content());
				pstmt.setString(7, dto.getS_facility());
				pstmt.setInt(8, dto.getC_no());
				//pstmt.setInt(8, dto.getS_price());
				pstmt.setInt(9, dto.getApi_ID());
				
				pstmt.executeUpdate();
				
				System.out.println(" DAO : 변경된 가게 정보 수정 완료");
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
		}
		// openAPI데이터 업데이트 - APIUpdate(dto)
		
		// openAPI 가게 리스트- getStoreList()
		public List<Map<String,Object>> getStoreList() {
			List<Map<String,Object>> storelist = new ArrayList<Map<String,Object>>();
			Map<String,Object> map = null;
			StoreDTO dto = new StoreDTO();
			
			try {
				con = getConnection();
				sql = "SELECT * FROM store WHERE api_ID IS NOT NULL";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				
				while(rs.next()) {
					map = new HashMap<String,Object>();
					
					map.put("s_addr", rs.getString("s_addr"));
					map.put("s_content", rs.getString("s_content"));
					map.put("s_facility", rs.getString("s_facility"));
					map.put("s_hours", rs.getString("s_hours"));
					map.put("s_image", rs.getString("s_image"));
					map.put("s_menuImg", rs.getString("s_menuImg"));
					map.put("s_menuname", rs.getString("s_menuname"));
					map.put("s_menuprice", rs.getString("s_menuprice"));
					
					map.put("s_name", rs.getString("s_name"));
					map.put("s_no", rs.getInt("s_no"));
					map.put("s_number", rs.getInt("s_number"));
					map.put("s_price", rs.getInt("s_price"));
					map.put("s_regdate", rs.getTimestamp("s_regdate"));
					map.put("s_tel", rs.getString("s_tel"));
					map.put("s_type", rs.getString("s_type"));
					map.put("api_ID", rs.getInt("api_ID"));

					storelist.add(map);
				}
				System.out.println(" DAO : api에서 추가한 상점 갯수 :" + storelist.size());

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			return storelist;
		}
		// openAPI 가게 리스트- getStoreList()
		


	// Main에서 !!!!!!!!!!! Star !!!!!!!! getStoreList(페이징) 가게 목록 불러오기 start

		public ArrayList getBoardListStar(int cnt) {
			System.out.println(" DAO : getBoardListStar() 호출 ");
			// 글정보 모두 저장하는 배열
			ArrayList boardList = new ArrayList();
			
			try {
			// 1.2. 디비 연결
				con = getConnection();
			// 3. sql 작성(select) & pstmt 객체
					sql = "select * from store order by s_star desc limit 4";
					pstmt = con.prepareStatement(sql);
					
					rs = pstmt.executeQuery();
					while(rs.next()) {
					StoreDTO dto = new StoreDTO();
					dto.setC_no(rs.getInt("c_no"));
					dto.setS_image(rs.getString("s_image"));
					dto.setS_name(rs.getString("s_name"));
					dto.setS_star(rs.getDouble("s_star"));
					dto.setS_no(rs.getInt("s_no"));
					dto.setS_type(rs.getString("s_type"));
					//DTO -> List
					
					boardList.add(dto);
					}// for
				System.out.println(" DAO : 게시판 목록 저장완료!");
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			
			return boardList;
		}
		
		// Main에서 !!!!!!!!!!! Star !!!!!!!! getStoreList(페이징) 가게 목록 불러오기 end

		
		// Main에서 !!!!!!!!!!! ReadCount !!!!!!!! getStoreList(페이징) 가게 목록 불러오기 start
		
			public ArrayList getBoardListRead(int cnt) {
				System.out.println(" DAO : getBoardListRead() 호출 ");
				// 글정보 모두 저장하는 배열
				ArrayList boardList = new ArrayList();
				
				try {
				// 1.2. 디비 연결
					con = getConnection();
				// 3. sql 작성(select) & pstmt 객체
						sql = "select * from store order by s_readcount desc limit 4";
						pstmt = con.prepareStatement(sql);
						
						rs = pstmt.executeQuery();
						while(rs.next()) {
						StoreDTO dto = new StoreDTO();
						dto.setC_no(rs.getInt("c_no"));
						dto.setS_image(rs.getString("s_image"));
						dto.setS_name(rs.getString("s_name"));
						dto.setS_star(rs.getDouble("s_star"));
						dto.setS_no(rs.getInt("s_no"));
						dto.setS_type(rs.getString("s_type"));
						//DTO -> List
						
						boardList.add(dto);
						}// for
					System.out.println(" DAO : 게시판 목록 저장완료!");
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeDB();
				}
				
				return boardList;
			}
			
			public Vector<ArrayList> costStore() {
				
				Vector<ArrayList> listAll = new Vector<ArrayList>(); 
				
				ArrayList list1 = new ArrayList();
				ArrayList list2 = new ArrayList();
				ArrayList list3 = new ArrayList();
				ArrayList list4 = new ArrayList();
				
				try {
					con = getConnection();
					sql = "select * from store where s_price between 0 and 24999 order by rand() limit 3";
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()) {
						StoreDTO dto = new StoreDTO();
						dto.setC_no(rs.getInt("c_no"));
						dto.setS_image(rs.getString("s_image"));
						dto.setS_name(rs.getString("s_name"));
						dto.setS_star(rs.getDouble("s_star"));
						dto.setS_no(rs.getInt("s_no"));
						dto.setS_type(rs.getString("s_type"));
						dto.setS_price(rs.getInt("s_price"));
						
						list1.add(dto);
					}
					sql = "select * from store where s_price between 25000 and 49999 order by rand() limit 3";
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()) {
						StoreDTO dto = new StoreDTO();
						dto.setC_no(rs.getInt("c_no"));
						dto.setS_image(rs.getString("s_image"));
						dto.setS_name(rs.getString("s_name"));
						dto.setS_star(rs.getDouble("s_star"));
						dto.setS_no(rs.getInt("s_no"));
						dto.setS_type(rs.getString("s_type"));
						dto.setS_price(rs.getInt("s_price"));
						
						list2.add(dto);
					}
					sql = "select * from store where s_price between 50000 and 74999 order by rand() limit 3";
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()) {
						StoreDTO dto = new StoreDTO();
						dto.setC_no(rs.getInt("c_no"));
						dto.setS_image(rs.getString("s_image"));
						dto.setS_name(rs.getString("s_name"));
						dto.setS_star(rs.getDouble("s_star"));
						dto.setS_no(rs.getInt("s_no"));
						dto.setS_type(rs.getString("s_type"));
						dto.setS_price(rs.getInt("s_price"));
						
						list3.add(dto);
					}
					sql = "select * from store where s_price between 75000 and 100000 order by rand() limit 3";
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()) {
						StoreDTO dto = new StoreDTO();
						dto.setC_no(rs.getInt("c_no"));
						dto.setS_image(rs.getString("s_image"));
						dto.setS_name(rs.getString("s_name"));
						dto.setS_star(rs.getDouble("s_star"));
						dto.setS_no(rs.getInt("s_no"));
						dto.setS_type(rs.getString("s_type"));
						dto.setS_price(rs.getInt("s_price"));
						
						list4.add(dto);
					}
					
					listAll.add(list1);
					listAll.add(list2);
					listAll.add(list3);
					listAll.add(list4);
					
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				return listAll;
			}
			
			// main 에서 가격대별 추천 ~~~~~~
	
}
