package com.fork.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fork.user.db.UserDAO;

public class DeleteStoreAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : BoardDeleteAction_execute() 호출 ");
		
		int c_no = Integer.parseInt(request.getParameter("s_no"));
		
		System.out.println(c_no);
		
		UserDAO dao = new UserDAO();
		
		dao.deleteStore(c_no);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print("<script>");
		out.print(" alert('삭제 완료!'); ");
		out.print(" location.href='./CeoMyPage_st.us'; ");
		out.print(" </script> ");
		out.close();
		
		return null;
	}

}
