package com.fork.review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fork.review.db.ReviewDAO;
import com.fork.review.db.ReviewDTO;

public class ReviewUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : ##############################");
		System.out.println(" M : BoardUpdateAction_execute() 호출  ");
		// BoardUpdate.bo?bno=91&pageNum=1
		// 페이지 전달정보 저장
		int bno = Integer.parseInt(request.getParameter("bno"));
		String pageNum = request.getParameter("pageNum");
		
		// BoardDAO 객체 생성
		ReviewDAO dao = new ReviewDAO();
		
		// DB에 저장된 수정할 글번호를 가져와서
		ReviewDTO dto = dao.getReview(bno);
		
		// request 영역에 저장
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
		
		// view 출력 (./board/updateForm.jsp)
		// 페이지 이동(티켓)
		ActionForward forward = new ActionForward();
		forward.setPath("./update.rv");
		forward.setRedirect(false);
		
		return forward;
	}

}
