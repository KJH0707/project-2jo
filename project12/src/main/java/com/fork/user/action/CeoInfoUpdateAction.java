package com.fork.user.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.store.db.StoreDAO;
import com.fork.user.db.CeoDTO;
import com.fork.user.db.UserDAO;

public class CeoInfoUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : CeoInfoUpdateAction_execute ");
		
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
		
		// DAO - 회원정보 가져오기(getCEO(id))
		UserDAO cdao = new UserDAO();
		CeoDTO cdto = cdao.getCEO(id);
		
		// 정보 request 에 저장
		request.setAttribute("cdto", cdto);
		
		// 페이지 이동
		forward.setPath("./member/ceoMyPage_info.jsp");
		forward.setRedirect(false);
		
		return forward;
		}

}
