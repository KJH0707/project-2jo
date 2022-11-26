package com.fork.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fork.user.db.MemberDTO;
import com.fork.user.db.UserDAO;


public class MemberInfoEditProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" M : MemberInfoEditProAction_execute()");
		
		
		// 한글처리(필터)
		// 전달된 데이터 저장(수정정보)
		MemberDTO dto = new MemberDTO();
		
		dto.setM_id(request.getParameter("id"));
		dto.setM_pw(request.getParameter("pw"));
		dto.setM_name(request.getParameter("name"));
		dto.setM_email(request.getParameter("email"));
		dto.setM_nickName(request.getParameter("nick"));
		dto.setM_birth(request.getParameter("birth"));
		dto.setM_gender(request.getParameter("gender"));
		dto.setM_tel(request.getParameter("tel"));
		
		System.out.println(" M : "+dto);
		
		// 회원정보 수정
		UserDAO dao = new UserDAO();
		int result = dao.updateMember(dto);
		
		
		System.out.println(" M : result : "+result);
		
		// 페이지 이동(js)
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(result == -1) {
			out.print("<script>");
			out.print(" alert('회원정보 없음'); ");
			out.print(" history.back(); ");
			out.print("</script>");
			out.close();
			
			return null;
		}else if(result == 0) {
			out.print("<script>");
			out.print(" alert('비밀번호 오류'); ");
			out.print(" history.back(); ");
			out.print("</script>");
			out.close();
			
			return null;
		}else { // result == 1
			out.print("<script>");
			out.print(" alert('회원정보 수정완료'); ");
			out.print(" location.href='./MemberInfoEdit.us'; ");
			out.print("</script>");
			out.close();
			
			return null;
		
		}
		
	
	}
	
}
	
