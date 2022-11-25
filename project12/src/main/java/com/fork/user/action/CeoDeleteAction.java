package com.fork.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.user.db.UserDAO;

public class CeoDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : CeoDeleteAction_execute ");
		
		// 세션제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./main.st");
			forward.setRedirect(true);
			return forward;
		}
		
		// 정보 저장
		int c_no = Integer.parseInt(request.getParameter("c_no"));
		String pw = request.getParameter("pw2");
		
		// 삭제
		UserDAO dao = new UserDAO();
		int result = dao.ceoDelete(c_no,pw);
		
		// 페이지 이동(js)
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out =response.getWriter();
		
		if(result == -1) {
			out.print("<script>");
			out.print("alert('회원정보 없음');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			
			return null;
		} else if(result == 0) {
			out.print("<script>");
			out.print("alert('비밀번호 틀림');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			
			return null;
		} else { // result == 1
			// 세션 초기화
			session = request.getSession();
			session.invalidate();
			
			out.print("<script>");
			out.print("alert('회원정보 삭제완료');");
			out.print("location.href='./main.st';");
			out.print("</script>");
			out.close();
			
			return null;
		}

	}
}
