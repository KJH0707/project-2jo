package com.fork.board.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
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
	
	// 글쓰기 메서드-insertBoard(DTO)
			public void insertQnaBoard(BoardDTO dto) {
				int rev_no = 0;
				
				try {
					// DB connect
					con = getConnection();
					// sql & pstmt
					// calculate bno
					sql = "select max(rev_no) from reviewcs";
					pstmt = con.prepareStatement(sql);
					// execute sql
					rs = pstmt.executeQuery();
					// data
					if(rs.next()) {
						rev_no = rs.getInt(1)+1;
					}
					
					System.out.println("DAO : rev_no : "+rev_no);
					
					
				// sql & pstmt
				sql = "insert into reviewcs(rev_no,s_no,rev_date,rev_subject,rev_category,m_no,qna_sort,rev_content,rev_file) "
						+ "values(?,?,now(),?,?,?,?,?,?)";
				
				pstmt = con.prepareStatement(sql);
				 //???
				pstmt.setInt(1, rev_no);
				pstmt.setInt(2, dto.getS_no());
				pstmt.setString(3, dto.getRev_subject());
				pstmt.setInt(4, dto.getRev_category());
				pstmt.setInt(5, dto.getM_no());
				pstmt.setString(6, dto.getQna_sort());
				pstmt.setString(7, dto.getRev_content());
				pstmt.setString(8, dto.getRev_file());
				
				// 4.
				pstmt.executeUpdate();
				
				System.out.println("DAO : 글쓰기 완료");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
			}
			// 글쓰기 메서드-insertBoard(DTO)
	
			// 글 전체 개수 확인 - getBoardCount()
			public int getQnaBoardCount() {
				int cnt = 0;
				try {
					// 1.2. DB connect
					con = getConnection();
					// 3 . sql
					sql = "select count(*) from reviewcs";
					pstmt = con.prepareStatement(sql);
					// 4. execute
					rs = pstmt.executeQuery();
					// 5. handle data
					if(rs.next()) {
						// == cnt = rs.getInt(1);
						cnt = rs.getInt("count(*)");
					}
					System.out.println("DAO : 전체 글 개수 : "+cnt+"개");
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
				return cnt;
			}
			// 글 전체 개수 확인 - getBoardCount()
	
	
			// 글 정보 가져오기 메서드 -getBoardList(int startRow, int pageSize) 
			public ArrayList getQnaBoardList(int startRow, int pageSize) {
			System.out.println(" DAO : getBoardList() 호출 ");
			// 글정보 모두 저장하는 배열
			ArrayList boardList = new ArrayList();
			try {
				// 1.2. 디비연결
				con = getConnection();
				
				// 3. sql 작성(select) & pstmt 객체
//								sql = "select * from itwill_board";
				sql = "select * from reviewcs order by rev_no asc limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow-1);
				pstmt.setInt(2, pageSize);
				// 4. sql 실행
				rs = pstmt.executeQuery();
				
				// 5. 데이터 처리(select가 가져오는 데이터 : DB의 데이터 -> DTO에 저장 -> List에 저장)
				while(rs.next()) {
					// DB 데이터를 꺼내어 DTO에 저장 (현재는 rs에 저장되어있기에 get, dto에 데이터 넣는거니까 set)
					BoardDTO dto = new BoardDTO();
					dto.setRev_no(rs.getInt("rev_no"));
					dto.setS_no(rs.getInt("s_no"));
					dto.setRev_subject(rs.getString("rev_subject"));
					dto.setRev_category(rs.getInt("rev_category"));
					dto.setM_no(rs.getInt("m_no"));
					dto.setQna_sort(rs.getString("qna_sort"));
					dto.setRev_content(rs.getString("rev_content"));
					dto.setRev_file(rs.getString("rev_file"));
					dto.setRev_date(rs.getDate("rev_date"));
					
					// DTO에 넣은 정보 -> List 배열에 저장
					boardList.add(dto);
					
				}//while
				System.out.println(" DAO : 게시판 목록 저장 완료 ");
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return boardList;
		}
		// 글 정보 가져오기 -getBoardList(int startRow, int pageSize)
	
		// 글 수정하기 - updateQnaBoard()
		public void updateQnaBoard(BoardDTO dto) {
			try {
				con = getConnection();
				sql = "select * from reviewcs where rev_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, dto.getRev_no());
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
				sql = "update reviewcs set qna_sort=?,rev_subject=?,rev_file=?,rev_content=? where rev_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getQna_sort());
				pstmt.setString(2, dto.getRev_subject());
				pstmt.setString(3, dto.getRev_file());
				pstmt.setString(4, dto.getRev_content());
				pstmt.setInt(5, dto.getRev_no());
				pstmt.executeUpdate();
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
		}
		// 글 수정하기 - updateQnaBoard()
	
		// 글 삭제하기 - deleteQnaBoard()
		public void deleteQnaBoard(int rev_no) {
			try {
				con = getConnection();
//				sql = "select * from reviewcs where rev_no=?";
//				pstmt = con.prepareStatement(sql);
//				pstmt.setInt(1, dto.getRev_no());
//				rs = pstmt.executeQuery();
				sql = "delete from reviewcs where rev_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rev_no);
				pstmt.executeUpdate();
				
//				if(rs.next()) {
//					sql = "delete from reviewcs where rev_no=?";
//					pstmt = con.prepareStatement(sql);
//					pstmt.setInt(1, dto.getRev_no());
//					pstmt.executeUpdate();
//				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
		}
		// 글 삭제하기 - deleteQnaBoard()
	
		// 글 확인 - getQnaBoard()
		public BoardDTO getQnaBoard(int rev_no) {
			BoardDTO dto = null;
			try {
				con = getConnection();
				sql = "select * from reviewcs where rev_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rev_no);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					dto = new BoardDTO();
					
					dto.setM_no(rs.getInt("m_no"));
					dto.setQna_sort(rs.getString("qna_sort"));
					dto.setRev_category(rs.getInt("rev_category"));
					dto.setRev_content(rs.getString("rev_content"));
					dto.setRev_file(rs.getString("rev_file"));
					dto.setRev_no(rs.getInt("rev_no"));
					dto.setRev_subject(rs.getString("rev_subject"));
					dto.setS_no(rs.getInt("s_no"));
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return dto;
		}
		// 글 확인 - getQnaBoard()
	
	
	
	
	
	
	
	
	
	
	
	
}
