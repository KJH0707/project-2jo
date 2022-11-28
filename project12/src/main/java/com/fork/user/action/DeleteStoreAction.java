package com.fork.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.store.db.StoreDAO;
import com.fork.user.db.UserDAO;

public class DeleteStoreAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : BoardDeleteAction_execute() 호출 ");
		
		// 아이디 제어 (점주)
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("c_id");
		StoreDAO sdao = new StoreDAO();
		
		if(id!=null) {
			if(sdao.isCeo(id)==0) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();		
				out.print("<script>");
				out.print("alert('잘못된 접근입니다');");
				out.print("history.back()';");
				out.print("</script>");
				out.close();
				return null;
			}	
		}
		// 아이디 제어 (점주)
		
		
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
