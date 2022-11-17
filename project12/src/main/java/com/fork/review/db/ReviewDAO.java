package com.fork.review.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.fork.review.action.ActionForward;

public class ReviewDAO {
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
		// 글쓰기 메서드-insertReview(DTO)
		public void insertReview(ReviewDTO dto) {
			int rev_no = 0;
			
			try {
				// 1.2. 디비연결
				con = getConnection();
				// 3. sql 작성 & pstmt 객체
				sql = "select max(rev_no) from reviewcs";
				pstmt = con.prepareStatement(sql);
				// 4. sql 실행
				rs = pstmt.executeQuery();
				
				
				// 5. 데이터 처리
				if(rs.next()) {
					rev_no = rs.getInt(1)+1;
				}
				
				System.out.println(" DAO : rev_no : "+ rev_no);
				//3.
				sql = "insert into reviewcs(rev_no,s_no,rev_date,rev_star,rev_subject,"
						+ "rev_category,m_no,rev_content,rev_file) "
						+ "values(?,?,now(),?,?,?,?,?,?)";
//				sql = "insert into reviewcs(rev_no,s_no,rev_date,rev_subject,rev_content) values(?,?,now(),?,?)";
//						+ "values(?,now(),?,?,?,?,?,?,?,?)";
				
				pstmt = con.prepareStatement(sql);
				
				// ???
				pstmt.setInt(1, rev_no); //리뷰번호
				pstmt.setInt(2, dto.getS_no()); //가게 번호
				pstmt.setInt(3, dto.getRev_star()); //리뷰별점
				pstmt.setString(4, dto.getRev_subject()); //리뷰 제목
//				pstmt.setString(5, dto.getQna_sort()); 
				pstmt.setInt(5, 1); //리뷰카테고리?머고   0(문의) 1(리뷰) 
				pstmt.setInt(6, dto.getM_no()); //멤버번호
				pstmt.setString(7, dto.getRev_content());
				pstmt.setString(8, dto.getRev_file());
//				pstmt.setString(9, dto.getM_nickName()); //어케쓰는지모르겟음
				
				
				// 4. 
				pstmt.executeUpdate();
				
				
				
				sql="update store A set s_star=("
						+ "select avg(rev_star) "
						+ "from reviewcs B "
						+ "where A.s_no=B.s_no) "
						+ "where A.s_no=?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,dto.getS_no());
				
				pstmt.executeUpdate();
				
				
				System.out.println(" DAO : 글쓰기 완료! ");
				
				ActionForward forward = new ActionForward();
				
				forward.setPath("./ReviewList.rv");
				forward.setRedirect(true);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
		}
		// 글쓰기 메서드-insertReview(DTO)
		
		
		
		//리드카운트
		
		
		// 별점 평균
//		public int getAvg(int rev_star) {
//	        int avg = 0;
//	        String sql = "select avg(rev_star) as avg from reviewcs where s_no=?";
//	        
//	        try {
//	            pstmt = con.prepareStatement(sql);
//	            
//	            pstmt.setInt(1, s_no);
//	            
//	            rs = pstmt.executeQuery();
//	            if(rs.next())
//	                avg = rs.getInt("avg");
//	        } catch (Exception e) {
//				e.printStackTrace();
//			}finally {
//				closeDB();
//			}
//		}
		// 별점
		// 글 전체 개수 확인 - getReviewCount()
		public int getReviewCount() {
			int cnt = 0;
			
			try {
				//1.2. 디비연결
				con = getConnection();
				// 3. sql
				sql = "select count(*) from reviewcs";
				pstmt = con.prepareStatement(sql);
				
				// 4. sql 실행
				rs = pstmt.executeQuery();
				// 5. 데이터 처리
				if(rs.next()) {
					//cnt = rs.getInt(1);
					cnt = rs.getInt("count(*)");
				}
				System.out.println(" DAO : 전체 글 개수 : "+cnt+"개");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			return cnt;
		}
		// 글 전체 개수 확인 - getReviewCount()
		
		
		// review정보 가져오기 - getReviewList()
			public ArrayList getReviewList() {
				ReviewDTO dto = new ReviewDTO();
				System.out.println(" DAO : getBoardList() 호출 ");
				// 글정보 모두 저장하는 배열
				ArrayList reviewList = new ArrayList();
				
				try {
					// 1.2. 디비연결
					con = getConnection();
					// 3. sql 작성(select) & pstmt 객체
					sql = "select * from reviewcs asc rev_no where s_no=?";
					pstmt = con.prepareStatement(sql);
					// 4. sql 실행
					pstmt.setInt(1, dto.getS_no());
					rs = pstmt.executeQuery();
					// 5. 데이터 처리(DB->DTO->List)
					while(rs.next()) {
						
						// DB -> DTO
						
						dto.setRev_no(rs.getInt("rev_no"));
						dto.setS_no(rs.getInt("s_no"));
						dto.setRev_date(rs.getTimestamp("rev_date"));
						dto.setRev_star(rs.getInt("rev_star"));
						dto.setRev_subject(rs.getString("rev_subject"));
						dto.setRev_category(rs.getInt("rev_category"));
						dto.setM_no(rs.getInt("m_no"));
//						dto.setQna_sort(rs.getString("qna_sort"));
						dto.setRev_content(rs.getString("re_content"));
						dto.setRev_file(rs.getString("rev_file"));
						
						// DTO -> List
						reviewList.add(dto);
						
					}//while
					
					System.out.println(" DAO : 게시판 목록 저장완료! ");
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
				return reviewList;
			}
			// 글정보 가져오기 - getReviewList()
		
			// 글정보 가져오기 - getReviewList(int startRow,int pageSize)
				public ArrayList getReviewList(int startRow,int pageSize) {
					

					System.out.println(" DAO : getReviewList() 호출 ");
					// 글정보 모두 저장하는 배열
					ArrayList reviewList = new ArrayList();
					
					try {
						// 1.2. 디비연결
						con = getConnection();
						// 3. sql 작성(select) & pstmt 객체 
						sql = "select * from reviewcs " + "limit ?,?";
						pstmt = con.prepareStatement(sql);
						// ?????
						pstmt.setInt(1, startRow-1); // 시작행 - 1
						pstmt.setInt(2, pageSize); // 개수
						
						// 4. sql 실행
						rs = pstmt.executeQuery();
						// 5. 데이터 처리(DB->DTO->List)
						while(rs.next()) {
							ReviewDTO dto = new ReviewDTO();
							dto.setRev_no(rs.getInt("rev_no"));
							dto.setS_no(rs.getInt("s_no"));
							dto.setRev_date(rs.getTimestamp("rev_date"));
							dto.setRev_star(rs.getInt("rev_star"));
							dto.setRev_subject(rs.getString("rev_subject"));
							dto.setRev_category(rs.getInt("rev_category"));
							dto.setM_no(rs.getInt("m_no"));
//							dto.setQna_sort(rs.getString("qna_sort"));
							dto.setRev_content(rs.getString("rev_content"));
							dto.setRev_file(rs.getString("rev_file"));
							
							// DTO -> List
							reviewList.add(dto);
							
						}//while
						
						System.out.println(" DAO : 게시판 목록 저장완료! ");
						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						closeDB();
					}
					
					return reviewList;
				}
				// 글정보 가져오기 - getReviewList(int startRow,int pageSize)
			
				// 리뷰 조회 - getReview(rev_no)
				public ReviewDTO getReview(int rev_no) {
					ReviewDTO dto=null;
					try {
						// 1.2. 디비연결
						con = getConnection();
						// 3. sql 작성(select) & pstmt 객체
						sql = "select * from reviewcs where rev_no=?";
						pstmt = con.prepareStatement(sql);
						// ???
						pstmt.setInt(1, rev_no);
						// 4. sql 실행
						rs = pstmt.executeQuery();
						// 5. 데이터처리	
						if(rs.next()) {
							// 데이터있을때만 dto객체 생성
							dto = new ReviewDTO();
							
							// DB정보(rs) -> dto 저장
							dto.setRev_no(rs.getInt("rev_no"));
							dto.setS_no(rs.getInt("s_no"));
							dto.setRev_date(rs.getTimestamp("rev_date"));
							dto.setRev_star(rs.getInt("rev_star"));
							dto.setRev_subject(rs.getString("rev_subject"));
							dto.setRev_category(rs.getInt("rev_category"));
//							dto.setM_nickName(rs.getString("m_nickName")); 어케쓰
							//m_no?
							dto.setM_no(rs.getInt("m_no"));

//							dto.setQna_sort(rs.getString("qna_sort"));
							dto.setRev_content(rs.getString("rev_content"));
							dto.setRev_file(rs.getString("rev_file"));
							
						}
						
						System.out.println(" DAO : 글 정보 1개 저장완료! ");
							
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						closeDB();
					}
					
					return dto;
				}
				// 리뷰 조회 - getBoard(bno)
				
//				// 리뷰 수정 - updateBoard(DTO) -> 세션에 아이디값으로 구별..?
				public void updateReview(ReviewDTO dto) {
			
				try {
				// 1.2. 디비 연결
					con = getConnection();
					// 3. sql 작성(select) & pstmt 객체
					sql = "select * from reviewcs where rev_no=?";
					pstmt = con.prepareStatement(sql);
					// ???
					pstmt.setInt(1, dto.getRev_no());
					// 4. sql 실행
					rs = pstmt.executeQuery();
					// 5. 데이터 처리
						if(rs.next()) {
//							if(dto.getM_pw().equals(rs.getString("m_pw"))) { //나중에 살리기
								 //3. sql 작성(update) & pstmt 객체
								sql = "update reviewcs set rev_subject=?,rev_content=?,rev_file=?,rev_star=? where rev_no=?";
								pstmt = con.prepareStatement(sql);
								
								//??? 
								pstmt.setString(1, dto.getRev_subject());
								pstmt.setString(2, dto.getRev_content());
								pstmt.setString(3, dto.getRev_file()); //이거 아닐지도
								pstmt.setInt(4, dto.getRev_star());
								pstmt.setInt(5, dto.getRev_no());
								
								
						}
						
						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						closeDB();
					}
					
				}
				// 리뷰 수정 - updateReview(DTO)
				
//					private Object getAttribute(String string) {
//					// TODO Auto-generated method stub
//					return null;
//				}

				// 리뷰 삭제 - deleteReview(s_no,pass)
				public void deleteReview(int rev_no) {
					
					try {
						// 1.2. 디비 연결
						con = getConnection();
						// 3. sql 작성(select) & pstmt 객체
						sql = "delete from reviewcs where rev_no=?";
						pstmt = con.prepareStatement(sql);
						// ???
						pstmt.setInt(1, rev_no);
						// 4. sql 실행
						pstmt.executeUpdate();
						// 5. 데이터 처리
						
						
						System.out.println(" DAO : 글삭 완료");
						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						closeDB();
					}
					
				}
				 //게시판 글 삭제 - deleteReview(s_no,pass)
}
