package com.fork.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.store.db.StoreDAO;
import com.fork.user.db.CeoDTO;
import com.fork.user.db.UserDAO;

public class CeoInfoUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : CeoInfoUpdateProAction_execute ");
		
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
		
		// dto 저장
		CeoDTO dto = new CeoDTO();
		
		dto.setC_no(Integer.parseInt(request.getParameter("c_no")));
		dto.setC_id(request.getParameter("id"));
		dto.setC_name(request.getParameter("name"));
		dto.setC_email(request.getParameter("email"));
		dto.setC_nickName(request.getParameter("nick"));
		dto.setC_tel(request.getParameter("tel"));
		dto.setC_pw(request.getParameter("pw"));
		
		// 회원정보 수정
		UserDAO dao = new UserDAO();
		int result=dao.ceoInfoUpdate(dto);
		System.out.println("@@@@@@@@@@@"+result);
		
		// 페이지 이동(js)
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out =response.getWriter();
		
		if(result == -1) {
			out.print("<script>");
			out.print("alert('실패');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			return null;
		} else if(result==1){
			out.print("<script>");
			out.print("alert('회원정보 수정완료');");
			out.print("location.href='./CeoMyPage_Info.us';");
			out.print("</script>");
			out.close();
			return null;
		}
		
		return null;
		
	}

}
