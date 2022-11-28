package com.fork.board.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.board.db.BoardDAO;
import com.fork.board.db.BoardDTO;
import com.fork.user.db.MemberDTO;
import com.fork.user.db.UserDAO;

public class QnaContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		ActionForward forward = new ActionForward();

		
		UserDAO udao = new UserDAO();
		MemberDTO Mdto = udao.getMember(id);
		int m_no = Mdto.getM_no();
		
		String pageNum = request.getParameter("pageNum");
		int rev_no = Integer.parseInt(request.getParameter("rev_no"));
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		
		BoardDAO dao = new BoardDAO();
		HashMap<String,Object> dto = dao.getQnaBoard(rev_no);
		
		request.setAttribute("m_noo", m_no);
		request.setAttribute("dto", dto);
		request.setAttribute("m_id", id);
		
	    forward.setPath("./qnaBoard/qnaContent.jsp");
	    forward.setRedirect(false);
	      
	    return forward;
	}

}
