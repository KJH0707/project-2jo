package com.fork.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.board.db.BookDAO;
import com.fork.board.db.BookDTO;

public class BookCompleteAction implements Action{

	@Override
public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("BookCompleteAction_execute()");
		
		// 세션제어
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
				
		ActionForward forward = new ActionForward();
		if(id == null) {
		forward.setPath("./login.re");
		forward.setRedirect(true);
		return forward;
			}
		
		// 전달정보 예약번호(res_no) 저장
		String res_no = request.getParameter("res_no");
				
		// BookDAO - 예약번호에 예약 조회
		// BookComplete(res_no)
		
		BookDAO boDAO = new BookDAO();
				
		// request 영역 저장
//		request.setAttribute("bookComplete", boDAO.bookComplete(res_no));
				
		// 페이지 이동(./order/order_detail.jsp)
		forward.setPath("./book/bookComplete.jsp");
		forward.setRedirect(false);
		return forward;
			}

		}


