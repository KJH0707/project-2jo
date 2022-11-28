package com.fork.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.store.db.StoreDAO;
import com.fork.user.db.ReviewcsDTO;
import com.fork.user.db.UserDAO;

public class CeoMypage_revDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : CeoMypage_reDetailAction_execute ");
		
		// 아이디 제어 (점주)
		HttpSession session = request.getSession();
		
		String id = null;
		if (session.getAttribute("id")!=null) {
			id = (String) session.getAttribute("id");
		}
		ActionForward forward = new ActionForward();
		StoreDAO sdao = new StoreDAO();
		
		if(id==null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();		
			out.print("<script>");
			out.print("alert('잘못된 접근입니다');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			return null;
			
		} else if(sdao.isCeo(id)==0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();		
			out.print("<script>");
			out.print("alert('잘못된 접근입니다');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			return null;
		}	
		// 아이디 제어 (점주)
		
		// 정보 저장
		int rev_no = Integer.parseInt(request.getParameter("rev_no"));
		System.out.println(rev_no);
		
		// 정보 불러오기
		UserDAO rdao = new UserDAO();
		ReviewcsDTO rdto = rdao.reviewInfo(rev_no);
		
		// 정보 보내기
		request.setAttribute("rdto", rdto);
		
		
		// 페이지 이동
		forward.setPath("./member/ceoReviewDetail.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
