package com.fork.user.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.user.db.CeoDTO;
import com.fork.user.db.UserDAO;

public class CeoInfoUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : CeoInfoUpdateAction_execute ");
		
		// 세션제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./main.st");
			forward.setRedirect(true);
			return forward;
		}
		
		// DAO - 회원정보 가져오기(getCEO(id))
		UserDAO cdao = new UserDAO();
		CeoDTO cdto = cdao.getCEO(id);
		
		// 정보 request 에 저장
		request.setAttribute("cdto", cdto);
		
		// 페이지 이동
		forward.setPath("./member/ceoMyPage_info.jsp");
		forward.setRedirect(false);
		
		return forward;
		}

}
