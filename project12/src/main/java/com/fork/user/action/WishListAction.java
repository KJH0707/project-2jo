package com.fork.user.action;

import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.*;

import com.fork.user.db.*;

public class WishListAction implements Action{
	

		@Override
		public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			
			
			System.out.println(" M : WishListAction_execute() ");
			
			// 아이디 제어
			HttpSession session = request.getSession();
			String id = null;
			
			if(session.getAttribute("id")!=null) {
				id = (String)session.getAttribute("id");
			}
			
			ActionForward forward = new ActionForward();
			
			if(id == null) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();		
				out.print("<script>");
				out.print("alert('로그인 하쇼.');");
				out.print("location.href='./Login.us';");
				out.print("</script>");
				out.close();
				return null;
			}
			// 아이디 제어 (일반)
			
			// DAO - 예약정보 모두 가져오기
			UserDAO dao = new UserDAO();
			List wishList = dao.getWishList(id);
			
				
			
			// request 영역에 저장(view 전달)
			request.setAttribute("wishList", wishList);
			
			
			forward.setPath("./mypage/myPage_st.jsp");
			forward.setRedirect(false);
			return forward;
		}

	}



