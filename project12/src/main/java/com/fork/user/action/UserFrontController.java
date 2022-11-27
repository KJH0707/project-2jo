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
				
				else if(command.equals("/adminDeletePaymentAction.us")) {
					
					action = new AdminDelPaymentAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
				/// 관리자 페이지 (어드민 일반 회원 목록)
				
				else if(command.equals("/adminDeleteReservAction.us")) {
					
					action = new AdminDeleteReservAction();
					
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
				
				else if(command.equals("/adminEventList.us")) {
									
					action = new AdminEventListAction();
					
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
				
				else if(command.equals("/adminCeoMemDetail.us")) {
					
					action = new AdminCeoMemDetailAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			
			
			
			
			
			//회원 정보 수정
			else if(command.equals("/MemberInfoEdit.us")) {
				System.out.println(" C : ./MemberInfoEdit.us 호출 ");
				System.out.println(" C : 패턴3) DB사용o, 페이지출력");
				
				// MemberUpdateAction
				action = new MemberInfoEditAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
				
			else if(command.equals("/KaKaoJoin.us")) {
				System.out.println(" C : /KaKaoJoin.us 호출 ");
				System.out.println(" C : 패턴1) DB 사용 x, view 이동 ");
				
				forward = new ActionForward();
				forward.setPath("./main/addInfo.jsp");
				forward.setRedirect(false);
			}
			
				
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
				System.out.println(" C : /CeoMyPage_re.us 호출 ");
				System.out.println(" C : 패턴3) DB사용o, 페이지출력 ");
				
				action = new CeoMypage_revAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} 
				
				else if(command.equals("/GenMemDetailReport.us")) {
					
					action = new AdminReportListAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
				
				else if(command.equals("/adminGenMemDetailReview.us")) {
					
					action = new AdminGenMemDetailReviewAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				} 
				
				else if(command.equals("/ceoMemLocation.us")) {
					forward = new ActionForward();
					forward.setPath("./admin/ceoMemStoreLocation.jsp");
					forward.setRedirect(false);
				}

				else if(command.equals("/adminReservList.us")) {
					
					action = new AdminReservListAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				else if(command.equals("/CeoMyPage_reDetail.us")) {
					System.out.println(" C : /CeoMyPage_reDetail.us 호출 ");
					System.out.println(" C : 패턴3) DB사용o, 페이지출력 ");
					
					action = new CeoMypage_revDetailAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
				} 
				
				// ceo 회원정보 관리
				else if(command.equals("/CeoMyPage_Info.us")) {
					System.out.println(" C : CeoMyPage_Info.us 호출");
					System.out.println(" C : 패턴3 ");
					
					action = new CeoInfoUpdateAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
				} 
				
				// ceo 회원정보 수정
				else if(command.equals("/CeoMyPage_InfoUpdate.us")) {
					System.out.println(" C : /CeoMyPage_InfoUpdate.us 호출 ");
					System.out.println(" C : 패턴2 ");
					
					// MemberUpdatePro 객체 생성
					action = new CeoInfoUpdateProAction();
					
					try {
						forward=action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				
				// ceo 회원정보 삭제
				else if(command.equals("/CeoDeleteAction.us")) {
					System.out.println(" C : /CeoDeleteAction 호출 ");
					System.out.println(" C : 패턴2 ");
					
					// MemberUpdatePro 객체 생성
					action = new CeoDeleteAction();
					
					try {
						forward=action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				// 관리자페이지
				else if(command.equals("/adminPaymentList.us")) {
					// MemberUpdatePro 객체 생성
					action = new AdminPaymentListAction();
					
					try {
						forward=action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				else if(command.equals("/MemberInfoEditPro.us")) {
					System.out.println(" C : /MemberInfoEditPro.us 호출");
					System.out.println(" C : 패턴2) DB사용 O, 페이지이동");
					// MemberUpdateProAction() 객체 
					action = new MemberInfoEditProAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				
				//회원 정보 수정


				// 회원정보수정 액션페이지 이동
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


				
				//회원 프로필
			else if(command.equals("/MemberMypageMain.us")) {
				System.out.println(" C : ./MemberMypageMain.us 호출 ");
				System.out.println(" C : 패턴3) DB사용o, 페이지출력");
				
				// MemberProfileAction
				action = new MemberProfileAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}


			//마이페이지 (예약내역)
            else if(command.equals("/MemberReserve.us")) {
                System.out.println(" C : /MemberReserve.us 호출");
                System.out.println(" C : 패턴3) ");
                
                //ReserveListAction() 객체
                action = new ReserveListAction();
                
                try {
                    forward = action.execute(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                
            }
            // 마이페이지 (예약내역)
				// 가게정보 삭제
			else if(command.equals("/DeleteStoreAction.us")) {
				System.out.println(" C : /DeleteStoreAction 호출 ");
				System.out.println(" C : (패턴2)");
				
				// BoardDeleteAction() 객체
				action = new DeleteStoreAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} // 가게정보 삭제
			
			// 예약거절
			else if(command.equals("/refuselReservAction.us")) {
				System.out.println(" C : /refuseReservationAction 호출 ");
				System.out.println(" C : (패턴2) ");
				
				action = new RefuseReservAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			// ceo 답글 작성,수정
			else if(command.equals("/CeoReWriteAction.us")) {
				System.out.println(" C : CeoReWriteAction.us 호출 ");
				System.out.println(" C : (패턴2) ");
				
				action = new CeoReWriteAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			// ceo 답글 삭제
			else if(command.equals("/CeoReDeleteAction.us")) {
				System.out.println(" C : CeoReDeleteAction.us 호출 ");
				System.out.println(" C : (패턴2) ");
				
				action = new CeoReDeleteAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
        
    //회원 마이 페이지(리뷰관리)
    
    else if(command.equals("/MemberReviewEdit.us")) {
        System.out.println(" C : /MemberReviewEdit.us  호출 ");
        System.out.println(" C : [패턴3] DB사용o, view출력");
        
        // ReviewListAction 객체 생성
        action = new ReviewListAction();
        
        try {
            forward = action.execute(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    } 
    
    //회원 마이 페이지(리뷰관리)

            
        
        
        //회원 마이 페이지(찜한매장)
        else if(command.equals("/MemberWish.us")) {
        	System.out.println(" C : /MemberWish.us 호출 ");
            System.out.println(" C : [패턴3] DB사용o, view출력");
            
            // WishListAction 객체 생성
            action = new WishListAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
            
        } 
        //회원 마이 페이지(찜한매장)
		
        else if(command.equals("/adminSanction.us")) {
        	forward = new ActionForward();
			forward.setPath("./admin/adminSanction.jsp");
			forward.setRedirect(false);
            
            
        } 
        
        else if(command.equals("/adminSanctionPro.us")) {
        	
        	action = new AdminSanctionProAction();
            
            try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        } 		
				
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
