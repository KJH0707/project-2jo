package com.fork.review.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.review.db.ReviewDAO;
import com.fork.review.db.ReviewDTO;

public class ReviewUpdateAction implements Action {

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
		forward.setPath("./board/reviewUpdate.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
