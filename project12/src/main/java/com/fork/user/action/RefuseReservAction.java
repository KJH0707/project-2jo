package com.fork.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.store.db.StoreDAO;
import com.fork.user.db.UserDAO;

public class RefuseReservAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : refuseReservationAction_execute ");
		
		// 아이디 제어 (점주)
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("c_id");
		ActionForward forward = new ActionForward();
		StoreDAO sdao = new StoreDAO();
		
		if(id!=null) {
			if(sdao.isCeo(id)==0) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();		
				out.print("<script>");
				out.print("alert('잘못된 접근입니다');");
				out.print("history.back()';");
				out.print("</script>");
				out.close();
				return null;
			}	
		}
		// 아이디 제어 (점주)
		
		// 정보 저장
		int res_no = Integer.parseInt(request.getParameter("res_no"));
		
		// 수정
		UserDAO dao = new UserDAO();
		int result=dao.RefuseReserv(res_no);
		
		if(result == 1) {
			System.out.println("예약 거절 완료");
		} else {
			System.out.println("예약 거절 실패");
		}
		
		// 페이지이동
		forward.setPath("./CeoMyPage_reserv.us");
		forward.setRedirect(true);
		
		return forward;
	}

}
