package com.fork.user.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.user.db.UserDAO;

public class AdminSanctionProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		UserDAO dao = new UserDAO();

		ActionForward forward = new ActionForward();
		StopMsgEmail email = new StopMsgEmail();
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int cnt = dao.getNoticeCount(1);
		
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
		
		int rep_m_no = Integer.parseInt(request.getParameter("rep_m"));
		int day = Integer.parseInt(request.getParameter("day"));
		
		
		
		String m_email = (String)request.getParameter("m_email");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		
        Calendar c1 = Calendar.getInstance();
        if (day==100) {
        	c1.add(Calendar.YEAR, day);
        } else {
        	c1.add(Calendar.DATE, day);
        }
        int stopDay = Integer.parseInt(sdf.format(c1.getTime()));
		String reason = (String)request.getParameter("reason");
		
		dao.memStop(rep_m_no, stopDay);
		email.connectEmail(m_email, reason);
		
		forward.setPath("./admin/done.jsp");
		forward.setRedirect(true);
		
		return forward;
	}

}
