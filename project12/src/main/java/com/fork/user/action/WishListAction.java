package com.fork.user.action;

import java.util.*;

import javax.servlet.http.*;

import com.fork.user.db.*;

public class WishListAction implements Action{
	

		@Override
		public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			
			
			System.out.println(" M : WishListAction_execute() ");
			
			// 로그인 체크
			System.out.println(" 로그인 체크");
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("id");
			System.out.println(id);
			
			
			ActionForward forward = new ActionForward();
			if(id == null) {
				forward.setPath("./Login.us");
				forward.setRedirect(true);
				return forward;
			}
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



