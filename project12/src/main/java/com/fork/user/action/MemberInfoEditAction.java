package com.fork.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.user.db.MemberDTO;
import com.fork.user.db.UserDAO;

public class MemberInfoEditAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println(" M : MemberInfoEditAction_execute 호출 ");
		
		// 세션제어
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./main.us");
			forward.setRedirect(true);
			return forward;
		}
		// DAO - 기존의 회원정보 가져오기(getMember(ID))
		UserDAO dao = new UserDAO();
		MemberDTO dto = dao.getMember(id);
		// 정보 request 영역 저장
		request.setAttribute("dto", dto);
		
		//request.setAttribute("dto", dao.getMember(id));
		
		// 페이지 이동
		forward.setPath("./member/edit.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}



