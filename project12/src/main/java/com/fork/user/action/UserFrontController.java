package com.fork.user.action;

import java.io.IOException;




import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.us")
public class UserFrontController extends HttpServlet {
	
		protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println(" C : doPorcess() 호출 ");
			
			// 1. 가상주소 계산
				String requestURI = request.getRequestURI();
				System.out.println(" C : requestURI : " + requestURI);
				
				String ctxPath = request.getContextPath();
				System.out.println(" C : ctxPath : " + ctxPath);
				
				String command = requestURI.substring(ctxPath.length());
				System.out.println(" C : command : " + command);
				
				System.out.println(" C : 1. 가상주소 계산 끝 \n");
				
				Action action = null;
				ActionForward forward = null;
				
				// 2. 가상주소 매핑(패턴 1,2,3)
				
				// 메인페이지 호출
				if(command.equals("/Main.us")) {
					System.out.println(" C : /Main.us 호출 ");
					System.out.println(" C : 패턴1) DB 사용 x, view 이동 ");
					
					forward = new ActionForward();
					forward.setPath("./main/main.jsp");
					forward.setRedirect(false);
				} 
				
				// 회원가입 페이지 이동
				else if(command.equals("/Join.us")) {
					System.out.println(" C : /Join.us 호출 ");
					System.out.println(" C : 패턴1) DB 사용 x, view 이동 ");
					
					forward = new ActionForward();
					forward.setPath("./member/join.jsp");
					forward.setRedirect(false);
				}
				
				// 회원가입 액션페이지 이동
				else if(command.equals("/JoinAction.us")) {
					System.out.println(" C : /JoinAction.us .호출 ");
					System.out.println(" C : 패턴2) DB 사용 o, 페이지 이동 ");
					
					// StoreJoinAction() 객체
					action = new JoinAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				
				// 중복체크 액션페이지 이동
				else if(command.equals("/DCheckAction.us")) {
					
					System.out.println(" C : /DCheckAction.us 호출 ");
					System.out.println(" C : 패턴3) DB사용O, view페이지 출력");
					
					// DCheckAction() 객체
					action = new DCheckAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
				
				}
				
				else if(command.equals("/loginAction.us")) {
					
					System.out.println(" C : /DCheckAction.us 호출 ");
					System.out.println(" C : 패턴3) DB사용O, view페이지 출력");
					
					// DCheckAction() 객체
					action = new LoginAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
				
				}
				
				else if(command.equals("/LogoutAction.us")) {
					
					System.out.println(" C : /DCheckAction.us 호출 ");
					System.out.println(" C : 패턴3) DB사용O, view페이지 출력");
					
					// DCheckAction() 객체
					action = new LogoutAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
				
				}
				
//				else if(command.equals("/StMyPage.on")) {
//					System.out.println(" C : /StMyPage.on 호출 ");
//					System.out.println(" C : 패턴1) DB 사용 x, view 이동 ");
//					
//					forward = new ActionForward();
//					forward.setPath("./member/myPage.jsp");
//					forward.setRedirect(false);
//				} 
				
				///// 이메일 인증 //////
				else if(command.equals("/MemberEmailCheck.us")) {
					System.out.println(" C : /MemberEmailCheck.us 호출");
					System.out.println(" C : 패턴1) DB사용X, view이동");
					
					forward = new ActionForward();
					forward.setPath("./member/emailCheck.jsp");
					forward.setRedirect(false);			
				}

				else if(command.equals("/MemberEmailCheckAction.us")) {
					System.out.println(" C : /MemberEmailCheckAction.us 호출 ");
					System.out.println(" C : 패턴3) DB사용O, view페이지 출력");

					// MemberIdCheckAction() 객체 생성
					action = new MemberEmailCheckAction();

					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}			
				}
				
				//////// 이메일 인증 /////////
				
				/// 관리자페이지(어드민 가게 목록)
				else if(command.equals("/adminStoreList.us")) {
					
					action = new AdminStoreListAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					
				}
				/// 관리자페이지(어드민 가게 목록)
				
