package com.fork.user.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.user.db.NoticeDTO;
import com.fork.user.db.UserDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AdminNoticeModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : AdminNoticeModifyAction_execute() ");
		
			// 로그인 제어
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
		
			ActionForward forward = new ActionForward();
			
			if(id!=null) {
				if (!(id.equals("admin"))) {
				forward.setPath("./main.st");
				forward.setRedirect(true);
				return forward;
				}
			} else{
				forward.setPath("./main.st");
				forward.setRedirect(true);
				return forward;
			}
			// 로그인 제어
			
			NoticeDTO dto = new NoticeDTO();
			UserDAO dao = new UserDAO();
			
			// 정보 처리
			String n_no = (String)request.getParameter("n_no");
			System.out.println(" M : n_no@@@@@@@@@@@ : "+n_no);
			
			NoticeDTO notice = dao.getNotice(n_no); // 정보 불러오기
			System.out.println(" M :@@@ "+notice);
			request.setAttribute("notice", notice);
			
			forward.setPath("./admin/adminNoticeModify.jsp");
			forward.setRedirect(false);
			return forward;
	}

}
