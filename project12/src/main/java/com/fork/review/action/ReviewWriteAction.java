package com.fork.review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fork.review.db.ReviewDAO;
import com.fork.review.db.ReviewDTO;

public class ReviewWriteAction implements Action {

	// 글쓰기 동작 수행하는 객체
	@Override
	public ActionForward execute(HttpServletRequest request,
							HttpServletResponse response) throws Exception {
		
		System.out.println(" M : ReviewWriteAction_execute() 호출 ");
		
		// 한글처리
		//request.setCharacterEncoding("UTf-8");
		
		// 전달정보 (파라메터 저장)
		
		ReviewDTO dto = new ReviewDTO();
		
		
		
//		dto.setRev_subject(request.getParameter("rev_subject"));
//		dto.setRev_content(request.getParameter("rev_content"));
		
		// ip 저장
//		dto.setIp(request.getRemoteAddr());
		System.out.println(" M : "+dto);
		
		
		// BoardDAO 객체
		ReviewDAO dao = new ReviewDAO();
		// insertBoard()
		dao.insertReview(dto);
		
		
		// 페이지 이동정보 생성(티켓 생성)
		ActionForward forward = new ActionForward();
		forward.setPath("./ReviewList.rv");
		forward.setRedirect(true);
		
		return forward;
	}

}
