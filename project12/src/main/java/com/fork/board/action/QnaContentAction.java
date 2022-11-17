package com.fork.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.board.db.BoardDAO;
import com.fork.board.db.BoardDTO;

public class QnaContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String m_id = session.getId();
		if(m_id == null) {
			response.sendRedirect("/Main.re");
		}
		
		String pageNum = request.getParameter("pageNum");
		int rev_no = Integer.parseInt(request.getParameter("rev_no"));
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = dao.getQnaBoard(rev_no);
		
		request.setAttribute("dto", dto);
		
		ActionForward forward = new ActionForward(); 
	    forward.setPath("./qnaBoard/qnaContent.jsp");
	    forward.setRedirect(false);
	      
	    return forward;
	}

}
