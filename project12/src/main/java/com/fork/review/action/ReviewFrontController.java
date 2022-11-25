package com.fork.review.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("*.rv")
public class ReviewFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" Store - doProcess()");
		
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
				
				if (command.equals("/ReviewWrite.rv")) {

					forward = new ActionForward();
					forward.setPath("./board/reviewWrite.jsp");
					forward.setRedirect(false);

					// 리뷰 액션 페이지 이동
				} else if (command.equals("/ReviewWriteAction.rv")) {
					System.out.println(" C : /ReviewWriteAction.rv 호출 ");
					System.out.println(" C : [패턴2] DB사용 O, 페이지 이동(화면전환)");

					action = new ReviewWriteAction();

					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
				} // ReviewWriteAction.rv
				else if(command.equals("/ReviewList.rv")) {
					System.out.println(" C : /ReviewList.rv  호출 ");
					System.out.println(" C : [패턴3] DB사용o, view출력");
					
					// BoardListAction 객체 생성
					action = new ReviewListAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
					
				} // BoardList.bo
				
				else if(command.equals("/ReviewUpdate.rv")) {
					System.out.println(" C : /ReviewUpdate.rv 호출 ");
					System.out.println(" C : [패턴3] DB사용o, view출력");
					
					// BoardUpdateAction 객체
					action = new ReviewUpdateAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				else if(command.equals("/ReviewUpdateProAction.rv")) {
					System.out.println(" C : /ReviewUpdateProAction.rv 호출 ");
					System.out.println(" C : [패턴2] DB사용 O, 페이지 이동(화면전환)");
					
					// BoardUpdateProAction 객체 생성
					action = new ReviewUpdateProAction();
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
					
				}else if(command.equals("/ReviewDelete.rv")) {
					System.out.println(" C : /ReviewDeleteAction.rv 호출 ");
					System.out.println(" C : [패턴2] DB사용 O, 페이지 이동(화면전환)");
					
					// reviewDeleteAction 객체 생성
					action = new ReviewDeleteAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
					
				}else if(command.equals("/influencer.rv")) {

					forward = new ActionForward();
					forward.setPath("./board/influencer-profile.jsp");
					forward.setRedirect(false);

				}else if(command.equals("/reviewReply.rv")) {
					System.out.println(" C : reviewReply.rv 호출 ");
					System.out.println("C : [패턴1] DB 사용 x, view 페이지 이동");
				
					forward = new ActionForward();
					forward.setPath("./board/reviewReply.jsp");
					forward.setRedirect(false);
					
					
				}else if(command.equals("/ReviewReplyAction.rv")) {
				    System.out.println(" C : reviewReplyAction 호출 ");
				    System.out.println(" C : [패턴2] DB 사용 O , 페이지 이동 (화면전환)");   //다른 페이지로 넘어 가게 하는 패턴 2

				    //BoardReWriteAction() 객체 - execute ()

				    action = new ReviewReplyAction();

				    try {
				        forward = action.execute(request, response);
				    } catch (Exception e) {
				        // TODO Auto-generated catch block
				        e.printStackTrace();
				    }

				}
				
				
				System.out.println(" C : 2. 가상주소 매핑 끝 \n");
				// 3. 페이지 이동
				if(forward != null) {
					if(forward.isRedirect()) { // true
						System.out.println(" C : sendRedirect() : " + forward.getPath());
						response.sendRedirect(forward.getPath());
					}else {	// false
						System.out.println(" C : forward() : " + forward.getPath());
						RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
						dis.forward(request, response);
					}
				}
				System.out.println(" C : 3. 페이지 이동 끝 \n");
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" Store - doGet()");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" Store - doPost()");
		doProcess(request, response);

	}

	
}
