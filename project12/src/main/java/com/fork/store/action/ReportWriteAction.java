package com.fork.store.action;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.review.db.ReviewDAO;
import com.fork.review.db.ReviewDTO;
import com.fork.store.db.StoreDAO;
import com.fork.store.db.StoreDTO;
import com.fork.user.db.MemberDTO;
import com.fork.user.db.UserDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ReportWriteAction implements Action {

	// 글쓰기 동작 수행하는 객체
	@Override
	public ActionForward execute(HttpServletRequest request,
							HttpServletResponse response) throws Exception {
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
		
		
		UserDAO udao = new UserDAO();
		MemberDTO mdto = udao.getMember(id);
		// 한글처리
		//request.setCharacterEncoding("UTf-8");
		ServletContext CTX = request.getServletContext();
		String realPath = CTX.getRealPath("/upload");
		System.out.println(" M : realPath : "+realPath);
		
		int maxSize = 10 * 1024 * 1024;
		MultipartRequest multi
		= new MultipartRequest(
				request,
				realPath, 
				maxSize, 
				"utf-8", 
				new DefaultFileRenamePolicy()
				);
		int s_no = Integer.parseInt(multi.getParameter("s_no"));
		if (multi.getParameter("s")!=null) {
			
			HashMap<String,Object> hm = new HashMap<String,Object>();
			
			hm.put("s_no",s_no);
			hm.put("rep_reason",multi.getParameter("rep_reason"));
			hm.put("m_no",mdto.getM_no());
			hm.put("rep_subject", multi.getParameter("rep_subject"));
			hm.put("rep_file", multi.getFilesystemName("rep_file"));
			
			StoreDAO sdao = new StoreDAO();
			int result = sdao.insertStoreReport(hm);
			// 페이지 이동정보 생성(티켓 생성)
			
			forward.setPath("./storeDetails.st?s_no="+s_no);
			forward.setRedirect(true);
			
			return forward;
		} else {
			HashMap<String,Object> hm = new HashMap<String,Object>();
			
			
			hm.put("rep_reason",multi.getParameter("rep_reason"));
			hm.put("m_no",mdto.getM_no());
			hm.put("rep_subject", multi.getParameter("rep_subject"));
			hm.put("rep_file", multi.getFilesystemName("rep_file"));
			hm.put("rep_m_no",multi.getParameter("rep_m_no"));
			StoreDAO sdao = new StoreDAO();
			int result = sdao.insertUserReport(hm);
			
			forward.setPath("./ReviewList.rv?s_no="+s_no);
			forward.setRedirect(true);
			
			return forward;
		}
		// 전달정보 (파라메터 저장)
		
		
	}

}
