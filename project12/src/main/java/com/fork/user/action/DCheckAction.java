package com.fork.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fork.user.db.UserDAO;

public class DCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println(" M : DCheckAction_execute() 호출 ");
		
		String id = request.getParameter("id");
		String nick = request.getParameter("nick");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
//		System.out.println(id);
//		System.out.println(nick);
		
		// DB 확인
		UserDAO dao = new UserDAO();
		
		// 아이디
		if(nick == null && email == null && tel == null) {
		int result = dao.checkId(id);
		
			if(result == 1) {
				System.out.println(" M : 아이디 중복, 사용불가 ");
			} else {
				System.out.println(" M : 아이디 사용가능 ");
			}
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.write(result+"");
			out.flush();
			out.close();
		} 
		
		// 이메일
		else if(id == null && nick == null && tel == null) {
			
			int result = dao.checkEmail(email);
			
			if(result == 1) {
				System.out.println(" M : 이메일 중복, 사용불가 ");
			} else {
				System.out.println(" M : 이메일 사용가능 ");
			}
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.write(result+"");
			out.flush();
			out.close();
		}
		
		// 닉네임
		else if(id == null && email == null && tel == null) {
			int result = dao.checkNick(nick);
			
			if(result == 1) {
				System.out.println(" M : 닉네임 중복, 사용불가 ");
			} else {
				System.out.println(" M : 닉네임 사용가능 ");
			}
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.write(result+"");
			out.flush();
			out.close();
		}
		
		// 연락처
		else if(id == null && email == null && nick == null) {
			int result = dao.checkTel(tel);
			
			if(result == 1) {
				System.out.println(" M : 연락처 중복, 사용불가 ");
			} else {
				System.out.println(" M : 연락처 사용가능 ");
			}
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.write(result+"");
			out.flush();
			out.close();
		}

		return null;
	}

}
