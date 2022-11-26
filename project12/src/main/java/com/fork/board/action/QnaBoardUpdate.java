package com.fork.board.action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.board.db.BoardDAO;
import com.fork.board.db.BoardDTO;

public class QnaBoardUpdate implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : QnaBoardUpdate 폼 호출!!!");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("m_id");
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./loginAction.us");
			forward.setRedirect(true);
		}
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		int rev_no = Integer.parseInt(request.getParameter("rev_no"));
		String pageNum = request.getParameter("pageNum");
		String rev_subject = request.getParameter("rev_subject");
		String rev_file = request.getParameter("rev_file");
		String rev_content = request.getParameter("rev_content");
		String qna_sort = request.getParameter("qna_sort");
		
		BoardDAO dao = new BoardDAO();
		HashMap<String, Object> dto = dao.getQnaBoard(rev_no);
		
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("s_no", s_no);
		request.setAttribute("rev_no", rev_no);
		request.setAttribute("rev_subject", rev_subject);
		request.setAttribute("rev_file", rev_file);
		request.setAttribute("rev_content", rev_content);
		request.setAttribute("qna_sort", qna_sort);
		
		forward.setPath("./qnaBoard/qnaUpdate.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
