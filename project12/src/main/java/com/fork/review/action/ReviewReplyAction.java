package com.fork.review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.review.db.ReviewDAO;
import com.fork.review.db.ReviewDTO;
import com.fork.store.db.StoreDAO;
import com.fork.store.db.StoreDTO;

public class ReviewReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
System.out.println(" M : BoardReWriteAction.bo 호출");
		
		//한글처리(form-post방식) 생략 - filter 걸어놓음

		//세션 관리  (관리자만 글쓰기 가능하게)
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id==null && !id.contains("ceo")) {
				forward.setPath("./Login.us");
				forward.setRedirect(true);
				return forward;
			}
		
	
	
		//전달 데이터 저장(pageNum,bno,re_ref_,re_lev,re_seq + 제목, 작성자, 비밀번호, 내용
		String pageNum = request.getParameter("pageNum");
		
		//나머지 데이터는 dto로 한 덩어리로 만든다
		ReviewDTO dto = new ReviewDTO();
		dto.setS_no(Integer.parseInt(request.getParameter("s_no")));
		dto.setRev_no(Integer.parseInt(request.getParameter("rev_no")));
		dto.setRev_ref(Integer.parseInt(request.getParameter("rev_ref")));
		dto.setRev_seq(Integer.parseInt(request.getParameter("rev_seq")));
		dto.setRev_subject(request.getParameter("rev_subject"));
		dto.setRev_content(request.getParameter("rev_content"));
		
//		dto.setIp(request.getRemoteAddr());
		
		//답글 받기 
		//DAO 객체 생성
		
		
		
		ReviewDAO dao = new ReviewDAO();
		dao.replyReview(dto); //이전에 만들었던 메서드. 3가지 동작 수행 -1 0 1
		
		System.out.println(pageNum+"@@@@@@@@@@@");
		
		//페이지 이동 ( 정보 저장 )
		ActionForward forward2 = new ActionForward();
		forward2.setPath("./ReviewList.rv?s_no="+dto.getS_no()+"&pageNum="+pageNum); //답글 다 쓰고 나면 어디로 갈건지 
		forward2.setRedirect(true); 
		
		return forward2;
	}

}
