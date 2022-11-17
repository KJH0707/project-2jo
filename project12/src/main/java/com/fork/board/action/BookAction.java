package com.fork.board.action;

import java.sql.Date;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.board.db.BookDAO;
import com.fork.board.db.BookDTO;
import com.fork.user.db.MemberDTO;

public class BookAction implements Action
{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		System.out.println("BookAction_execute()");
		
		// 사용자 정보(세션제어)
		HttpSession session = request.getSession();
		String id =  (String) session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./login.re");
			forward.setRedirect(true);
			return forward;
		}
		
		// 예약 정보
		
		// 사용자 정보
//		MemberDAO mDAO = new MemberDAO();
//		MemberDTO memberDTO = mDAO.getMember(id);
		
		// 저장해서 view출력
		
//		request.setAttribute("memberDTO", memberDTO);
				
		// ./book/book.jsp 페이지로 이동
		forward.setPath("./book/book.jsp");
		forward.setRedirect(false);	
				
		return forward;
			}

		}
