package com.fork.user.db;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.*;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.fork.store.db.StoreDTO;

public class UserDAO {

	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	
	// DB 연결메서드(커넥션풀)
			private Connection getConnection() throws Exception {
				
				// 1. 드라이버 로드 	// 2. DB 연결
				
				// Context 객체 생성(JNDI API)
				// 형변환이 필요없으므로 업캐스팅 관계(상속관계)인 것을 알 수 있음
				Context initCTX = new InitialContext(); 
				
				// DB 연동 정보 불러오기(context.xml 파일정보)
				// 다운캐스팅
				DataSource ds = (DataSource)initCTX.lookup("java:comp/env/jdbc/project12");
				
				// DB 정보(연결) 불러오기
				con = ds.getConnection();
				
				System.out.println(" DAO : 디비연결 성공(커넥션풀) ");
				System.out.println(" DAO : con : "+con);
				
			return con;
			}
					
			// 자원해제 메서드-closeDB()
			public void closeDB() {
				System.out.println(" DAO : DB 연결자원 해제");
				
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} // 자원해제 메서드-closeDB()
			
			// 회원가입 - memberJoin(DTO)
			/**
			 * 회원가입 메서드, 실행할 때 회원정보(DTO) 받아서 사용
			 * 리턴 X
			 * @param dto
			 * @param hid
			 */
			public void memberJoin(MemberDTO dto) {
				int m_no = 0;
				
				try {
					con = getConnection();
					
					sql = "select max(m_no) from member";
					pstmt = con.prepareStatement(sql);
					
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						m_no = rs.getInt(1)+1;
					} // 회원번호 증가
					
					System.out.println(" DAO : m_no : " + m_no);
					
					// 회원가입
					sql = "insert into member(m_no,m_id,m_name,m_email,m_nickname,m_pw) "
							+ "values(?,?,?,?,?,?)";
					pstmt = con.prepareStatement(sql);
					
					// ??
					pstmt.setInt(1, m_no);
					pstmt.setString(2, dto.getM_id());
					pstmt.setString(3, dto.getM_name());
					pstmt.setString(4, dto.getM_email());
					pstmt.setString(5, dto.getM_nickName());
					pstmt.setString(6, dto.getM_pw());
					
					int result = pstmt.executeUpdate();
					
					if(result > 0 ) {
						System.out.println(" DAO : 회원가입 성공! ");
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}

			} // 회원가입 - memberJoin(DTO)
			
			// 아이디 중복확인 - checkId(id)
			/**
			 * 아이디 중복확인 메서드, 실행할 때(id) 받아서 사용
			 * 리턴값 있음. 1-중복, 0-중복x
			 * @param id
			 * @return
			 */
			public int checkId(String id) {
				int result=0;
				
				try {
					con = getConnection();
					
					sql = "select c_pw pw from ceo where c_id=? union "
							+ "select m_pw from member where m_id=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, id);
					pstmt.setString(2, id);
					
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						result = 1;  // 이미 존재, 생성 불가
						
						System.out.println(" DAO : 아이디 중복결과 ("+result+")");
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				} closeDB();
				
				return result;
			} // 아이디 중복확인 - checkId(id)
			
			
//			public int checkNick(String nick) {
//				int result=0;
//				
//				try {
//					con = getConnection();
//					
//					sql = "select c_pw pw from sto where c_nickName=? union "
//							+ "select m_pw from mem where m_nickName=?";
//					pstmt = con.prepareStatement(sql);
//					
//					pstmt.setString(1, nick);
//					pstmt.setString(2, nick);
//					
//					rs = pstmt.executeQuery();
//					
//					if(rs.next() || nick.equals("")) {
//						result = 1;  // 이미 존재, 생성 불가
//						
//						System.out.println(" DAO : 닉네임 중복결과 ("+result+")");
//					}
//					
//				} catch (Exception e) {
//					e.printStackTrace();
//				} closeDB();
//				
//				return result;
//			}
			
			
			public int checkNick(String nick) {
				int result=0;
				
				try {
					con = getConnection();
					
					sql = "select m_pw from member where m_nickName=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, nick);
					
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						result = 1;  // 이미 존재, 생성 불가
						
						System.out.println(" DAO : 닉네임 중복결과 ("+result+")");
					} else {
						sql = "select c_pw from ceo where c_nickName=?";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setString(1, nick);
						
						rs = pstmt.executeQuery();
						
						if(rs.next() || nick.equals("")) {
							result = 1;  // 이미 존재, 생성 불가
							
							System.out.println(" DAO : 닉네임 중복결과 ("+result+")");
						}
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				} closeDB();
				
				return result;
			}
			
			
			public int checkEmail(String email) {
				int result=0;
				
				try {
					con = getConnection();
					
					sql = "select m_pw from member where m_email=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, email);
					
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						result = 1;  // 이미 존재, 생성 불가
						
						System.out.println(" DAO : 이메일 중복결과 ("+result+")");
					} else {
						sql = "select c_pw from ceo where c_Email=?";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setString(1, email);
						
						rs = pstmt.executeQuery();
						
						if(rs.next()) {
							result = 1;  // 이미 존재, 생성 불가
							
							System.out.println(" DAO : 이메일 중복결과 ("+result+")");
						}
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				} closeDB();
				
				return result;
			}
			
			// 멤버 로그인 memberLogin
			public int memberLogin(String id, String pw) {
				int result = -1;
				
				try {
					// 1.2. 디비연결
					con = getConnection();
					// 3. sql & pstmt
					sql = "select m_pw from member where m_id=?";
					pstmt = con.prepareStatement(sql);
					//???
					pstmt.setString(1, id);
					
					// 4. sql 실행
					rs = pstmt.executeQuery();
					// 5. 데이터처리
					
					if(rs.next()) {
						// 회원
						if(pw.equals(rs.getString("m_pw"))) {
							// 로그인 성공
							result = 1;
						}else {
							// 로그인 실패
							result = 0;
						}
					}else {
						// 비회원
						result = -1;
					}
					System.out.println(" DAO : 로그인 체크 ("+result+")");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
				return result;
			}
			// 멤버 로그인 memberLogin end
			
			// 어드민 가게목록불러오기 getStoreList start
			public List<Map> adminGetBoardList(int startRow, int pageSize) {
				System.out.println(" DAO : getBoardList() 호출 ");
				// 글정보 모두 저장하는 배열
				List<Map> boardList = new ArrayList<Map>();
				HashMap<String,Object> hm = null;
				
				try {
				// 1.2. 디비 연결
					con = getConnection();
				// 3. sql 작성(select) & pstmt 객체
//					sql = "select * from itwill_board";
					sql = "select * from store A inner join ceo B on A.c_no = B.c_no limit ?,?; ";
					pstmt = con.prepareStatement(sql);
				// ?????
					pstmt.setInt(1, startRow-1); // 시작행-1
					pstmt.setInt(2, pageSize); // 개수
				// 4. sql 실행
					rs = pstmt.executeQuery();
				// 5. 데이터 처리 (DB -> DTO -> List)
					while(rs.next()) {
						// DB -> DTO
						hm = new HashMap<String,Object>();
						hm.put("c_no", rs.getInt("c_no"));
						hm.put("c_name", rs.getString("c_name"));
						hm.put("s_image", rs.getString("s_image"));
						hm.put("s_name", rs.getString("s_name"));
						hm.put("s_no", rs.getLong("s_no"));
						hm.put("s_type", rs.getString("s_type"));
						hm.put("s_number",rs.getInt("s_number"));
						hm.put("s_addr",rs.getString("s_addr"));
						hm.put("s_regdate", rs.getTimestamp("s_regdate"));
						//DTO -> List
						
						boardList.add(hm);
					}//while
					System.out.println(boardList);
					System.out.println(" DAO : 게시판 목록 저장완료!");
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeDB();
				}
				
				return boardList;
			}
			
			// 어드민 가게 목록 불러오기 getStoreList end
			
			// 어드민 가게 삭제하기 
			public void adminDeleteStore(int s_no) {			
				try {
					con = getConnection();
					
					sql = "select * from store where s_no=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, s_no);
					pstmt.executeQuery();
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						sql = "delete from store where s_no=?";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setInt(1, s_no);
						pstmt.executeUpdate();
					}
					
					
					System.out.println(" DAO : 회원삭제 완료");
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
			
			}
			// 어드민 가게 삭제하기
			// 어드민 가게 삭제하기 
				public void adminResDelete(int res_no) {			
					try {
						con = getConnection();
						
						sql = "select * from reservation where res_no=?";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setInt(1, res_no);
						pstmt.executeQuery();
						rs = pstmt.executeQuery();
						
						if(rs.next()) {
							sql = "delete from reservation where res_no=?";
							pstmt = con.prepareStatement(sql);
							
							pstmt.setInt(1, res_no);
							pstmt.executeUpdate();
						}
						
						
						System.out.println(" DAO : 회원삭제 완료");
						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						closeDB();
					}
					
				
				}
						// 어드민 가게 삭제하기			
			// 어드민 일반 회원 목록 불러오기 getGenMemList, General
			
			public ArrayList adminGetGenMemList(int startRow, int pageSize) {
				System.out.println(" DAO : getBoardList() 호출 ");
				// 글정보 모두 저장하는 배열
				ArrayList memList = new ArrayList();
				
				try {
				// 1.2. 디비 연결
					con = getConnection();
				// 3. sql 작성(select) & pstmt 객체
//					sql = "select * from itwill_board";
					sql = "select * from member " + "limit ?,? ";
					pstmt = con.prepareStatement(sql);
				// ?????
					pstmt.setInt(1, startRow-1); // 시작행-1
					pstmt.setInt(2, pageSize); // 개수
				// 4. sql 실행
					rs = pstmt.executeQuery();
				// 5. 데이터 처리 (DB -> DTO -> List)
					while(rs.next()) {
						// DB -> DTO
						MemberDTO dto = new MemberDTO();
						
						dto.setM_no(rs.getInt("m_no"));
						dto.setM_id(rs.getString("m_id"));
						dto.setM_nickName(rs.getString("m_nickname"));
						dto.setM_email(rs.getString("m_email"));
						dto.setM_gender(rs.getString("m_gender"));
						dto.setM_tel(rs.getString("m_tel"));
						dto.setM_birth(rs.getString("m_birth"));
						dto.setM_regdate(rs.getTimestamp("m_regdate"));
						dto.setM_name(rs.getString("m_name"));
						
						memList.add(dto);
					}//while
					
					System.out.println(" DAO : 게시판 목록 저장완료!"+memList);
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeDB();
				}
				
				return memList;
			}
			
			// 어드민 일반 회원 목록 불러오기 getGenMemList, General
			
			// 어드민 일반 회원 목록 불러오기 getGenMemList, General
			
			public ArrayList adminGetGenMemList(int startRow,int pageSize,String m_id) {
				System.out.println(" DAO : getBoardList() 호출 ");
				// 글정보 모두 저장하는 배열
				ArrayList memList = new ArrayList();
				
				try {
				// 1.2. 디비 연결
					con = getConnection();
				// 3. sql 작성(select) & pstmt 객체
//								sql = "select * from itwill_board";
					sql = "select * from member where m_id Like ? limit ?,?";
					pstmt = con.prepareStatement(sql);
				// ?????
					pstmt.setString(1, m_id); // 시작행-1
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, pageSize);
					// 개수
				// 4. sql 실행
					rs = pstmt.executeQuery();
				// 5. 데이터 처리 (DB -> DTO -> List)
					while(rs.next()) {
						// DB -> DTO
						MemberDTO dto = new MemberDTO();
						
						dto.setM_no(rs.getInt("m_no"));
						dto.setM_id(rs.getString("m_id"));
						dto.setM_nickName(rs.getString("m_nickname"));
						dto.setM_email(rs.getString("m_email"));
						dto.setM_gender(rs.getString("m_gender"));
						dto.setM_tel(rs.getString("m_tel"));
						dto.setM_birth(rs.getString("m_birth"));
						dto.setM_regdate(rs.getTimestamp("m_regdate"));
						dto.setM_name(rs.getString("m_name"));
						
						memList.add(dto);
					}//while
					
					System.out.println(" DAO : 게시판 목록 저장완료!"+memList);
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeDB();
				}
				
				return memList;
			}
						
