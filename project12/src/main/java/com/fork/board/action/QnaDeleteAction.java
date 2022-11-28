package com.fork.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.board.db.BoardDAO;
import com.fork.board.db.BoardDTO;

public class QnaDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
		
		String pageNum = request.getParameter("pageNum");
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		int rev_no = Integer.parseInt(request.getParameter("rev_no"));
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		dao.deleteQnaBoard(rev_no);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("s_no",s_no);
		
	    forward.setPath("./QnaList.br?pageNum="+pageNum+"&s_no="+s_no+"&rev_category=0");
	    forward.setRedirect(true);
	      
	    return forward;
	}

}