				/// 관리자 페이지 (어드민 일반 회원 목록)
				else if(command.equals("/adminGenMemList.us")) {
					
					action = new AdminGenMemberListAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
				/// 관리자 페이지 (어드민 일반 회원 목록)
				
				else if(command.equals("/adminDeleteGenMemAction.us")) {
					
					action = new AdminDelGenMemberAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
				
				else if(command.equals("/adminCeoMemList.us")) {
					
					action = new AdminCeoMemberListAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
				
				else if(command.equals("/adminDeleteCeoMemAction.us")) {
					
					action = new AdminDelCeoMemberAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
				
				else if(command.equals("/adminReportList.us")) {
					
					action = new AdminReportListAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
				
				else if(command.equals("/adminDeleteReportAction.us")) {
					
					action = new AdminDeleteReportAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
				
				else if(command.equals("/adminNoticeList.us")) {
					
					action = new AdminNoticeListAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
				
				
				else if(command.equals("/adminDeleteNoticeAction.us")) {
					
					action = new AdminDeleteNoticeAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
				
				else if(command.equals("/adminNoticeWrite.us")) {
					
					forward = new ActionForward();
					forward.setPath("./admin/adminNoticeWrite.jsp");
					forward.setRedirect(false);	
					
				}
				
				else if(command.equals("/adminNoticeWriteAction.us")) {
					
					action = new AdminNoticeWriteAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
				else if(command.equals("/adminGenMemDetail.us")) {
					
					action = new AdminGenMemdetailAction();
					
					try {
						forward = action.execute(request, response);
	
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
				else if(command.equals("/genMemReservMsg.us")) {
					
					
				forward = new ActionForward();
				forward.setPath("./admin/genMemReservMsg.jsp");
				forward.setRedirect(false);
				}
				
				//회원 마이 페이지(메인페이지)
			else if(command.equals("/MemberMypageMain.us")) {
			System.out.println(" C : /MemberMypageMain.us 호출 ");
			System.out.println(" C : 패턴1) DB 사용 x, view 이동 ");
			
			forward = new ActionForward();
			forward.setPath("./mypage/myPage.jsp");
			forward.setRedirect(false);
			}
			//회원 마이 페이지(메인페이지)
			
			
			//회원 마이 페이지(예약내역)
			else if(command.equals("/MemberReserve.us")) {
			System.out.println(" C : /MemberReserve.us 호출 ");
			System.out.println(" C : 패턴1) DB 사용 x, view 이동 ");
			
			forward = new ActionForward();
			forward.setPath("./mypage/myPage_book.jsp");
			forward.setRedirect(false);
			}
			//회원 마이 페이지(예약내역)
			
			
			
			//회원 마이 페이지(리뷰관리)
			else if(command.equals("/MemberReviewEdit.us")) {
			System.out.println(" C : /MemberReviewEdit.us 호출 ");
			System.out.println(" C : 패턴1) DB 사용 x, view 이동 ");
			
			forward = new ActionForward();
			forward.setPath("./mypage/myPage_review.jsp");
			forward.setRedirect(false);
			}
			//회원 마이 페이지(리뷰관리)
			
			
			
			//회원 마이 페이지(찜한매장)
			else if(command.equals("/MemberWish.us")) {
			System.out.println(" C : /MemberWish.us 호출 ");
			System.out.println(" C : 패턴1) DB 사용 x, view 이동 ");
			
			forward = new ActionForward();
			forward.setPath("./mypage/myPage_st.jsp");
			forward.setRedirect(false);
			}
			//회원 마이 페이지(찜한매장)
			
			//회원 마이 페이지(찜한매장삭제)
			else if(command.equals("/MemberWishDelete.us")) {
			System.out.println(" C : /MemberWishDelete.us 호출 ");
			System.out.println(" C : 패턴1) DB 사용 x, view 이동 ");
			
			forward = new ActionForward();
			forward.setPath("./mypage/myPage_wish_delete.jsp");
			forward.setRedirect(false);
			}
			//회원 마이 페이지(찜한매장삭제)
				
			// 로그인 페이지 이동
			else if(command.equals("/Login.us")) {
				System.out.println(" C : /Login.us 호출 ");
				System.out.println(" C : 패턴1) DB 사용 x, view 이동 ");
				
				forward = new ActionForward();
				forward.setPath("./main/login.jsp");
				forward.setRedirect(false);
			}
				
////////////////ceo 마이페이지 ////////////////////////////
			else if(command.equals("/CeoMyPage.us")) {
				System.out.println(" C : /CeoMyPage.us 호출 ");
				System.out.println(" C : 패턴3) DB사용o, 페이지출력 ");
				
				action = new CeoMypageAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} 
				
				
			else if(command.equals("/CeoMyPage_st.us")) {
				System.out.println(" C : /CeoMyPage_st.us 호출 ");
				System.out.println(" C : 패턴3) DB사용o, 페이지출력 ");
				
				action = new CeoMypage_stAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} 
				
			else if(command.equals("/CeoMyPage_reserv.us")) {
				System.out.println(" C : /CeoMyPage_reserv.us 호출 ");
				System.out.println(" C : 패턴3) DB사용o, 페이지출력 ");
				
				action = new CeoMypage_reservAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
				} 
				
				else if(command.equals("/CeoMyPage_re.us")) {
					System.out.println(" C : /CeoMyPage_re.us ");
					System.out.println(" C : 패턴1) DB 사용 x, view 이동 ");
					
					forward = new ActionForward();
					forward.setPath("./member/ceoMyPage_review.jsp");
					forward.setRedirect(false);
				} 
				
				
				
				
				// 관리자페이지
				System.out.println(" C : 2. 가상주소 매핑(패턴 1,2,3) 끝 \n");
				
				// 3. 페이지 이동
				if(forward != null) {
					if(forward.isRedirect()) { // true
						System.out.println(" C : sendRedirect() : " + forward.getPath());
						response.sendRedirect(forward.getPath());
					} else { // false
						System.out.println(" C : forward() : " + forward.getPath());
						RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
						dis.forward(request, response);
					}
				}
				
				System.out.println(" C : 3. 페이지 이동 끝 \n");
				
			}
		
		@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println(" C : doGet() ");
			doProcess(request, response);
		}

		@Override
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println(" C : doPost() ");
			doProcess(request, response);
		}
		
	}
