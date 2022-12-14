package com.fork.store.action;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fork.board.action.UserReservAction;




@WebServlet("*.st")
public class StoreFrontController extends HttpServlet {

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
				
				// 2. 가상주소 매핑(패턴1,2,3)
				if(command.equals("/main.st")) {
					System.out.println("C :  main.st 호출");
					
					action = new MainAction();
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				
				else if(command.equals("/loginForm.st")) {
					
					forward = new ActionForward();
					forward.setPath("./main/login.jsp");
					forward.setRedirect(false);
				}
				
				else if(command.equals("/registerForm.st")) {
					
					forward = new ActionForward();
					forward.setPath("./main/register.jsp");
					forward.setRedirect(false);
					
				}
				
				else if(command.equals("/storeList.st")) {
					
					action = new StoreListAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
				
				else if(command.equals("/storeDetails.st")) {
					
					action = new StoreDetailsAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					
				}
				
				else if(command.equals("/StoreJoinProAction.st")) {
					System.out.println(" C : /StoreJoinProAction.st 호출");
					System.out.println(" C : [패턴2] "); // 리다이렉션
					
					// StoreJoinAction()
					action = new StoreJoinProAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
					
				}

				else if(command.equals("/StoreJoin.st")) {
					System.out.println(" C : /StoreJoin.st 호출");
					
					action = new StoreJoinAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
					
				}
				
				else if(command.equals("/StoreUpdate.st")) {
					System.out.println(" C : /StoreUpdate.st 호출");
					
					action = new StoreUpdateAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
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
