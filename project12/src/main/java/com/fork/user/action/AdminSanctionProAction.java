package com.fork.user.action;

import java.io.PrintWriter;
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

		StopMsgEmail email = new StopMsgEmail();
		
		int cnt = dao.getNoticeCount(1);
		
		// 아이디 제어 (어드민)
		String id =null;
		HttpSession session = request.getSession();
		if (session.getAttribute("id")!=null) {
			 id = (String) session.getAttribute("c_id");
		}
		ActionForward forward = new ActionForward();
		
		if(!(id.equals("admin")) | id == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();		
			out.print("<script>");
			out.print("alert('잘못된 접근입니다');");
			out.print("history.back()';");
			out.print("</script>");
			out.close();
			return null;
		}
		// 아이디 제어 (어드민)
		
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
