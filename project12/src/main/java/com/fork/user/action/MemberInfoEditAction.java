package com.fork.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.user.db.MemberDTO;
import com.fork.user.db.UserDAO;

public class MemberInfoEditAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println(" M : MemberInfoEditAction_execute 호출 ");
		
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



