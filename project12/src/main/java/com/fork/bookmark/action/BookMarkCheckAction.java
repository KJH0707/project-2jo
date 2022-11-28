package com.fork.bookmark.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.bookmark.db.BookMarkDAO;
import com.fork.bookmark.db.BookMarkDTO;
import com.fork.store.db.StoreDAO;
import com.fork.store.db.StoreDTO;

public class BookMarkCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(" M : BasketAddAction_execute() 호출 ");
		
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
      
      
   int s_no = Integer.parseInt(request.getParameter("s_no"));
   
   int result = Integer.parseInt(request.getParameter("result"));
   
   BookMarkDAO bdao = new BookMarkDAO();
   
   if(result==0) {
      bdao.insertBookMark(id, s_no);
   } else if(result==1){
      bdao.deleteBookMark(id, s_no);
   }
      
   		forward.setPath("./storeDetails.st?s_no="+s_no);
      forward.setRedirect(true);
   
   
   return forward;
}

}