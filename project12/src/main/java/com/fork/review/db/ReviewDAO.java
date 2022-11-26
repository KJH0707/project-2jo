package com.fork.review.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
						+ "rev_category,m_no,rev_content,rev_file,rev_ref,rev_seq) "
						+ "values(?,?,now(),?,?,?,?,?,?,?,?)";
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
				pstmt.setInt(9, rev_no); //ref = rev_no
				pstmt.setInt(10, 0); //seq 0 
				
				
				// 4. 
				pstmt.executeUpdate();
				
				sql="update store A set s_star=("
						+ "select avg(rev_star) "
						+ "from reviewcs B "
						+ "where A.s_no=B.s_no) "
						+ "where A.s_no=? and (s_star != 0 or s_star != null)";
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
		
		
		
		
		// 글 전체 개수 확인 - getReviewCount()
		public int getReviewCount(int s_no) {
			int cnt = 0;
			
			try {
				//1.2. 디비연결
				con = getConnection();
				// 3. sql
				sql = "select count(*) "
						+ "from reviewcs A, store B, member C "
						+ "where A.s_no = B.s_no "
						+ "and A.m_no = C.m_no "
						+ "and A.rev_category=1 "
						+ "and B.s_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, s_no);
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
		
	
		
			// 글정보 가져오기 - getReviewList(int startRow,int pageSize)
				public List<Map> getReviewList(int startRow,int pageSize,int s_no) {
					

					System.out.println(" DAO : getReviewList() 호출 ");
					// 글정보 모두 저장하는 배열
					List<Map> reviewList = new ArrayList<Map>();
					HashMap<String,Object> hm = null;
					
					try {
						// 1.2. 디비연결
						con = getConnection();
						
						
						sql = "select rev_subject, rev_content, rev_star, s_name, m_nickname, s_readcount, rev_date, rev_file, rev_no, m_id "
								+ "from reviewcs A, store B, member C "
								+ "where A.s_no = B.s_no "
								+ "and A.m_no = C.m_no "
								+ "and A.rev_category=1 "
								+ "and B.s_no=? limit ?,?";
						pstmt = con.prepareStatement(sql);
						// ?????
						pstmt.setInt(1, s_no);
						pstmt.setInt(2, startRow-1); // 시작행 - 1
						pstmt.setInt(3, pageSize); // 개수
						
						// 4. sql 실행
						rs = pstmt.executeQuery();
						// 5. 데이터 처리(DB->DTO->List)
						while(rs.next()) {
							hm = new HashMap<String,Object>();
							hm.put("rev_subject",rs.getString("rev_subject"));
							hm.put("rev_content",rs.getString("rev_content"));
							hm.put("rev_star",rs.getDouble("rev_star"));
							hm.put("s_name",rs.getString("s_name"));
							hm.put("m_nickname",rs.getString("m_nickname"));
							hm.put("s_readcount",rs.getString("s_readcount"));
							hm.put("rev_date",rs.getTimestamp("rev_date"));
							hm.put("rev_file",rs.getString("rev_file"));
							hm.put("rev_no", rs.getInt("rev_no"));
							hm.put("m_id",rs.getString("m_id"));
							reviewList.add(hm);
							
							
						}//while
						System.out.println(reviewList);
						System.out.println(" DAO : 게시판 목록 저장완료!");
						
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
				// 리뷰 조회 - 
				
//				// 리뷰 수정 - updateReview(DTO) -> 세션에 아이디값으로 구별..?
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
								
								System.out.println(dto.getRev_content());
								//??? 
								pstmt.setString(1, dto.getRev_subject());
								pstmt.setString(2, dto.getRev_content());
								pstmt.setString(3, dto.getRev_file());
								pstmt.setInt(4, dto.getRev_star());
								pstmt.setInt(5, dto.getRev_no());
								
								
								pstmt.executeUpdate();
								
								
								sql="update store A set s_star=("
										+ "select avg(rev_star) "
										+ "from reviewcs B "
										+ "where A.s_no=B.s_no) "
										+ "where A.s_no=? and s_star != 0";
								pstmt = con.prepareStatement(sql);
								pstmt.setInt(1,dto.getS_no());
								
								pstmt.executeUpdate();
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

				// 리뷰 삭제 - deleteReview(rev_no)
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
				
				// 답글쓰기 - replyReview(DTO)
				public void replyReview(ReviewDTO dto) {
					int rev_no = 0;
					
					try {
						/////////////////////////////////
						//1. 답글번호 계산하기(rev_no)
						
						// 1.2. 디비연결
						con = getConnection();
						// 3. sql 작성(select) & pstmt 객체
						sql = "select max(rev_no) from reviewcs";
						pstmt = con.prepareStatement(sql);
						// 4. sql 실행
						rs = pstmt.executeQuery();
						// 5. 데이터 처리
						if(rs.next()) {
							rev_no = rs.getInt(1)+1;
							//bno = rs.getInt("max(bno)")+1;
						}
						
						System.out.println(" DAO : 답글 번호(rev_no) "+rev_no+"@@@@@@@@@@@@@@@@@@@@@@@@@");
						
						/////////////////////////////////
						//2. 답글 순서 재배치
						
						// 3. sql 작성(update) & pstmt 객체
						// => 같은 그룹에 있으면서, 기존의 seq 값보다 큰값이 있을때
						sql = "update reviewcs set rev_seq = rev_seq+1 "
								+ "where rev_ref=? and rev_seq>?";
						pstmt = con.prepareStatement(sql);
						// ???
						pstmt.setInt(1, dto.getRev_ref());
						pstmt.setInt(2, dto.getRev_seq());
						// 4. sql 실행
						int cnt = pstmt.executeUpdate();
						// => cnt(update 구문이 적용된 수)
						if(cnt > 0) {
							System.out.println(" DAO : 답글 재정렬 완료! ");
						}
						
						
						
						
						sql = "insert into reviewcs(rev_no,s_no,rev_date,rev_star,rev_subject,"
								+ "rev_category,m_no,rev_content,rev_file,rev_ref,rev_seq) "
								+ "values(?,?,now(),?,?,?,?,?,?,?,?)";
//						sql = "insert into reviewcs(rev_no,s_no,rev_date,rev_subject,rev_content) values(?,?,now(),?,?)";
//								+ "values(?,now(),?,?,?,?,?,?,?,?)";
						
						pstmt = con.prepareStatement(sql);
						
						// ???
						pstmt.setInt(1, rev_no); //리뷰번호
						pstmt.setInt(2, dto.getS_no()); //가게 번호
						pstmt.setInt(3, dto.getRev_star()); //리뷰별점
						pstmt.setString(4, dto.getRev_subject()); //리뷰 제목
//						pstmt.setString(5, dto.getQna_sort()); 
						pstmt.setInt(5, 1); //리뷰카테고리?머고   0(문의) 1(리뷰) 
						pstmt.setInt(6, dto.getM_no()); //멤버번호
						pstmt.setString(7, dto.getRev_content());
						pstmt.setString(8, dto.getRev_file());
						pstmt.setInt(9, dto.getRev_ref()); //ref = rev_no
						pstmt.setInt(10, dto.getRev_seq()+1); //seq 0 
						// 4. sql 실행
						pstmt.executeUpdate();
						
						System.out.println(" DAO : 답글 쓰기 완료! ");
						/////////////////////////////////
								
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						closeDB();
					}
					
				}
				// 답글쓰기 - replyReview(DTO)
		public int isMine(String id, int s_no) {
			int result=0;
			try {
				con=getConnection();
				
				sql="select s_no from store A, ceo B where A.c_no=B.c_no and B.c_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				
				while (rs.next()) {
					if(rs.getInt("s_no")==s_no) {
						result=1;
					}
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return result;
		}
		
}
