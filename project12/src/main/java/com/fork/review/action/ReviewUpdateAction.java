package com.fork.review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.review.db.ReviewDAO;
import com.fork.review.db.ReviewDTO;

public class ReviewUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./Login.us");
			forward.setRedirect(true);
			return forward;			
		}
		
		
		System.out.println(" M : reviewupdateAction_execute() 호출  ");
		// BoardUpdate.bo?bno=91&pageNum=1
		// 페이지 전달정보 저장
		int rev_no = Integer.parseInt(request.getParameter("rev_no"));
		String pageNum = request.getParameter("pageNum");
		String rev_subject = request.getParameter("rev_subject");
		String rev_file = request.getParameter("rev_file");
		String rev_content = request.getParameter("rev_content");
		
		// BoardDAO 객체 생성
		ReviewDAO dao = new ReviewDAO();
		
		// DB에 저장된 수정할 글번호를 가져와서
		ReviewDTO dto = dao.getReview(rev_no);
		
		
		
		// request 영역에 저장
		request.setAttribute("rev_no", rev_no);
		request.setAttribute("pageNum", pageNum);
		//request.set 
		request.setAttribute("dto", dto);
//		request.setAttribute("s_no", s_no);
		request.setAttribute("rev_subject", rev_subject);
		request.setAttribute("rev_file", rev_file);
		request.setAttribute("rev_content", rev_content);
		
		
		// view 출력 (./board/updateForm.jsp)
		// 페이지 이동(티켓)
		ActionForward forward2 = new ActionForward();
		forward2.setPath("./board/reviewUpdate.jsp");
		forward2.setRedirect(false);
		
		return forward2;
	}

}
