package com.fork.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.user.db.*;


public class MemberDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println(" M : MemberDeleteAction_execute() "); 
		
		// 전달정보 저장
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		// DAO - 회원정보 삭제(deleteMember())
		UserDAO dao = new UserDAO();
		int result = dao.deleteMember(id, pw);
		
		System.out.println(" M : result : "+result);
		
		// 페이지 이동(js)
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(result == -1) {
			out.print("<script>");
			out.print(" alert('회원정보 없음'); ");
			out.print(" history.back(); ");
			out.print("</script>");
			out.close();
			
			return null;
		}else if(result == 0) {
			out.print("<script>");
			out.print(" alert('비밀번호 오류'); ");
			out.print(" history.back(); ");
			out.print("</script>");
			out.close();
			
			return null;
		}else { // result == 1
			// 세션 초기화
			HttpSession session = request.getSession();
			session.invalidate();
			
			out.print("<script>");
			out.print(" alert('회원정보 삭제완료'); ");
			out.print(" location.href='./MemberInfoEdit.us'; ");
			out.print("</script>");
			out.close();
			
			return null;
		}
		
	}

}
