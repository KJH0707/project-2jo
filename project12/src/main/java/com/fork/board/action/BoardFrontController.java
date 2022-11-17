package com.fork.board.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.br")
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
		
		// 메인페이지
		if(command.equals("/main.br")) {
			System.out.println("C : /main.st 호출");
			System.out.println("C : [패턴1] DB X, view");
			
			forward = new ActionForward();
			forward.setPath("./main/main.jsp");
			forward.setRedirect(false);
		}
		
		// qna 문의 글 폼
		else if(command.equals("/QnaWrite.br")) {
			forward = new ActionForward();
			forward.setPath("./qnaBoard/qnaWrite.jsp");
			forward.setRedirect(false);
		}
		
		// qna 문의 글 쓰기
		else if(command.equals("/QnaBoardWriteAction.br")) {
			action = new QnaBoardWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// qna 목록 가기
		else if(command.equals("/QnaList.br")) {
			action = new QnaListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// qna 글 보기
		else if(command.equals("/QnaContent.br")) {
			System.out.println("C : QnaContent.br 호출");
			action = new QnaContentAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// qna 답변(re) 글 폼
		else if(command.equals("/QnaReWrite.br")) {
			forward = new ActionForward();
			forward.setPath("./qnaBoard/qnaReWrite.jsp");
			forward.setRedirect(false);
		}
		
		// qna 글 수정 폼 
		else if(command.equals("/QnaUpdate.br")) {
			System.out.println("C : QnaUpdate.br 폼 호출");
			action = new QnaBoardUpdate();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// qna 글 수정하기 
		else if(command.equals("/QnaBoardUpdateAction.br")) {
			System.out.println("C : QnaBoardUpdateAction.br 수정 호출");
			action = new QnaBoardUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// qna 글 삭제하기
		else if(command.equals("/QnaDelete.br")) {
			action = new QnaDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		else if(command.equals("/book.br")) {
			System.out.println(" C : /book.br 호출");

			// BookAction()
			action = new BookAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/BookCompleteAction.br")) {
			System.out.println(" C : /BookCompleteAction.br 호출 ");
			
			// BookCompleteAction
			action = new BookCompleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) { e.printStackTrace(); }			
		
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
