package com.semi.board.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.re")
public class BoardFrontController extends HttpServlet{
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// 1. 가상주소 계산
		String requestURI = request.getRequestURI();
		System.out.println("C : requestURI : "+requestURI);
		String ctxPath = request.getContextPath();
		System.out.println("C : ctxPath : "+ctxPath);
		String command = requestURI.substring(ctxPath.length());
		System.out.println("C : commend : "+command);
		
		System.out.println("C : 1. 가상주소 계산 끝 -콘솔창 주소와 매핑 비교 \n");
		
		// 2. 가상주소 매핑(패턴1,2,3)
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/main.re")) {
			System.out.println("C : /main.re 호출");
			System.out.println("C : [패턴1] DB X, view");
			
			forward = new ActionForward();
			forward.setPath("./main/main.jsp");
			forward.setRedirect(false);
		}
		
		else if(command.equals("/loginForm.re")) {
			
			forward = new ActionForward();
			forward.setPath("./main/login.jsp");
			forward.setRedirect(false);
		}
		
		else if(command.equals("/registerForm.re")) {
			
			forward = new ActionForward();
			forward.setPath("./main/register.jsp");
			forward.setRedirect(false);
		}
		
		else if(command.equals("/boardList.re")) {
			
			forward = new ActionForward();
			forward.setPath("./board/storeList.jsp");
			forward.setRedirect(false);
		}
		
		
		
		// 3. 페이지 이동
		if(forward != null) {
			if(forward.isRedirect()) { // true (sendRedirect 방식)
				System.out.println("C : sendRedirect() : "+forward.getPath());
				response.sendRedirect(forward.getPath());
			} else { // false (forward 방식)
				// RequestDispatcher는 인터페이스이므로 직접 호출 불가 -> request 내장객체 사용
				System.out.println("C : forward() : "+forward.getPath());
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		System.out.println("C : 3. 페이지 이동 끝 \n");
		}
		
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
		System.out.println("doGet() 호출");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
		System.out.println("doPost() 호출");
	}
	
	
}