			public int adminCntGetGenMemList(int startRow,int pageSize,String m_id) {
				System.out.println(" DAO : getBoardList() 호출 ");
				// 글정보 모두 저장하는 배열
				
				int cnt =0;
				try {
				// 1.2. 디비 연결
					con = getConnection();
				// 3. sql 작성(select) & pstmt 객체
//								sql = "select * from itwill_board";
					sql = "select count(*) from member where m_id Like ? limit ?,?";
					pstmt = con.prepareStatement(sql);
				// ?????
					pstmt.setString(1, m_id); // 시작행-1
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, pageSize);
					// 개수
				// 4. sql 실행
					rs = pstmt.executeQuery();
				// 5. 데이터 처리 (DB -> DTO -> List)
					if(rs.next()) {
						// DB -> DTO
						cnt = rs.getInt(1);
					}//while
					
					
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeDB();
				}
				
				return cnt;
			}			
						// 어드민 일반 회원 목록 불러오기 getGenMemList, General
			
			// 일반 회원 수 카운트 getGenMemCount
			public int getGenMemCount() {
				int cnt = 0;
				
				// 1.2. 디비연결
				try {
					con = getConnection();
					// 3. sql
					sql = "select count(*) from member";
					pstmt = con.prepareStatement(sql);
					
					// 4. sql 실행
					rs = pstmt.executeQuery();
					// 5. 데이터처리
					if(rs.next()) {
						
//						cnt = rs.getInt(count(*));
						cnt = rs.getInt("count(*)");
					}
					System.out.println(" DAO : 전체 일반 회원 수 : " +cnt+"개");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
				return cnt;
			}
			
			// 일반 회원 수 카운트 getGenMemCount
			
			// 어드민 일반 회원 삭제
			public void AdminDeleteGenMem(int m_no) {			
				try {
					con = getConnection();
					
					sql = "select * from member where m_no=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, m_no);
					pstmt.executeQuery();
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						sql = "delete from member where m_no=?";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setInt(1, m_no);
						pstmt.executeUpdate();
					}
					
					
					System.out.println(" DAO : 회원삭제 완료");
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
			
			}
			// 어드민 일반 회원 삭제
			
			// 어드민 점주 회원 갯수 카운트
			public int getCeoMemCount() {
				int cnt = 0;
				
				// 1.2. 디비연결
				try {
					con = getConnection();
					// 3. sql
					sql = "select count(*) from ceo";
					pstmt = con.prepareStatement(sql);
					
					// 4. sql 실행
					rs = pstmt.executeQuery();
					// 5. 데이터처리
					if(rs.next()) {
						
//						cnt = rs.getInt(count(*));
						cnt = rs.getInt("count(*)");
					}
					System.out.println(" DAO : 전체 일반 회원 수 : " +cnt+"개");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
				return cnt;
			}
			// 어드민 점주 회원 갯수 카운트
			
			// 어드민 점주 회원 갯수 카운트
			public int getReservCount() {
				int cnt = 0;
				
				// 1.2. 디비연결
				try {
					con = getConnection();
					// 3. sql
					sql = "select count(*) from reservation";
					pstmt = con.prepareStatement(sql);
					
					// 4. sql 실행
					rs = pstmt.executeQuery();
					// 5. 데이터처리
					if(rs.next()) {
						
//									cnt = rs.getInt(count(*));
						cnt = rs.getInt("count(*)");
					}
					System.out.println(" DAO : 전체 일반 회원 수 : " +cnt+"개");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
				return cnt;
			}
			// 어드민 점주 회원 갯수 카운트
			
			// 어드민 점주 회원 갯수 카운트
			public int getPaymentCount() {
				int cnt = 0;
				
				// 1.2. 디비연결
				try {
					con = getConnection();
					// 3. sql
					sql = "select count(*) from payment";
					pstmt = con.prepareStatement(sql);
					
					// 4. sql 실행
					rs = pstmt.executeQuery();
					// 5. 데이터처리
					if(rs.next()) {
						
//												cnt = rs.getInt(count(*));
						cnt = rs.getInt("count(*)");
					}
					System.out.println(" DAO : 전체 일반 회원 수 : " +cnt+"개");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
				return cnt;
			}
			// 어드민 점주 회원 갯수 카운트
			
			// 어드민 점주 회원리스트 받기
			
			public ArrayList adminGetCeoMemList(int startRow, int pageSize) {
				System.out.println(" DAO : getBoardList() 호출 ");
				// 글정보 모두 저장하는 배열
				ArrayList memList = new ArrayList();
				
				try {
				// 1.2. 디비 연결
					con = getConnection();
				// 3. sql 작성(select) & pstmt 객체
//					sql = "select * from itwill_board";
					sql = "select * from ceo " + "limit ?,? ";
					pstmt = con.prepareStatement(sql);
				// ?????
					pstmt.setInt(1, startRow-1); // 시작행-1
					pstmt.setInt(2, pageSize); // 개수
				// 4. sql 실행
					rs = pstmt.executeQuery();
				// 5. 데이터 처리 (DB -> DTO -> List)
					while(rs.next()) {
						// DB -> DTO
						CeoDTO dto = new CeoDTO();
						
						dto.setC_no(rs.getInt("c_no"));
						dto.setC_id(rs.getString("c_id"));
						dto.setC_nickName(rs.getString("c_nickname"));
						dto.setC_email(rs.getString("c_email"));
						dto.setC_name(rs.getString("c_name"));
						dto.setC_tel(rs.getString("c_tel"));
						
						dto.setC_regdate(rs.getTimestamp("c_regdate"));
						
						memList.add(dto);
					}//while
					
					System.out.println(" DAO : 게시판 목록 저장완료!"+memList);
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeDB();
				}
				
				return memList;
			}
			
			// 어드민 점주 회원리스트 받기
			
			// 어드민 점주 회원리스트 받기
			
			public ArrayList adminGetCeoMemList(int startRow, int pageSize, String c_id) {
				System.out.println(" DAO : getBoardList() 호출 ");
				// 글정보 모두 저장하는 배열
				ArrayList memList = new ArrayList();
				
				try {
				// 1.2. 디비 연결
					con = getConnection();
				// 3. sql 작성(select) & pstmt 객체
//								sql = "select * from itwill_board";
					sql = "select * from ceo where c_id Like ? limit ?,?";
					pstmt = con.prepareStatement(sql);
				// ?????
					pstmt.setString(1, c_id); // 시작행-1
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, pageSize);
				// 4. sql 실행
					rs = pstmt.executeQuery();
				// 5. 데이터 처리 (DB -> DTO -> List)
					while(rs.next()) {
						// DB -> DTO
						CeoDTO dto = new CeoDTO();
						
						dto.setC_no(rs.getInt("c_no"));
						dto.setC_id(rs.getString("c_id"));
						dto.setC_nickName(rs.getString("c_nickname"));
						dto.setC_email(rs.getString("c_email"));
						dto.setC_name(rs.getString("c_name"));
						dto.setC_tel(rs.getString("c_tel"));
						
						dto.setC_regdate(rs.getTimestamp("c_regdate"));
						
						memList.add(dto);
					}//while
					
					System.out.println(" DAO : 게시판 목록 저장완료!"+memList);
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeDB();
				}
				
				return memList;
			}
						
			
			public int adminCntGetCeoMemList(int startRow, int pageSize,String c_id) {
				System.out.println(" DAO : getBoardList() 호출 ");
				// 글정보 모두 저장하는 배열
				int cnt=0;
				
				try {
				// 1.2. 디비 연결
					con = getConnection();
				// 3. sql 작성(select) & pstmt 객체
//								sql = "select * from itwill_board";
					sql = "select count(*) from ceo where c_id Like ? limit ?,?";
					pstmt = con.prepareStatement(sql);
				// ?????
					pstmt.setString(1, c_id); // 시작행-1
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, pageSize);
					
				// 4. sql 실행
					rs = pstmt.executeQuery();
				// 5. 데이터 처리 (DB -> DTO -> List)
					if(rs.next()) {
						// DB -> DTO
						cnt = rs.getInt(1);
					}//while
					
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeDB();
				}
				
				return cnt;
			}			
						// 어드민 점주 회원리스트 받기
			
			// 어드민 점주 삭제
			public void adminDeleteCeoMem(int c_no) {			
				try {
					con = getConnection();
					
					sql = "select * from ceo where c_no=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, c_no);
					pstmt.executeQuery();
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						sql = "delete from ceo where c_no=?";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setInt(1, c_no);
						pstmt.executeUpdate();
					}
					
					
					System.out.println(" DAO : 회원삭제 완료");
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
			
			}
			// 어드민 점주 삭제
			
			// 어드민 신고 갯수 조회
			public int getReportCount() {
				int cnt = 0;
				
				// 1.2. 디비연결
				try {
					con = getConnection();
					// 3. sql
					sql = "select count(*) from report";
					pstmt = con.prepareStatement(sql);
					
					// 4. sql 실행
					rs = pstmt.executeQuery();
					// 5. 데이터처리
					if(rs.next()) {
						
//						cnt = rs.getInt(count(*));
						cnt = rs.getInt("count(*)");
					}
					System.out.println(" DAO : 전체 일반 회원 수 : " +cnt+"개");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
				return cnt;
			}
			// 어드민 신고 갯수 조회
			
			// 어드민 신고 갯수 조회
			public int getReportCount(int m_no) {
				int cnt = 0;
				
				// 1.2. 디비연결
				try {
					con = getConnection();
					// 3. sql
					sql = "select count(*) from report where m_no=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, m_no);
					
					// 4. sql 실행
					rs = pstmt.executeQuery();
					// 5. 데이터처리
					if(rs.next()) {
						
//									cnt = rs.getInt(count(*));
						cnt = rs.getInt("count(*)");
					}
					System.out.println(" DAO : 전체 일반 회원 수 : " +cnt+"개");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
				return cnt;
			}
			// 어드민 신고 갯수 조회
			
			// 어드민 신고 목록 조히
			public List<Map> adminGetReportList(int startRow, int pageSize) {
				System.out.println(" DAO : getBoardList() 호출 ");
				// 글정보 모두 저장하는 배열
				List<Map> reportList = new ArrayList<Map>();
				HashMap<String,Object> hm = null;
				
				try {
				// 1.2. 디비 연결
					con = getConnection();
				// 3. sql 작성(select) & pstmt 객체
//					sql = "select * from itwill_board";
					sql = "SELECT r.rep_no, s.s_name,c.c_name, m.m_id, m.m_name, r.rep_reason, r.rep_howmany, r.rep_date "
							+ "FROM report r, member m, store s, ceo c "
							+ "where r.s_no = s.s_no "
							+ "and r.m_no = m.m_no "
							+ "and s.c_no = c.c_no limit ?,?;";
					pstmt = con.prepareStatement(sql);
				// ?????
					pstmt.setInt(1, startRow-1); // 시작행-1
					pstmt.setInt(2, pageSize); // 개수
				// 4. sql 실행
					rs = pstmt.executeQuery();
				// 5. 데이터 처리 (DB -> DTO -> List)
					while(rs.next()) {
						// DB -> DTO
						hm = new HashMap<String,Object>();
						hm.put("rep_no", rs.getInt("rep_no"));
						hm.put("s_name", rs.getString("s_name"));
						hm.put("c_name", rs.getString("c_name"));
						hm.put("m_id", rs.getString("m_id"));
						hm.put("m_name", rs.getString("m_name"));
						hm.put("rep_reason",rs.getString("rep_reason"));
						hm.put("rep_howmany",rs.getInt("rep_howmany"));
						hm.put("rep_date", rs.getTimestamp("rep_date"));
						//DTO -> List
						
						reportList.add(hm);
					}//while
					System.out.println(reportList);
					System.out.println(" DAO : 게시판 목록 저장완료!");
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeDB();
				}
				
				return reportList;
			}
			// 어드민 신고 목록 조회
			
			// 어드민 신고 목록 조히
			public List<Map> adminGetReportList(int startRow, int pageSize, int m_no) {
				System.out.println(" DAO : getBoardList() 호출 ");
				// 글정보 모두 저장하는 배열
				List<Map> reportList = new ArrayList<Map>();
				HashMap<String,Object> hm = null;
				
				try {
				// 1.2. 디비 연결
					con = getConnection();
				// 3. sql 작성(select) & pstmt 객체
	//								sql = "select * from itwill_board";
					sql = "SELECT r.rep_no, s.s_name,c.c_name, m.m_id, m.m_name, r.rep_reason, r.rep_howmany, r.rep_date "
							+ "FROM report r, member m, store s, ceo c "
							+ "where r.s_no = s.s_no "
							+ "and r.m_no = m.m_no "
							+ "and s.c_no = c.c_no "
							+ "and m.m_no=? limit ?,?;";
					pstmt = con.prepareStatement(sql);
				// ?????
					pstmt.setInt(1, m_no);
					pstmt.setInt(2, startRow-1); // 시작행-1
					pstmt.setInt(3, pageSize); // 개수
				// 4. sql 실행
					rs = pstmt.executeQuery();
				// 5. 데이터 처리 (DB -> DTO -> List)
					while(rs.next()) {
						// DB -> DTO
						hm = new HashMap<String,Object>();
						hm.put("rep_no", rs.getInt("rep_no"));
						hm.put("s_name", rs.getString("s_name"));
						hm.put("c_name", rs.getString("c_name"));
						hm.put("m_id", rs.getString("m_id"));
						hm.put("m_name", rs.getString("m_name"));
						hm.put("rep_reason",rs.getString("rep_reason"));
						hm.put("rep_howmany",rs.getInt("rep_howmany"));
						hm.put("rep_date", rs.getTimestamp("rep_date"));
						//DTO -> List
						
						reportList.add(hm);
					}//while
					System.out.println(reportList);
					System.out.println(" DAO : 게시판 목록 저장완료!");
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeDB();
				}
				
				return reportList;
			}
			// 어드민 신고 목록 조회 with m_no
			
			public List<Map> adminGetReportList(int startRow, int pageSize, String keyword) {
				System.out.println(" DAO : getBoardList() 호출 ");
				// 글정보 모두 저장하는 배열
				List<Map> reportList = new ArrayList<Map>();
				HashMap<String,Object> hm = null;
				
				try {
				// 1.2. 디비 연결
					con = getConnection();
				// 3. sql 작성(select) & pstmt 객체
	//								sql = "select * from itwill_board";
					sql = "SELECT r.rep_no, s.s_name,c.c_name, m.m_id, m.m_name, r.rep_reason, r.rep_howmany, r.rep_date "
							+ "FROM report r, member m, store s, ceo c "
							+ "where r.s_no = s.s_no "
							+ "and r.m_no = m.m_no "
							+ "and s.c_no = c.c_no "
							+ "and (s.s_name Like ? "
							+ "or m.m_name Like ?) limit ?,?;";
					pstmt = con.prepareStatement(sql);
				// ?????
					pstmt.setString(1, keyword);
					pstmt.setString(2, keyword);
					pstmt.setInt(3, startRow-1); // 시작행-1
					pstmt.setInt(4, pageSize); // 개수
				// 4. sql 실행
					rs = pstmt.executeQuery();
				// 5. 데이터 처리 (DB -> DTO -> List)
					while(rs.next()) {
						// DB -> DTO
						hm = new HashMap<String,Object>();
						hm.put("rep_no", rs.getInt("rep_no"));
						hm.put("s_name", rs.getString("s_name"));
						hm.put("c_name", rs.getString("c_name"));
						hm.put("m_id", rs.getString("m_id"));
						hm.put("m_name", rs.getString("m_name"));
						hm.put("rep_reason",rs.getString("rep_reason"));
						hm.put("rep_howmany",rs.getInt("rep_howmany"));
						hm.put("rep_date", rs.getTimestamp("rep_date"));
						//DTO -> List
						
						reportList.add(hm);
					}//while
					System.out.println(reportList);
					System.out.println(" DAO : 게시판 목록 저장완료!");
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeDB();
				}
				
				return reportList;
			}
			
			public int adminCntGetReportList(int startRow, int pageSize, String keyword) {
				System.out.println(" DAO : getBoardList() 호출 ");
				// 글정보 모두 저장하는 배열
				int cnt=0;
				
				try {
				// 1.2. 디비 연결
					con = getConnection();
				// 3. sql 작성(select) & pstmt 객체
	//								sql = "select * from itwill_board";
					sql = "SELECT count(*)"
							+ "FROM report r, member m, store s, ceo c "
							+ "where r.s_no = s.s_no "
							+ "and r.m_no = m.m_no "
							+ "and s.c_no = c.c_no "
							+ "and (s.s_name Like ? "
							+ "or m.m_name Like ?) limit ?,?;";
					pstmt = con.prepareStatement(sql);
				// ?????
					pstmt.setString(1, keyword);
					pstmt.setString(2, keyword);
					pstmt.setInt(3, startRow-1); // 시작행-1
					pstmt.setInt(4, pageSize); // 개수
				// 4. sql 실행
					rs = pstmt.executeQuery();
				// 5. 데이터 처리 (DB -> DTO -> List)
					if(rs.next()) {
						// DB -> DTO
						cnt = rs.getInt(1);
					}//while
					
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeDB();
				}
				
				return cnt;
			}
			
			
			// 어드민 신고 삭제
			public void adminDeleteReport(int rep_no) {			
				try {
					con = getConnection();
					
					sql = "select * from report where rep_no=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, rep_no);
					pstmt.executeQuery();
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						sql = "delete from report where rep_no=?";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setInt(1, rep_no);
						pstmt.executeUpdate();
					}
					
					
					System.out.println(" DAO : 회원삭제 완료");
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
			
			}
			// 어드민 신고 삭제
			
			// 어드민 공지 목록
			
			public ArrayList adminGetNoticeList(int startRow, int pageSize, int isE) {
				System.out.println(" DAO : getBoardList() 호출 ");
				// 글정보 모두 저장하는 배열
				ArrayList noticeList = new ArrayList();
				
				try {
				// 1.2. 디비 연결
					con = getConnection();
				// 3. sql 작성(select) & pstmt 객체
//					sql = "select * from itwill_board";
					sql = "select * from notice where n_isEvent=? limit ?,?";
					pstmt = con.prepareStatement(sql);
				// ?????
					pstmt.setInt(1, isE);
					pstmt.setInt(2, startRow-1); // 시작행-1
					pstmt.setInt(3, pageSize); // 개수
				// 4. sql 실행
					rs = pstmt.executeQuery();
				// 5. 데이터 처리 (DB -> DTO -> List)
					while(rs.next()) {
						// DB -> DTO
						NoticeDTO dto = new NoticeDTO();
						
						dto.setN_no(rs.getInt("n_no"));
						dto.setN_title(rs.getString("n_title"));
						dto.setN_readcount(rs.getInt("n_readcount"));
						dto.setN_date(rs.getTimestamp("n_date"));
						dto.setN_eventSdate(rs.getString("n_eventSdate"));
						dto.setN_eventEdate(rs.getString("n_eventEdate"));
						
						noticeList.add(dto);
					}//while
					
//					System.out.println(" DAO : 게시판 목록 저장완료!"+noticeList);
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeDB();
				}
				
				return noticeList;
			}
			
			public ArrayList adminGetNoticeList(int startRow, int pageSize, String keyword, int isE) {
				System.out.println(" DAO : getBoardList() 호출 ");
				// 글정보 모두 저장하는 배열
				ArrayList noticeList = new ArrayList();
				
				try {
				// 1.2. 디비 연결
					con = getConnection();
				// 3. sql 작성(select) & pstmt 객체
//					sql = "select * from itwill_board";
					sql = "select * from notice where n_isEvent=? and n_title like ? limit ?,? ";
					pstmt = con.prepareStatement(sql);
				// ?????
					pstmt.setInt(1, isE);
					pstmt.setString(2, keyword);
					pstmt.setInt(3, startRow-1); // 시작행-1
					pstmt.setInt(4, pageSize); // 개수
				// 4. sql 실행
					rs = pstmt.executeQuery();
				// 5. 데이터 처리 (DB -> DTO -> List)
					while(rs.next()) {
						// DB -> DTO
						NoticeDTO dto = new NoticeDTO();
						
						dto.setN_no(rs.getInt("n_no"));
						dto.setN_title(rs.getString("n_title"));
						dto.setN_readcount(rs.getInt("n_readcount"));
						dto.setN_date(rs.getTimestamp("n_date"));
						dto.setN_eventSdate(rs.getString("n_eventSdate"));
						dto.setN_eventEdate(rs.getString("n_eventEdate"));
						
						noticeList.add(dto);
					}//while
					
//					System.out.println(" DAO : 게시판 목록 저장완료!"+noticeList);
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeDB();
				}
				
				return noticeList;
			}
			
			public int adminCntGetNoticeList(int startRow, int pageSize, String keyword, int isE) {
				System.out.println(" DAO : getBoardList() 호출 ");
				// 글정보 모두 저장하는 배열
				int cnt=0;
				
				try {
				// 1.2. 디비 연결
					con = getConnection();
				// 3. sql 작성(select) & pstmt 객체
//					sql = "select * from itwill_board";
					sql = "select count(*) from notice where n_isEvent=? and n_title like ? limit ?,? ";
					pstmt = con.prepareStatement(sql);
				// ?????
					pstmt.setInt(1, isE);
					pstmt.setString(2, keyword);
					pstmt.setInt(3, startRow-1); // 시작행-1
					pstmt.setInt(4, pageSize); // 개수
				// 4. sql 실행
					rs = pstmt.executeQuery();
				// 5. 데이터 처리 (DB -> DTO -> List)
					if(rs.next()) {
						// DB -> DTO
						cnt = rs.getInt(1);
					}//while
					
//					System.out.println(" DAO : 게시판 목록 저장완료!"+noticeList);
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeDB();
				}
				
				return cnt;
			}
			// 어드민 공지 목록
			
			// 어드민 공지 갯수 조회
			public int getNoticeCount() {
				int cnt = 0;
				
				// 1.2. 디비연결
				try {
					con = getConnection();
					// 3. sql
					sql = "select count(*) from notice";
					pstmt = con.prepareStatement(sql);
					
					// 4. sql 실행
					rs = pstmt.executeQuery();
					// 5. 데이터처리
					if(rs.next()) {
						
//									cnt = rs.getInt(count(*));
						cnt = rs.getInt("count(*)");
					}
					System.out.println(" DAO : 전체 일반 회원 수 : " +cnt+"개");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
				return cnt;
			}
			// 어드민 공지 갯수 조회
			
			// 어드민 공지 삭제
			public void adminDelNotice(int n_no) {			
				try {
					con = getConnection();
					
					sql = "select * from notice where n_no=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, n_no);
					pstmt.executeQuery();
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						sql = "delete from notice where n_no=?";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setInt(1, n_no);
						pstmt.executeUpdate();
					}
					
					
					System.out.println(" DAO : 회원삭제 완료");
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
			
			}
			// 어드민 공지 삭제
			
			// 어드민 공지 등록
			public void insertNotice(NoticeDTO dto) {
				
				try {
					
					int cnt = 1;
					
					con = getConnection();
					
					sql = "select max(n_no) from notice";
					pstmt = con.prepareStatement(sql);
					
					rs = pstmt.executeQuery();
					
					
					if(rs.next()) {
						cnt = rs.getInt(1)+1;
					}
					
					
					sql = "insert into notice values (?,?,now(),?,?,?,?,?,?)";
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, cnt);
					pstmt.setString(2, dto.getN_title());
					
					pstmt.setInt(3, dto.getN_readcount());
					pstmt.setInt(4, dto.getN_isevent());
					pstmt.setString(5, dto.getN_img());
					pstmt.setString(6, dto.getN_content());
					pstmt.setString(7, dto.getN_eventSdate());
					pstmt.setString(8, dto.getN_eventEdate());
					
					pstmt.executeUpdate();
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
			}
			// 어드민 공지 등록
			
			// 어드민 회원 상세 정보
			public MemberDTO adminGetGenMemDetail(int m_no) {			
				MemberDTO dto = null;
				try {
					con = getConnection();
					
					sql = "select * from member where m_no=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, m_no);
					pstmt.executeQuery();
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						dto = new MemberDTO();
						
						dto.setM_no(m_no);
						dto.setM_id(rs.getString("m_id"));
						dto.setM_name(rs.getString("m_name"));
						dto.setM_email(rs.getString("m_email"));
						dto.setM_nickName(rs.getString("m_nickname"));
						dto.setM_birth(rs.getString("m_birth"));
						dto.setM_gender(rs.getString("m_gender"));
						dto.setM_tel(rs.getString("m_tel"));
						dto.setM_regdate(rs.getTimestamp("m_regdate"));
					
					}
					
					
					System.out.println(" DAO : 회원삭제 완료");
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
			return dto;
			}
			// 어드민 회원 상세 정보
			
			// 어드민 회원 상세, 각종 횟수
			
			public HashMap<String, Integer> adminGetGenCount(int m_no) {
				
				HashMap<String, Integer> hs = new HashMap<String, Integer>();
				
				try {
					con=getConnection();
					sql = "select (select count(*) from reviewcs where m_no=?) A,"
							+ "(select count(*) from report where m_no=?) B,"
							+ "(select count(*) from reservation where m_no=?) C,"
							+ "(select count(*) from payment where m_no=?) D";
					pstmt = con.prepareStatement(sql);
					for (int i=1;i<5;i++) {
						pstmt.setInt(i, m_no);
					}
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						hs.put("review", rs.getInt("A"));
						hs.put("report", rs.getInt("B"));
						hs.put("reservation", rs.getInt("C"));
						hs.put("payment", rs.getInt("D"));
					}
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
				return hs;
			}
			
			// 어드민 회원 상세, 각종 횟수
			
			// 어드민 점주 상세, 각종 횟수
			
			public HashMap<String, Object> adminGetCeoCount(int c_no) {
				
				HashMap<String, Object> hs = new HashMap<String, Object>();
				
				try {
					con=getConnection();
					sql = "SELECT (select count(*) from store where c_no=?) A," 
							+"(select sum(s_readcount) from store where c_no=?) B,"
							+"(select avg(s_star) from store where c_no=? and s_star!=0) C,"
							+"(select count(*) from reservation A, store B where A.s_no=B.s_no and B.c_no=?) D";
					pstmt = con.prepareStatement(sql);
					for (int i=1;i<5;i++) {
						pstmt.setInt(i, c_no);
					}
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						hs.put("store", rs.getInt("A"));
						hs.put("read", rs.getInt("B"));
						hs.put("star", rs.getString("C"));
						hs.put("reserv", rs.getInt("D"));
					}
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
				return hs;
			}
						
			// 어드민 점주 상세, 각종 횟수			
			
			// 어드민 공지 갯수 조회
			public int getGenMemReservCount(int m_no){
				int cnt = 0;
				
				// 1.2. 디비연결
				try {
					con = getConnection();
					// 3. sql
					sql = "select count(*) from reservation where m_no=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, m_no);
					// 4. sql 실행
					rs = pstmt.executeQuery();
					// 5. 데이터처리
					if(rs.next()) {
						cnt = rs.getInt("count(*)");
					}
					System.out.println(" DAO : 전체 일반 회원 수 : " +cnt+"개");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
				return cnt;
			}
			// 어드민 공지 갯수 조회
			
			// 어드민 점주 회원리스트 받기
			
			public List<Map<String, Object>> adminGetGenMemReservList(int startRow, int pageSize, int m_no) {
				System.out.println(" DAO : getBoardList() 호출 ");
				// 글정보 모두 저장하는 배열
				List<Map<String,Object>> reservList = new ArrayList<Map<String,Object>>();
				HashMap<String, Object> hm = null;
				
				
				try {
				// 1.2. 디비 연결
					con = getConnection();
				// 3. sql 작성(select) & pstmt 객체
					sql = "select B.s_name, A.*  from reservation A, store B where A.s_no=B.s_no and A.m_no=? limit ?,?;";
					pstmt = con.prepareStatement(sql);
				// ?????
					pstmt.setInt(1, m_no);
					pstmt.setInt(2, startRow-1); // 시작행-1
					pstmt.setInt(3, pageSize); // 개수
				// 4. sql 실행
					rs = pstmt.executeQuery();
				// 5. 데이터 처리 (DB -> DTO -> List)
					while(rs.next()) {
						// DB -> DTO
						hm = new HashMap<String,Object>();
						hm.put("s_name", rs.getString("s_name"));
						hm.put("res_no", rs.getInt("res_no"));
						hm.put("s_no", rs.getInt("s_no"));
						hm.put("m_no", rs.getInt("m_no"));
						hm.put("res_num", rs.getInt("res_num"));
						hm.put("res_time",rs.getInt("res_time"));
						hm.put("res_date",rs.getString("res_date"));
						hm.put("res_name", rs.getString("res_name"));
						hm.put("res_msg", rs.getString("res_msg"));
						hm.put("res_status", rs.getInt("res_status"));
						
						reservList.add(hm);
					}//while
					
					
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeDB();
				}
				
				return reservList;
			}
			
			// 어드민 점주 회원리스트 받기
			
			/** 연락처 중복확인 checkTel(tel)
			 * 이메일 중복확인 메서드, 실행할 때(tel) 받아서 사용
			 * 리턴값 있음. 1-중복, 0-중복x
			 * @param tel
			 * @return
			 */
			public int checkTel(String tel) {
				int result=0;
				
				try {
					con = getConnection();
					
					sql = "select m_pw from member where m_tel=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, tel);
					
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						result = 1;  // 이미 존재, 생성 불가
						
						System.out.println(" DAO : 이메일 중복결과 ("+result+")");
					} else {
						sql = "select c_pw from ceo where c_tel=?";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setString(1, tel);
						
						rs = pstmt.executeQuery();
						
						if(rs.next()) {
							result = 1;  // 이미 존재, 생성 불가
							
							System.out.println(" DAO : 이메일 중복결과 ("+result+")");
						}
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				} closeDB();
				
				return result;
			}
			
			
			/** 로그인여부 체크 userLogin(id,pw)
			 * 로그인 여부 체크 메서드. id, pw 값 받아서 사용
			 * 리턴값 있음 -1: 회원정보 없음, 0:비밀번호 오류
			 * 				1: 일반회원  2: 사업자회원
			 * @param id
			 * @param pw
			 * @return
			 */
			public int userLogin(String id, String pw) {
				int result = -1;
				
				try {
					// 1.2. 디비연결
					con = getConnection();
					// 3. sql & pstmt
					sql = "select m_pw from member where m_id=?";
					pstmt = con.prepareStatement(sql);
					//???
					pstmt.setString(1, id);
					
					// 4. sql 실행
					rs = pstmt.executeQuery();
					// 5. 데이터처리
					
					if(rs.next()) {
						// 회원
						if(pw.equals(rs.getString("m_pw"))) {
							// 로그인 성공
							result = 1;
						}else {
							// 로그인 실패
							result = 0;
						}
					} else {
						sql = "select c_pw from ceo where c_id=?";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setString(1, id);
						
						rs = pstmt.executeQuery();
						
						// 데이터처리
						if(rs.next()) {
							if(pw.equals(rs.getString("c_pw"))) {
								// 사업자 로그인 성공
								result = 2;
								
							} else {
								// 실패
								result = 0;
							}
						} 
					}
					
					System.out.println(" DAO : 로그인 체크 ("+result+")");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
				return result;
			}
			// 로그인여부 체크 userLogin(id,pw)
			
			
			/** 사업자 회원정보 가져오기 - getCEO(id)
			 * 사업자 회원정보 저장하여 조회하는 메서드. id 값 받아서 사용
			 * 리턴값 없음
			 * @param id
			 * @return
			 */
			public CeoDTO getCEO(String id) {
				CeoDTO cdto = null;
				
				try {
					con = getConnection();
					sql = "select * from ceo where c_id=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						cdto = new CeoDTO();
						
						cdto.setC_no(rs.getInt("c_no"));
						cdto.setC_id(rs.getString("c_id"));
						cdto.setC_name(rs.getString("c_name"));
						cdto.setC_email(rs.getString("c_email"));
						cdto.setC_nickName(rs.getString("c_nickName"));
						cdto.setC_tel(rs.getString("c_tel"));
						cdto.setC_pw(rs.getString("c_pw"));
						cdto.setC_regdate(rs.getTimestamp("c_regdate"));
					}
					
					System.out.println(" DAO : 회원정보 저장 완료! ");
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
				return cdto;
			} // 사업자 회원정보 가져오기 - getCEO(id)
			
			public CeoDTO getCEO(int c_no) {
				CeoDTO cdto = null;
				
				try {
					con = getConnection();
					sql = "select * from ceo where c_no=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, c_no);
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						cdto = new CeoDTO();
						
						cdto.setC_no(rs.getInt("c_no"));
						cdto.setC_id(rs.getString("c_id"));
						cdto.setC_name(rs.getString("c_name"));
						cdto.setC_email(rs.getString("c_email"));
						cdto.setC_nickName(rs.getString("c_nickName"));
						cdto.setC_tel(rs.getString("c_tel"));
						cdto.setC_pw(rs.getString("c_pw"));
						cdto.setC_regdate(rs.getTimestamp("c_regdate"));
					}
					
					System.out.println(" DAO : 회원정보 저장 완료! ");
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
				return cdto;
			} // 사업자 회원정보 가져오기 - getCEO(id)
			
			/** 업자 가지고 있는 가게 수 확인 - getStoreCount(id)
			 * 사업자가 가지고 있는 가게 수 확인 메서드. id 받음
			 * 리턴값 o , 카운트 리턴
			 * @param id
			 * @return
			 */
			public int getStoreCount(String id) {
				int snt=0;
				
				try {
					con = getConnection();
					
					sql = "select count(s.s_no) from store s "
							+ "join ceo c on s.c_no=c.c_no "
							+ "where c.c_id=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, id);
					
					rs=pstmt.executeQuery();
					
					// 데이터처리
					if(rs.next()) {
						snt = rs.getInt("count(*)");
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
				return snt;
			}
			
			
			
			/** 가게 정보 가져오기 - getStoreList(id, listType, startRow,pageSize)
			 *  가게 정보를 저장하여 조회와 정렬,
			 *  페이징 처리하는 메서드. id, listType, startRowm pageSize
			 *  리턴값 o, List 배열
			 * @param id
			 * @param listType
			 * @param startRow
			 * @param pageSize
			 * @return
			 */
			public List getStoreList(String id,String listType,int startRow,int pageSize) {
				// 가게 목록 저장 List
				List storeList = new ArrayList();
				
				
				try {
					con = getConnection();
					sql = "select c.c_id, s.*, "
							+ "(select count(*) from bookmark b where s.s_no = b.s_no) bcount, "
							+ "(select count(*) from reviewcs r where s.s_no = r.s_no) rcount "
							+ "from store s Join ceo c "
							+ "on c.c_no = s.c_no where c.c_id=? "
							+ "order by " + listType + " desc, s.s_no desc limit ?,?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, id);
					pstmt.setInt(2, startRow-1); // 시작행 -1
					pstmt.setInt(3, pageSize); // 개수
					
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						// DB -> DTO -> List
						StoreDTO sdto = new StoreDTO();
						
						sdto.setS_no(rs.getInt("s_no"));
						sdto.setS_name(rs.getString("s_name"));
						sdto.setS_addr(rs.getString("s_addr"));
						sdto.setS_tel(rs.getString("s_tel"));
						sdto.setS_hours(rs.getString("s_hours"));
						sdto.setS_type(rs.getString("s_type"));
						sdto.setS_image(rs.getString("s_image"));
						sdto.setS_content(rs.getString("s_content"));
						sdto.setS_facility(rs.getString("s_facility"));
						sdto.setS_latitude(rs.getString("s_latitude"));
						sdto.setS_longtude(rs.getString("s_longtude"));
						sdto.setS_menuname(rs.getString("s_menuname"));
						sdto.setS_menuprice(rs.getString("s_menuprice"));
						sdto.setS_menuImg(rs.getString("s_menuImg"));
						sdto.setS_number(rs.getInt("s_number"));
						sdto.setC_no(rs.getInt("c_no"));
						sdto.setS_star(rs.getDouble("s_star"));
						sdto.setS_regdate(rs.getTimestamp("s_regdate"));
						sdto.setBcount(rs.getInt("bcount"));
						sdto.setRcount(rs.getInt("rcount"));
						
						// DTO -> List
						storeList.add(sdto);
						
					} // while
					
//					System.out.println(" DAO : 가지고 있는 가게 수 : "+storeList.size());
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
				return storeList;
			}
			
			
			/** 등록한 가게 삭제 - deleteStore(s_no)
			 *  ceo 마이페이지에서 등록 가게 삭제 메서드. s_no 받음
			 *  리턴값 x
			 * @param s_no
			 */
			public void deleteStore(int s_no) {
				try {
					con = getConnection();
					
					sql = "delete from store where s_no=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, s_no);
					
					pstmt.executeUpdate();
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
			}
			
			
			// 사업자 가게 총 예약 개수
			
			// 사업자회원가입 - ceoJoin(DTO)
			/**
			 * 회원가입 메서드, 실행할 때 회원정보(DTO) 받아서 사용
			 * 리턴 X
			 * @param dto
			 * @param hid
			 */
			public void ceoJoin(CeoDTO dto) {
				int c_no = 0;
				
				try {
					con = getConnection();
					
					sql = "select max(c_no) from ceo";
					pstmt = con.prepareStatement(sql);
					
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						c_no = rs.getInt(1)+1;
					} // 회원번호 증가
					
					System.out.println(" DAO : c_no : " + c_no);
					
					// 회원가입
					sql = "insert into ceo(c_no,c_id,c_name,c_email,c_nickname,c_pw,c_tel) "
							+ "values(?,?,?,?,?,?,?)";
					pstmt = con.prepareStatement(sql);
					
					// ??
					pstmt.setInt(1, c_no);
					pstmt.setString(2, dto.getC_id());
					pstmt.setString(3, dto.getC_name());
					pstmt.setString(4, dto.getC_email());
					pstmt.setString(5, dto.getC_nickName());
					pstmt.setString(6, dto.getC_pw());
					pstmt.setString(7, dto.getC_tel());
					
					int result = pstmt.executeUpdate();
					
					if(result > 0 ) {
						System.out.println(" DAO : 회원가입 성공! ");
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}

			} // 회원가입 - ceoJoin(DTO)
			
			// 어드민 디테일 리뷰 갯수 조회
			public int getGenReviewCount(int m_no) {
				int cnt = 0;
				
				// 1.2. 디비연결
				try {
					con = getConnection();
					// 3. sql
					sql = "select count(*) from reviewcs where m_no=? and rev_category=1";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, m_no);
					
					// 4. sql 실행
					rs = pstmt.executeQuery();
					// 5. 데이터처리
					if(rs.next()) {
						
//												cnt = rs.getInt(count(*));
						cnt = rs.getInt("count(*)");
					}
					System.out.println(" DAO : 전체 일반 회원 수 : " +cnt+"개");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
				return cnt;
			}
			// 어드민 디테일 리뷰 갯수 조회
			
			// 어드민 멤버 디테일 리뷰
				
			public List<Map<String,Object>> adminGetGenReivewList(int startRow, int pageSize, int m_no) {
				System.out.println(" DAO : getBoardList() 호출 ");
				// 글정보 모두 저장하는 배열
				List<Map<String,Object>> revList = new ArrayList<Map<String,Object>>();
				HashMap<String, Object> hm = null;
				
				try {
				// 1.2. 디비 연결
					con = getConnection();
				// 3. sql 작성(select) & pstmt 객체
//						sql = "select * from itwill_board";
					sql = "select A.rev_subject, A.rev_content, B.s_name, B.s_no, A.rev_star from reviewcs A, store B where A.m_no=? "
							+ "and rev_category=1 "
							+ "and A.s_no = B.s_no limit ?,?;";
					pstmt = con.prepareStatement(sql);
				// ?????
					pstmt.setInt(1, m_no);
					pstmt.setInt(2, startRow-1); // 시작행-1
					pstmt.setInt(3, pageSize); // 개수
				// 4. sql 실행
					rs = pstmt.executeQuery();
				// 5. 데이터 처리 (DB -> DTO -> List)
					while(rs.next()) {
						// DB -> DTO
						hm = new HashMap<String,Object>();
						
						hm.put("rev_subject", rs.getString("rev_subject"));
						hm.put("rev_content", rs.getString("rev_content"));
						hm.put("s_name", rs.getString("s_name"));
						hm.put("s_no", rs.getInt("s_no"));
						hm.put("rev_star", rs.getInt("rev_star"));
						
						revList.add(hm);
					}//while
					
//						System.out.println(" DAO : 게시판 목록 저장완료!"+noticeList);
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeDB();
				}
				
				return revList;
			}
			
			public List getCeoStoreList(int c_no, int startRow, int pageSize) {
				// 가게 목록 저장 List
				List storeList = new ArrayList();
				
				
				try {
					con = getConnection();
					sql = "select * from store where c_no=? limit ?,?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, c_no);
					pstmt.setInt(2, startRow-1); // 시작행 -1
					pstmt.setInt(3, pageSize); // 개수
					
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						// DB -> DTO -> List
						StoreDTO sdto = new StoreDTO();
						
						sdto.setS_no(rs.getInt("s_no"));
						sdto.setS_name(rs.getString("s_name"));
						sdto.setS_addr(rs.getString("s_addr"));
						sdto.setS_price(rs.getInt("s_price"));
						sdto.setS_type(rs.getString("s_type"));
						sdto.setS_readcount(rs.getInt("s_readcount"));
						sdto.setS_star(rs.getDouble("s_star"));
						sdto.setS_regdate(rs.getTimestamp("s_regdate"));
						// DTO -> List
						storeList.add(sdto);
						
					} // while
					
//					System.out.println(" DAO : 가지고 있는 가게 수 : "+storeList.size());
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
				return storeList;
			}
				
			public int getCntCeoStoreList(int c_no, int startRow, int pageSize) {
				// 가게 목록 저장 List
				int cnt=0;
				
				try {
					con = getConnection();
					sql = "select count(*) from store where c_no=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, c_no);
					
					
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						cnt = rs.getInt(1);
						
					} // while
					
//					System.out.println(" DAO : 가지고 있는 가게 수 : "+storeList.size());
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
				return cnt;
			}
			
			// 어드민 가게목록불러오기 getStoreList start ( 검색 )
				public List<Map> adminGetBoardList(int startRow, int pageSize, String s_name) {
					System.out.println(" DAO : getBoardList() 호출 ");
					// 글정보 모두 저장하는 배열
					List<Map> boardList = new ArrayList<Map>();
					HashMap<String,Object> hm = null;
					
					try {
					// 1.2. 디비 연결
						con = getConnection();
					// 3. sql 작성(select) & pstmt 객체
//								sql = "select * from itwill_board";
						sql = "select * from store A inner join ceo B on A.c_no = B.c_no where s_name Like ? limit ?,?;";
						pstmt = con.prepareStatement(sql);
					// ?????
						pstmt.setString(1, s_name);
						pstmt.setInt(2, startRow-1); // 시작행-1
						pstmt.setInt(3, pageSize); // 개수
					// 4. sql 실행
						rs = pstmt.executeQuery();
					// 5. 데이터 처리 (DB -> DTO -> List)
						while(rs.next()) {
							// DB -> DTO
							hm = new HashMap<String,Object>();
							hm.put("c_no", rs.getInt("c_no"));
							hm.put("c_name", rs.getString("c_name"));
							hm.put("s_image", rs.getString("s_image"));
							hm.put("s_name", rs.getString("s_name"));
							hm.put("s_no", rs.getLong("s_no"));
							hm.put("s_type", rs.getString("s_type"));
							hm.put("s_number",rs.getInt("s_number"));
							hm.put("s_addr",rs.getString("s_addr"));
							hm.put("s_regdate", rs.getTimestamp("s_regdate"));
							//DTO -> List
							
							boardList.add(hm);
						}//while
						System.out.println(boardList);
						System.out.println(" DAO : 게시판 목록 저장완료!");
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						closeDB();
					}
					
					return boardList;
				}
				
				// 어드민 가게 목록 불러오기 getStoreList end
				
				public int adminCntGetBoardList(int startRow, int pageSize, String s_name) {
					System.out.println(" DAO : getBoardList() 호출 ");
					// 글정보 모두 저장하는 배열
					int cnt=0;
					try {
					// 1.2. 디비 연결
						con = getConnection();
					// 3. sql 작성(select) & pstmt 객체
//								sql = "select * from itwill_board";
						sql = "select count(*) from store A inner join ceo B on A.c_no = B.c_no where s_name Like ? limit ?,?;";
						pstmt = con.prepareStatement(sql);
					// ?????
						pstmt.setString(1, s_name);
						pstmt.setInt(2, startRow-1); // 시작행-1
						pstmt.setInt(3, pageSize); // 개수
					// 4. sql 실행
						rs = pstmt.executeQuery();
					// 5. 데이터 처리 (DB -> DTO -> List)
						if(rs.next()) {
							// DB -> DTO
							cnt = rs.getInt(1);
						}//while
						
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						closeDB();
					}
					
					return cnt;
				}
				// 어드민 점주 회원리스트 받기
				
			public List<Map<String, Object>> adminGetReservList(int startRow, int pageSize) {
				System.out.println(" DAO : getBoardList() 호출 ");
				// 글정보 모두 저장하는 배열
				List<Map<String,Object>> reservList = new ArrayList<Map<String,Object>>();
				HashMap<String, Object> hm = null;
				
				
				try {
				// 1.2. 디비 연결
					con = getConnection();
				// 3. sql 작성(select) & pstmt 객체
					sql = "select C.m_no, C.m_id, B.res_no, A.s_no, A.s_name, b.res_name, b.res_num,b.res_date,b.res_time,b.res_msg,b.res_status "
							+ "from store A, reservation B, member C "
							+ "where A.s_no=B.s_no and C.m_no=B.m_no limit ?,?";
					pstmt = con.prepareStatement(sql);
				// ?????
					
					pstmt.setInt(1, startRow-1); // 시작행-1
					pstmt.setInt(2, pageSize); // 개수
				// 4. sql 실행
					rs = pstmt.executeQuery();
				// 5. 데이터 처리 (DB -> DTO -> List)
					while(rs.next()) {
						// DB -> DTO
						hm = new HashMap<String,Object>();
						hm.put("m_id", rs.getString("m_id"));
						hm.put("m_no", rs.getInt("m_no"));
						hm.put("res_no", rs.getInt("res_no"));
						hm.put("s_no", rs.getInt("s_no"));
						hm.put("s_name", rs.getString("s_name"));
						hm.put("res_num", rs.getInt("res_num"));
						hm.put("res_time",rs.getInt("res_time"));
						hm.put("res_date",rs.getString("res_date"));
						hm.put("res_name", rs.getString("res_name"));
						hm.put("res_msg", rs.getString("res_msg"));
						hm.put("res_status", rs.getInt("res_status"));
						
						reservList.add(hm);
					}//while
					
					
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeDB();
				}
				
				return reservList;
			}
				
				// 어드민 점주 회원리스트 받기	
			
			// 어드민 점주 회원리스트 받기
			
			public List<Map<String, Object>> adminGetReservList(int startRow, int pageSize, String s_name) {
				System.out.println(" DAO : getBoardList() 호출 ");
				// 글정보 모두 저장하는 배열
				List<Map<String,Object>> reservList = new ArrayList<Map<String,Object>>();
				HashMap<String, Object> hm = null;
				
				
				try {
				// 1.2. 디비 연결
					con = getConnection();
				// 3. sql 작성(select) & pstmt 객체
					sql = "select C.m_no, C.m_id, B.res_no, A.s_no, A.s_name, b.res_name, b.res_num,b.res_date,b.res_time,b.res_msg,b.res_status "
							+ "from store A, reservation B, member C "
							+ "where A.s_no=B.s_no and C.m_no=B.m_no and s_name Like ? limit ?,?;";
					pstmt = con.prepareStatement(sql);
				// ?????
					pstmt.setString(1, s_name);
					pstmt.setInt(2, startRow-1); // 시작행-1
					pstmt.setInt(3, pageSize); // 개수
				// 4. sql 실행
					rs = pstmt.executeQuery();
				// 5. 데이터 처리 (DB -> DTO -> List)
					while(rs.next()) {
						// DB -> DTO
						hm = new HashMap<String,Object>();
						hm.put("m_id", rs.getString("m_id"));
						hm.put("m_no", rs.getInt("m_no"));
						hm.put("res_no", rs.getInt("res_no"));
						hm.put("s_no", rs.getInt("s_no"));
						hm.put("s_name", rs.getString("s_name"));
						hm.put("res_num", rs.getInt("res_num"));
						hm.put("res_time",rs.getInt("res_time"));
						hm.put("res_date",rs.getString("res_date"));
						hm.put("res_name", rs.getString("res_name"));
						hm.put("res_msg", rs.getString("res_msg"));
						hm.put("res_status", rs.getInt("res_status"));
						
						reservList.add(hm);
					}//while
					
					
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeDB();
				}
				
				return reservList;
			}
				
				// 어드민 점주 회원리스트 받기

			// 어드민 점주 회원리스트 받기
			
				public List<Map<String, Object>> adminGetPaymentList(int startRow, int pageSize, String keyword) {
					System.out.println(" DAO : getBoardList() 호출 ");
					// 글정보 모두 저장하는 배열
					List<Map<String,Object>> paymentList = new ArrayList<Map<String,Object>>();
					HashMap<String, Object> hm = null;
					
					
					try {
					// 1.2. 디비 연결
						con = getConnection();
					// 3. sql 작성(select) & pstmt 객체
						sql = "select B.p_no, C.m_id, A.s_name, B.p_price, B.p_info, B.p_date, B.p_status, A.s_no, C.m_no"
								+ "from store A, payment B, member C "
								+ "where A.s_no=B.s_no and C.m_no=B.m_no and (A.s_name Like ? or C.m_id ?) limit ?,?;";
						pstmt = con.prepareStatement(sql);
					// ?????
						pstmt.setString(1, keyword);
						pstmt.setString(2, keyword);
						pstmt.setInt(3, startRow-1); // 시작행-1
						pstmt.setInt(4, pageSize); // 개수
					// 4. sql 실행
						rs = pstmt.executeQuery();
					// 5. 데이터 처리 (DB -> DTO -> List)
						while(rs.next()) {
							// DB -> DTO
							hm = new HashMap<String,Object>();
							hm.put("p_no", rs.getInt("p_no"));
							hm.put("m_id", rs.getString("m_id"));
							hm.put("s_name", rs.getString("s_name"));
							hm.put("p_price", rs.getInt("p_price"));
							hm.put("p_info", rs.getString("p_info"));
							hm.put("p_date", rs.getTimestamp("p_date"));
							hm.put("p_status",rs.getInt("p_status"));
							hm.put("s_no",rs.getInt("s_no"));
							hm.put("m_no",rs.getInt("m_no"));
							paymentList.add(hm);
						}//while
						
						
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						closeDB();
					}
					
					return paymentList;
				}
							
							// 어드민 점주 회원리스트 받기
			// 어드민 점주 회원리스트 받기
				public List<Map<String, Object>> adminGetPaymentList(int startRow, int pageSize) {
					System.out.println(" DAO : getBoardList() 호출 ");
					// 글정보 모두 저장하는 배열
					List<Map<String,Object>> paymentList = new ArrayList<Map<String,Object>>();
					HashMap<String, Object> hm = null;
					
					
					try {
					// 1.2. 디비 연결
						con = getConnection();
					// 3. sql 작성(select) & pstmt 객체
						sql = "select B.p_no, C.m_id, A.s_name, B.p_price, B.p_info, B.p_date, B.p_status,A.s_no, C.m_no"
								+ "from store A, payment B, member C "
								+ "where A.s_no=B.s_no and C.m_no=B.m_no limit ?,?";
						pstmt = con.prepareStatement(sql);
					// ?????
						
						pstmt.setInt(1, startRow-1); // 시작행-1
						pstmt.setInt(2, pageSize); // 개수
					// 4. sql 실행
						rs = pstmt.executeQuery();
					// 5. 데이터 처리 (DB -> DTO -> List)
						while(rs.next()) {
							// DB -> DTO
							hm = new HashMap<String,Object>();
							hm.put("p_no", rs.getInt("p_no"));
							hm.put("m_id", rs.getString("m_id"));
							hm.put("s_name", rs.getString("s_name"));
							hm.put("p_price", rs.getInt("p_price"));
							hm.put("p_info", rs.getString("p_info"));
							hm.put("p_date", rs.getTimestamp("p_date"));
							hm.put("p_status",rs.getInt("p_status"));
							hm.put("s_no",rs.getInt("s_no"));
							hm.put("m_no",rs.getInt("m_no"));
							
							paymentList.add(hm);
						}//while
						
						
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						closeDB();
					}
					
					return paymentList;
				}
				
				
				public int adminCntGetReservList(int startRow, int pageSize, String s_name) {
					System.out.println(" DAO : getBoardList() 호출 ");
					// 글정보 모두 저장하는 배열
					int cnt = 0;
					
					
					try {
					// 1.2. 디비 연결
						con = getConnection();
					// 3. sql 작성(select) & pstmt 객체
						sql = "select count(*) from reservation";
						pstmt = con.prepareStatement(sql);
					// ?????
						
						
					// 4. sql 실행
						rs = pstmt.executeQuery();
					// 5. 데이터 처리 (DB -> DTO -> List)
						if(rs.next()) {
							// DB -> DTO
							cnt = rs.getInt(1);
							
							
						}//while
						
						
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						closeDB();
					}
					
					return cnt;
				}
				
				/** 가게 정보 저장 - getStoreInfo(id)
				 * 가게 정보 저장하는 메서드. id 값 받아서 사용
				 * 리턴값 List
				 * @param id
				 * @return
				 */
				public List getStoreInfo(String id) {
					List storeInfo = new ArrayList();
					
					
					try {
						con = getConnection();
						sql = "select s.* from store s "
								+ "join ceo c on c.c_no = s.c_no "
								+ "where c_id=?";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setString(1, id);
						rs = pstmt.executeQuery();
						
						while(rs.next()) {
							StoreDTO sdto = new StoreDTO();
							
							sdto.setS_no(rs.getInt("s_no"));
							sdto.setS_name(rs.getString("s_name"));
							sdto.setS_addr(rs.getString("s_addr"));
							sdto.setS_tel(rs.getString("s_tel"));
							sdto.setS_hours(rs.getString("s_hours"));
							sdto.setS_type(rs.getString("s_type"));
							sdto.setS_image(rs.getString("s_image"));
							sdto.setS_content(rs.getString("s_content"));
							sdto.setS_facility(rs.getString("s_facility"));
							sdto.setS_latitude(rs.getString("s_latitude"));
							sdto.setS_longtude(rs.getString("s_longtude"));
							sdto.setS_menuname(rs.getString("s_menuname"));
							sdto.setS_menuprice(rs.getString("s_menuprice"));
							sdto.setS_menuImg(rs.getString("s_menuImg"));
							sdto.setS_number(rs.getInt("s_number"));
							sdto.setC_no(rs.getInt("c_no"));
							sdto.setS_star(rs.getDouble("s_star"));
							sdto.setS_regdate(rs.getTimestamp("s_regdate"));
							
							storeInfo.add(sdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						closeDB();
					}
					
					return storeInfo;
				} // 가게 정보 저장 - getStoreInfo(id)
				
				
				// 사업자 예약 정보 전체 조회  - getCeoReservInfo(id)
				public List getCeoReservInfo(String id) {
					List reservInfo = new ArrayList();
					String s_name="";
					
					
					try {
						con = getConnection();
						sql = "select s.s_name, v.* from store s "
								+ "join ceo c on s.c_no = c.c_no "
								+ "join reservation v on s.s_no = v.s_no "
								+ "where c.c_id=? "
								+ "order by v.res_time desc";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setString(1, id);
						rs = pstmt.executeQuery();
						
						while(rs.next()) {
							ReservDTO vdto = new ReservDTO();
							
							vdto.setRes_no(rs.getInt("res_no"));
							vdto.setS_no(rs.getInt("s_no"));
							vdto.setM_no(rs.getInt("m_no"));
							vdto.setRes_num(rs.getInt("res_num"));
							vdto.setRes_time(rs.getInt("res_time"));
							vdto.setRes_date(rs.getString("res_date"));
							vdto.setRes_name(rs.getString("res_name"));
							vdto.setRes_msg(rs.getString("res_msg"));
							vdto.setRes_status(rs.getInt("res_status"));
							vdto.setS_name(rs.getString("s_name"));
							vdto.setRes_tel(rs.getString("res_tel"));
							
							reservInfo.add(vdto);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						closeDB();
					}
					
					return reservInfo;
				} // 사업자 예약 정보 저장 - getCeoReservInfo(id)
				
				
				// 사업자 가게 총 예약 개수 - getCeoReservCount
				public int CeoReservCount(String id, String sno,String schList,String search) {
					int vnt=0;
					int sno2 = Integer.parseInt(sno);
					if(schList == null) {
						schList = "res_no";
					}
				
					if(search == null) {
					search = "";
					}
					
					try {
						con = getConnection();
						
						if(sno2==0) {
							sql = "select count(v.s_no) from store s "
									+ "join ceo c on s.c_no = c.c_no "
									+ "join reservation v on s.s_no = v.s_no "
									+ "where c.c_id=? && "+schList+" like '%"+search+"%' ";
							pstmt = con.prepareStatement(sql);
							
							pstmt.setString(1, id);
							
							rs=pstmt.executeQuery();
							
							
							// 데이터처리
							if(rs.next()) {
								vnt = rs.getInt(1);
								
							}
						} else {
							sql = "select count(v.s_no) from store s "
									+ "join ceo c on s.c_no = c.c_no "
									+ "join reservation v on s.s_no = v.s_no "
									+ "where c.c_id=? && s.s_no=? && "+schList+" like '%"+search+"%' "
									+ "group by s.s_no";
							pstmt = con.prepareStatement(sql);
							
							pstmt.setString(1, id);
							pstmt.setInt(2, sno2);
							
							rs=pstmt.executeQuery();
							
							// 데이터처리
							if(rs.next()) {
								vnt = rs.getInt(1);
							}
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						closeDB();
					}
					
					return vnt;
				}
				
				
				// 사업자 가게별 예약 정보 조회 - getCeoReservList
				public List getCeoReservList(String id, String sno,int startRow,int pageSize) {
					List reservList = new ArrayList();
					int sno2 = Integer.parseInt(sno);
					
					try {
						con = getConnection();

						
						if(sno2 == 0) {
							sql =  "select s.s_name,v.* from store s "
									+ "join ceo c on s.c_no = c.c_no "
									+ "join reservation v on s.s_no = v.s_no "
									+ "where c.c_id=? "
									+ "order by v.res_date desc, v.res_time desc limit ?,?";
							pstmt = con.prepareStatement(sql);
							
							pstmt.setString(1, id);
							pstmt.setInt(2, startRow-1); // 시작행 -1
							pstmt.setInt(3, pageSize); // 개수
							
							rs = pstmt.executeQuery();
							
							// 데이터 처리
							while(rs.next()) {
								ReservDTO vdto = new ReservDTO();
								
								vdto.setRes_no(rs.getInt("res_no"));
								vdto.setS_no(rs.getInt("s_no"));
								vdto.setM_no(rs.getInt("m_no"));
								vdto.setRes_num(rs.getInt("res_num"));
								vdto.setRes_time(rs.getInt("res_time"));
								vdto.setRes_date(rs.getString("res_date"));
								vdto.setRes_name(rs.getString("res_name"));
								vdto.setRes_msg(rs.getString("res_msg"));
								vdto.setRes_status(rs.getInt("res_status"));
								vdto.setS_name(rs.getString("s_name"));
								vdto.setRes_tel(rs.getString("res_tel"));
								
								reservList.add(vdto);
							}
						} else {
							
							sql =  "select v.* from store s "
									+ "join ceo c on s.c_no = c.c_no "
									+ "join reservation v on s.s_no = v.s_no "
									+ "where c.c_id=? && v.s_no=? "
									+ "order by v.res_date desc, v.res_time desc limit ?,?";
							pstmt = con.prepareStatement(sql);
							
							pstmt.setString(1, id);
							pstmt.setInt(2, sno2);
							pstmt.setInt(3, startRow-1); // 시작행 -1
							pstmt.setInt(4, pageSize); // 개수
							
							rs = pstmt.executeQuery();
							
							// 데이터처리
							while(rs.next()) {
								ReservDTO vdto = new ReservDTO();
								
								vdto.setRes_no(rs.getInt("res_no"));
								vdto.setS_no(rs.getInt("s_no"));
								vdto.setM_no(rs.getInt("m_no"));
								vdto.setRes_num(rs.getInt("res_num"));
								vdto.setRes_time(rs.getInt("res_time"));
								vdto.setRes_date(rs.getString("res_date"));
								vdto.setRes_name(rs.getString("res_name"));
								vdto.setRes_msg(rs.getString("res_msg"));
								vdto.setRes_status(rs.getInt("res_status"));
								vdto.setRes_tel(rs.getString("res_tel"));
								
								reservList.add(vdto);
								
							} // while 끝
							
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						closeDB();
					}
					
					return reservList;
				} // 사업자 가게별 예약 리스트 - getCeoReservList
				
				
				// 사업자 가게 검색별 예약 정보 조회 - getCeoReservSearch
					public List getCeoReservSearch(String id, String sno,String schList,String search,int startRow,int pageSize) {
						List searchList = new ArrayList();
						int sno2 = Integer.parseInt(sno);
							if(schList == null) {
								schList = "res_no";
							}
						
							if(search == null) {
							search = "";
						}
						
						try {
							con = getConnection();
							
							if(sno2 == 0) {
								sql =  "select s.s_name, v.* from store s "
										+ "join ceo c on s.c_no = c.c_no "
										+ "join reservation v on s.s_no = v.s_no "
										+ "where c.c_id=? && "+schList+" like '%"+search+"%' "
										+ "order by v.res_date desc, v.res_time desc limit ?,?";
								pstmt = con.prepareStatement(sql);
								
								pstmt.setString(1, id);
								pstmt.setInt(2, startRow-1); // 시작행 -1
								pstmt.setInt(3, pageSize); // 개수
								
								rs = pstmt.executeQuery();
								
								// 데이터 처리
								while(rs.next()) {
									ReservDTO vsdto = new ReservDTO();
									
									vsdto.setRes_no(rs.getInt("res_no"));
									vsdto.setS_no(rs.getInt("s_no"));
									vsdto.setM_no(rs.getInt("m_no"));
									vsdto.setRes_num(rs.getInt("res_num"));
									vsdto.setRes_time(rs.getInt("res_time"));
									vsdto.setRes_date(rs.getString("res_date"));
									vsdto.setRes_name(rs.getString("res_name"));
									vsdto.setRes_msg(rs.getString("res_msg"));
									vsdto.setRes_status(rs.getInt("res_status"));
									vsdto.setS_name(rs.getString("s_name"));
									vsdto.setRes_tel(rs.getString("res_tel"));
									
									searchList.add(vsdto);
								}
							} else {
								
								sql =  "select v.* from store s "
										+ "join ceo c on s.c_no = c.c_no "
										+ "join reservation v on s.s_no = v.s_no "
										+ "where c.c_id=? && v.s_no=? && "+schList+" like '%"+search+"%' "
										+ "order by v.res_date desc, v.res_time desc limit ?,?";
								pstmt = con.prepareStatement(sql);
								
								pstmt.setString(1, id);
								pstmt.setInt(2, sno2);
								pstmt.setInt(3, startRow-1); // 시작행 -1
								pstmt.setInt(4, pageSize); // 개수
								
								rs = pstmt.executeQuery();
								
								// 데이터처리
								while(rs.next()) {
									ReservDTO vsdto = new ReservDTO();
									
									vsdto.setRes_no(rs.getInt("res_no"));
									vsdto.setS_no(rs.getInt("s_no"));
									vsdto.setM_no(rs.getInt("m_no"));
									vsdto.setRes_num(rs.getInt("res_num"));
									vsdto.setRes_time(rs.getInt("res_time"));
									vsdto.setRes_date(rs.getString("res_date"));
									vsdto.setRes_name(rs.getString("res_name"));
									vsdto.setRes_msg(rs.getString("res_msg"));
									vsdto.setRes_status(rs.getInt("res_status"));
									vsdto.setRes_tel(rs.getString("res_tel"));
									
									searchList.add(vsdto);
									
								} // while 끝
								
							}
							
						} catch (Exception e) {
							e.printStackTrace();
						} finally {
							closeDB();
						}
						
						return searchList;
					} // 사업자 가게별 예약 리스트 - getCeoReservList
					
					
					// 사업자 예약 거절 - RefuseReserv(res_no)
					public int RefuseReserv(int res_no) {
						int result=0;
						
						try {
							con = getConnection();
							
							sql = "select * from reservation where res_no=?";
							pstmt = con.prepareStatement(sql);
							
							pstmt.setInt(1, res_no);
							
							rs = pstmt.executeQuery();
							
							// 데이터처리
							if(rs.next()) {
								sql = "update reservation set res_status=? "
										+ "where res_no=? ";
								pstmt = con.prepareStatement(sql);
								
								pstmt.setInt(1, 3);
								pstmt.setInt(2, res_no);
								
								pstmt.executeUpdate();
								
								result=1;
								
							}
							
							
						} catch (Exception e) {
							e.printStackTrace();
						} finally {
							closeDB();
						}
						
						return result;
					}
					
					
					// 사업자 리뷰 수 - ceoReCount
					public int CeoReCount(String id, String sno) {
						int rnt=0;
						int sno2 = Integer.parseInt(sno);
						
						try {
							con = getConnection();
							
							if(sno2==0) {
								sql = "select count(r.s_no) from store s "
										+ "join ceo c on s.c_no = c.c_no "
										+ "join reviewcs r on s.s_no = r.s_no "
										+ "where c.c_id=? ";
								pstmt = con.prepareStatement(sql);
								
								pstmt.setString(1, id);
								
								rs=pstmt.executeQuery();
								
								
								// 데이터처리
								if(rs.next()) {
									rnt = rs.getInt(1);
									
								}
							} else {
								sql = "select count(r.s_no) from store s "
										+ "join ceo c on s.c_no = c.c_no "
										+ "join reviewcs r on s.s_no = r.s_no "
										+ "where c.c_id=? && s.s_no=? "
										+ "group by s.s_no";
								pstmt = con.prepareStatement(sql);
								
								pstmt.setString(1, id);
								pstmt.setInt(2, sno2);
								
								rs=pstmt.executeQuery();
								
								// 데이터처리
								if(rs.next()) {
									rnt = rs.getInt(1);
								}
							}
							
						} catch (Exception e) {
							e.printStackTrace();
						} finally {
							closeDB();
						}
						
						return rnt;
					}
					
					
					
					// 사업자 가게별 리뷰 리스트 - getCeoRevList
					public List getCeoRevList(String id, String sno, String listType,String s, int startRow,int pageSize) {
						List reList = new ArrayList();
						int sno2 = Integer.parseInt(sno);
						
						try {
							con = getConnection();
							
							if(sno2 == 0) {
								if(s.equals("0")) {
									sql =  "select s.s_name, m.m_nickname ,r.*, date_format(r.rev_date,'%Y-%m-%d') as date "
											+ "from store s join ceo c on s.c_no = c.c_no "
											+ "join reviewcs r on s.s_no = r.s_no "
											+ "join member m on r.m_no = m.m_no "
											+ "where c.c_id=? "
											+ "order by " + listType + " desc limit ?,?";
									pstmt = con.prepareStatement(sql);
									
									pstmt.setString(1, id);
									pstmt.setInt(2, startRow-1); // 시작행 -1
									pstmt.setInt(3, pageSize); // 개수
									
									rs = pstmt.executeQuery();
									
									System.out.println("sql 완료오로올오오");
									// 데이터 처리
									while(rs.next()) {
										ReviewcsDTO rdto = new ReviewcsDTO();
										
										rdto.setRev_no(rs.getInt("rev_no"));
										rdto.setS_no(rs.getInt("s_no"));
										rdto.setM_no(rs.getInt("m_no"));
										rdto.setRev_subject(rs.getString("rev_subject"));
										rdto.setRev_content(rs.getString("rev_content"));
										rdto.setRev_date(rs.getTimestamp("rev_date"));
										rdto.setRev_star(rs.getInt("rev_star"));
										rdto.setRev_category(rs.getInt("rev_category"));
										rdto.setRev_file(rs.getString("rev_file"));
										rdto.setRev_c_re(rs.getString("rev_c_re"));
										rdto.setRev_c_date(rs.getTimestamp("rev_c_date"));	
										rdto.setS_name(rs.getString("s_name"));
										rdto.setM_nickname(rs.getString("m_nickname"));
										rdto.setDate(rs.getString("date"));
										
										reList.add(rdto);
										
										System.out.println("반복문 들와따아아아ㅏ");
									}
									
								} else if(s.equals("1")) {
									sql =  "select s.s_name, m.m_nickname ,r.*, date_format(r.rev_date,'%Y-%m-%d') as date "
											+ "from store s join ceo c on s.c_no = c.c_no "
											+ "join reviewcs r on s.s_no = r.s_no "
											+ "join member m on r.m_no = m.m_no "
											+ "where c.c_id=? "
											+ "order by " + listType + " asc limit ?,?";
									pstmt = con.prepareStatement(sql);
									
									pstmt.setString(1, id);
									pstmt.setInt(2, startRow-1); // 시작행 -1
									pstmt.setInt(3, pageSize); // 개수
									
									rs = pstmt.executeQuery();
									
									// 데이터 처리
									while(rs.next()) {
										ReviewcsDTO rdto = new ReviewcsDTO();
										
										rdto.setRev_no(rs.getInt("rev_no"));
										rdto.setS_no(rs.getInt("s_no"));
										rdto.setM_no(rs.getInt("m_no"));
										rdto.setRev_subject(rs.getString("rev_subject"));
										rdto.setRev_content(rs.getString("rev_content"));
										rdto.setRev_date(rs.getTimestamp("rev_date"));
										rdto.setRev_star(rs.getInt("rev_star"));
										rdto.setRev_category(rs.getInt("rev_category"));
										rdto.setRev_file(rs.getString("rev_file"));
										rdto.setRev_c_re(rs.getString("rev_c_re"));
										rdto.setRev_c_date(rs.getTimestamp("rev_c_date"));	
										rdto.setS_name(rs.getString("s_name"));
										rdto.setM_nickname(rs.getString("m_nickname"));
										rdto.setDate(rs.getString("date"));
										
										reList.add(rdto);
									}
								}
							} else {
								if(s.equals("0")){
									sql =  "select s.s_name,m.m_nickname , r.*, date_format(r.rev_date,'%Y-%m-%d') as date "
											+ "from store s join ceo c on s.c_no = c.c_no "
											+ "join reviewcs r on s.s_no = r.s_no "
											+ "join member m on r.m_no = m.m_no "
											+ "where c.c_id=? && r.s_no=? "
											+ "order by " + listType + " desc limit ?,?";
									pstmt = con.prepareStatement(sql);
									
									pstmt.setString(1, id);
									pstmt.setInt(2, sno2);
									pstmt.setInt(3, startRow-1); // 시작행 -1
									pstmt.setInt(4, pageSize); // 개수
									
									rs = pstmt.executeQuery();
									
									// 데이터처리
									while(rs.next()) {
										ReviewcsDTO rdto = new ReviewcsDTO();
										
										rdto.setRev_no(rs.getInt("rev_no"));
										rdto.setS_no(rs.getInt("s_no"));
										rdto.setM_no(rs.getInt("m_no"));
										rdto.setRev_subject(rs.getString("rev_subject"));
										rdto.setRev_content(rs.getString("rev_content"));
										rdto.setRev_date(rs.getTimestamp("rev_date"));
										rdto.setRev_star(rs.getInt("rev_star"));
										rdto.setRev_category(rs.getInt("rev_category"));
										rdto.setRev_file(rs.getString("rev_file"));
										rdto.setRev_c_re(rs.getString("rev_c_re"));
										rdto.setRev_c_date(rs.getTimestamp("rev_c_date"));							
										rdto.setS_name(rs.getString("s_name"));
										rdto.setM_nickname(rs.getString("m_nickname"));
										rdto.setDate(rs.getString("date"));
										
										reList.add(rdto);
										
									} // while 끝
								} else if(s.equals("1")) {
								
									sql =  "select s.s_name,m.m_nickname , r.*, date_format(r.rev_date,'%Y-%m-%d') as date "
											+ "from store s join ceo c on s.c_no = c.c_no "
											+ "join reviewcs r on s.s_no = r.s_no "
											+ "join member m on r.m_no = m.m_no "
											+ "where c.c_id=? && r.s_no=? "
											+ "order by " + listType + " asc limit ?,?";
									pstmt = con.prepareStatement(sql);
									
									pstmt.setString(1, id);
									pstmt.setInt(2, sno2);
									pstmt.setInt(3, startRow-1); // 시작행 -1
									pstmt.setInt(4, pageSize); // 개수
									
									rs = pstmt.executeQuery();
									
									// 데이터처리
									while(rs.next()) {
										ReviewcsDTO rdto = new ReviewcsDTO();
										
										rdto.setRev_no(rs.getInt("rev_no"));
										rdto.setS_no(rs.getInt("s_no"));
										rdto.setM_no(rs.getInt("m_no"));
										rdto.setRev_subject(rs.getString("rev_subject"));
										rdto.setRev_content(rs.getString("rev_content"));
										rdto.setRev_date(rs.getTimestamp("rev_date"));
										rdto.setRev_star(rs.getInt("rev_star"));
										rdto.setRev_category(rs.getInt("rev_category"));
										rdto.setRev_file(rs.getString("rev_file"));
										rdto.setRev_c_re(rs.getString("rev_c_re"));
										rdto.setRev_c_date(rs.getTimestamp("rev_c_date"));							
										rdto.setS_name(rs.getString("s_name"));
										rdto.setM_nickname(rs.getString("m_nickname"));
										rdto.setDate(rs.getString("date"));
										
										reList.add(rdto);
										
									} // while 끝
								}
								
							}
							
						} catch (Exception e) {
							e.printStackTrace();
						} finally {
							closeDB();
						}
						
						return reList;
					} // 사업자 가게별 리뷰 리스트 - getCeoRevList
					
					
					// 리뷰 1개 정보 조회 - reviewInfo(res_no)
					public ReviewcsDTO reviewInfo(int res_no) {
						ReviewcsDTO rdto = null;
						
						try {
							con = getConnection();
							
							sql = "select m_nickname, r.*, date_format(r.rev_date,'%Y-%m-%d') as date, "
									+ "date_format(r.rev_c_date,'%Y-%m-%d') as c_date "
									+ "from reviewcs r "
									+ "join member m on r.m_no = m.m_no "
									+ "where r.rev_no=? ";
							pstmt=con.prepareStatement(sql);
							
							pstmt.setInt(1, res_no);
							
							rs = pstmt.executeQuery();
							
							// 데이터 처리
							if(rs.next()) {
								rdto = new ReviewcsDTO();
								
								rdto.setRev_no(rs.getInt("rev_no"));
								rdto.setS_no(rs.getInt("s_no"));
								rdto.setM_no(rs.getInt("m_no"));
								rdto.setRev_subject(rs.getString("rev_subject"));
								rdto.setRev_content(rs.getString("rev_content"));
								rdto.setRev_date(rs.getTimestamp("rev_date"));
								rdto.setRev_star(rs.getInt("rev_star"));
								rdto.setRev_category(rs.getInt("rev_category"));
								rdto.setRev_file(rs.getString("rev_file"));
								rdto.setRev_c_re(rs.getString("rev_c_re"));
								rdto.setRev_c_date(rs.getTimestamp("rev_c_date"));
								rdto.setM_nickname(rs.getString("m_nickname"));
								rdto.setDate(rs.getString("date"));
//								rdto.setC_date(rs.getString("c_date"));
								
							}
							
						} catch (Exception e) {
							e.printStackTrace();
						} finally {
							closeDB();
						}
						
						return rdto;
					}
					
					
					// ceo 답글 쓰기/수정 - ceoReply()
					public int ceoReply(int rev_no,String reply) {
						int result=0;
						try {
							con = getConnection();
							
							sql = "update reviewcs set rev_c_re=?, "
									+ "rev_c_date=now() "
									+ "where rev_no=?";
							pstmt = con.prepareStatement(sql);
							
							pstmt.setString(1, reply);
							pstmt.setInt(2, rev_no);
								
							pstmt.executeUpdate();
							
							result=1;
							
						} catch (Exception e) {
							e.printStackTrace();
						} finally {
							closeDB();
						}
						
						return result;
					} // ceo 답글 쓰기/수정 - ceoReply()
					
					
					// ceo 답글 삭제 - ceoReDelete()
					public int ceoReDelete(int rev_no) {
						int result=0;
						
						try {
							con = getConnection();
							
							sql = "update reviewcs set rev_c_re=null, "
									+ "rev_c_date=null "
									+ "where rev_no=?";
							pstmt = con.prepareStatement(sql);
							
							pstmt.setInt(1, rev_no);
							
							pstmt.executeUpdate();
							
							result=1;
							
						} catch (Exception e) {
							e.printStackTrace();
						} finally {
							closeDB();
						}
						
						
						return result;
					}
					
					// ceo 회원정보 수정 - ceoInfoUpdate(dto)
					public int ceoInfoUpdate(CeoDTO dto) {
						int result=-1;
						
						try {
							con = getConnection();
							
							sql = "update ceo set c_name=?, c_nickname=?, c_tel=?, c_pw=? "
									+ "where c_no=?";
							pstmt = con.prepareStatement(sql);
							
							pstmt.setString(1, dto.getC_name());
							pstmt.setString(2, dto.getC_nickName());
							pstmt.setString(3, dto.getC_tel());
							pstmt.setString(4, dto.getC_pw());
							pstmt.setInt(5, dto.getC_no());
							
							pstmt.executeUpdate();
									
							result = 1;
							System.out.println(" DAO : 회원수정 완료 ");
							
						} catch (Exception e) {
							e.printStackTrace();
						} finally {
							closeDB();
						}
						
						return result;
						
					}
					
					// ceo 회원정보 삭제 - ceoDelete(c_no,pw)
					public int ceoDelete(int c_no,String pw) {
						int result = -1;
						
						try {
							con = getConnection();

							sql = "select c_pw from ceo where c_no=? ";
							pstmt = con.prepareStatement(sql);
							
							pstmt.setInt(1, c_no);
							
							rs = pstmt.executeQuery();
							
							// 데이터 처리
							if(rs.next()) {
								if(pw.equals(rs.getString("c_pw"))) {
								sql = "delete from ceo where c_no=?";
								pstmt = con.prepareStatement(sql);
							
								pstmt.setInt(1, c_no);
							
								pstmt.executeUpdate();
								
								result =1;
								
								} else {
									result = 0;
								}
							} else {
								result=-1;
							}
							
							System.out.println(" DAO : ceo 회원탈퇴 완료 ");
							
						} catch (Exception e) {
							e.printStackTrace();
						} finally {
							closeDB();
						}
						return result;
					}		
							// 어드민 점주 회원리스트 받기
					
					/** 가게 목록 가져오기 - getStoreList(id, listType, startRow,pageSize)
					 *  가게 조회와 정렬, 페이징 처리하는 메서드. id, listType, startRowm pageSize
					 *  리턴값 o, List 배열
					 * @param id
					 * @param listType
					 * @param startRowm
					 * @param pageSize
					 * @return
					 */
					public List getStoreList(String id,String listType,int startRow,int pageSize,String s) {
						// 가게 목록 저장 List
						List storeList = new ArrayList();
						
						
						try {
							con = getConnection();
							
							if(s.equals("0")) {
							sql = "select c.c_id, s.*, "
									+ "(select count(*) from bookmark b where s.s_no = b.s_no) bcount, "
									+ "(select count(*) from reviewcs r where s.s_no = r.s_no) rcount "
									+ "from store s Join ceo c "
									+ "on c.c_no = s.c_no where c.c_id=? "
									+ "order by " + listType + " desc, s.s_no desc limit ?,?";
							pstmt = con.prepareStatement(sql);
							
							pstmt.setString(1, id);
							pstmt.setInt(2, startRow-1); // 시작행 -1
							pstmt.setInt(3, pageSize); // 개수
							
							rs = pstmt.executeQuery();
							
							while(rs.next()) {
								// DB -> DTO -> List
								StoreDTO sdto = new StoreDTO();
								
								sdto.setS_no(rs.getInt("s_no"));
								sdto.setS_name(rs.getString("s_name"));
								sdto.setS_addr(rs.getString("s_addr"));
								sdto.setS_tel(rs.getString("s_tel"));
								sdto.setS_hours(rs.getString("s_hours"));
								sdto.setS_type(rs.getString("s_type"));
								sdto.setS_image(rs.getString("s_image"));
								sdto.setS_content(rs.getString("s_content"));
								sdto.setS_facility(rs.getString("s_facility"));
								sdto.setS_latitude(rs.getString("s_latitude"));
								sdto.setS_longtude(rs.getString("s_longtude"));
								sdto.setS_menuname(rs.getString("s_menuname"));
								sdto.setS_menuprice(rs.getString("s_menuprice"));
								sdto.setS_menuImg(rs.getString("s_menuImg"));
								sdto.setS_number(rs.getInt("s_number"));
								sdto.setC_no(rs.getInt("c_no"));
								sdto.setS_star(rs.getDouble("s_star"));
								sdto.setS_regdate(rs.getTimestamp("s_regdate"));
								sdto.setBcount(rs.getInt("bcount"));
								sdto.setRcount(rs.getInt("rcount"));
								
								// DTO -> List
								storeList.add(sdto);
								
							} // while
							
//							System.out.println(" DAO : 가지고 있는 가게 수 : "+storeList.size());
							} else if(s.equals("1")) {
								sql = "select c.c_id, s.*, "
										+ "(select count(*) from bookmark b where s.s_no = b.s_no) bcount, "
										+ "(select count(*) from reviewcs r where s.s_no = r.s_no) rcount "
										+ "from store s Join ceo c "
										+ "on c.c_no = s.c_no where c.c_id=? "
										+ "order by " + listType + " asc, s.s_no desc limit ?,?";
								pstmt = con.prepareStatement(sql);
								
								pstmt.setString(1, id);
								pstmt.setInt(2, startRow-1); // 시작행 -1
								pstmt.setInt(3, pageSize); // 개수
								
								rs = pstmt.executeQuery();
								
								while(rs.next()) {
									// DB -> DTO -> List
									StoreDTO sdto = new StoreDTO();
									
									sdto.setS_no(rs.getInt("s_no"));
									sdto.setS_name(rs.getString("s_name"));
									sdto.setS_addr(rs.getString("s_addr"));
									sdto.setS_tel(rs.getString("s_tel"));
									sdto.setS_hours(rs.getString("s_hours"));
									sdto.setS_type(rs.getString("s_type"));
									sdto.setS_image(rs.getString("s_image"));
									sdto.setS_content(rs.getString("s_content"));
									sdto.setS_facility(rs.getString("s_facility"));
									sdto.setS_latitude(rs.getString("s_latitude"));
									sdto.setS_longtude(rs.getString("s_longtude"));
									sdto.setS_menuname(rs.getString("s_menuname"));
									sdto.setS_menuprice(rs.getString("s_menuprice"));
									sdto.setS_menuImg(rs.getString("s_menuImg"));
									sdto.setS_number(rs.getInt("s_number"));
									sdto.setC_no(rs.getInt("c_no"));
									sdto.setS_star(rs.getDouble("s_star"));
									sdto.setS_regdate(rs.getTimestamp("s_regdate"));
									sdto.setBcount(rs.getInt("bcount"));
									sdto.setRcount(rs.getInt("rcount"));
									
									// DTO -> List
									storeList.add(sdto);
							}
								
							}
						} catch (Exception e) {
							e.printStackTrace();
						} finally {
							closeDB();
						}
						
						return storeList;
					}
}
