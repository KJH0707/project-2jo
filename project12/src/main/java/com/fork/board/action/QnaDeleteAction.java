package com.fork.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.board.db.BoardDAO;
import com.fork.board.db.BoardDTO;

public class QnaDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String m_id = session.getId();
		if(m_id == null) {
			response.sendRedirect("/Main.re");
		}
		
		String pageNum = request.getParameter("pageNum");
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		int rev_no = Integer.parseInt(request.getParameter("rev_no"));
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		dao.deleteQnaBoard(rev_no);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("s_no",s_no);
		
		ActionForward forward = new ActionForward(); 
	    forward.setPath("./QnaList.br");
	    forward.setRedirect(true);
	      
	    return forward;
	}

}
