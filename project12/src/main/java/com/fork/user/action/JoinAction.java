package com.fork.user.action;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import com.fork.user.db.*;


public class JoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : JoinAction_execute() 호출 ");
		
		// 전달된 정보 저장(회원가입 정보)
		// DTO
		String hid = request.getParameter("hid");
		
		if(hid.equals("일반")) {
			MemberDTO mdto = new MemberDTO();
		
		mdto.setM_id(request.getParameter("id"));
		mdto.setM_name(request.getParameter("name"));
		mdto.setM_email(request.getParameter("email"));
		mdto.setM_nickName(request.getParameter("nick"));
		mdto.setM_tel(request.getParameter("tel"));
		mdto.setM_pw(request.getParameter("pw"));
		mdto.setM_birth(request.getParameter("birth"));
		mdto.setM_gender(request.getParameter("gender"));
		
		UserDAO mdao = new UserDAO();
		mdao.memberJoin(mdto);
		
		} else if(hid.equals("사업자")) {
			CeoDTO cdto = new CeoDTO();
			
			cdto.setC_id(request.getParameter("id"));
			cdto.setC_name(request.getParameter("name"));
			cdto.setC_email(request.getParameter("email"));
			cdto.setC_nickName(request.getParameter("nick"));
			cdto.setC_tel(request.getParameter("tel"));
			cdto.setC_pw(request.getParameter("pw"));
			
			UserDAO cdao = new UserDAO();
			cdao.ceoJoin(cdto);
		}
		
		
//		System.out.println("hid 값은: " + hid);
//		System.out.println(" ceo : "+ cdto);
//		System.out.println(" member : "+ mdto);
		
	
		System.out.println(" M : 회원가입 성공! ");
		
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./Login.us");
		forward.setRedirect(true);
				
		return forward;
	}

}
