package com.fork.review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fork.review.db.ReviewDAO;
import com.fork.review.db.ReviewDTO;

public class ReviewUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		HttpSession session = request.getSession();
//		String m_id = (String)session.getAttribute("m_id");
//		if(m_id == null || !m_id.equals("m_id")) {
//			response.sendRedirect("./메인으로가라");
//			return null;
//		}나중에 로그인하면 다시 풀어야함.
		
		System.out.println(" M : reviewupdateAction_execute() 호출  ");
		// BoardUpdate.bo?bno=91&pageNum=1
		// 페이지 전달정보 저장
		int rev_no = Integer.parseInt(request.getParameter("rev_no"));
		String pageNum = request.getParameter("pageNum");
		
		// BoardDAO 객체 생성
		ReviewDAO dao = new ReviewDAO();
		
		// DB에 저장된 수정할 글번호를 가져와서
		ReviewDTO dto = dao.getReview(rev_no);
		
		// request 영역에 저장
		request.setAttribute("rev_no", rev_no);
		request.setAttribute("pageNum", pageNum);
		
		// view 출력 (./board/updateForm.jsp)
		// 페이지 이동(티켓)
		ActionForward forward = new ActionForward();
		forward.setPath("./board/reviewUpdate.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
