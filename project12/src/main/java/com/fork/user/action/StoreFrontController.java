package com.fork.user.action;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.us")
public class StoreFrontController extends HttpServlet {
	
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
