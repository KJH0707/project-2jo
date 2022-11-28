package com.fork.review.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.review.db.ReviewDAO;
import com.fork.review.db.ReviewDTO;
import com.fork.store.db.StoreDTO;
import com.fork.user.db.MemberDTO;
import com.fork.user.db.UserDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ReviewWriteAction implements Action {

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
		
		System.out.println(" M : ReviewWriteAction_execute() 호출 ");
		
		// 한글처리
		//request.setCharacterEncoding("UTf-8");
		ServletContext CTX = request.getServletContext();
		String realPath = CTX.getRealPath("/upload");
		System.out.println(" M : realPath : "+realPath);
		UserDAO udao = new UserDAO();
		int maxSize = 10 * 1024 * 1024;
		MultipartRequest multi
		= new MultipartRequest(
				request,
				realPath, 
				maxSize, 
				"utf-8", 
				new DefaultFileRenamePolicy()
				);
		System.out.println(" M : 첨부파일 업로드 완료! ");

		// 전달정보 (파라메터 저장)
		
		ReviewDTO dto = new ReviewDTO();
		StoreDTO sdto = new StoreDTO();
		MemberDTO mdto = udao.getMember(id);
		
		sdto.setS_name(multi.getParameter("s_name"));
		dto.setS_no(Integer.parseInt(multi.getParameter("s_no")));
		dto.setRev_subject(multi.getParameter("rev_subject"));
		dto.setRev_content(multi.getParameter("rev_content"));
		dto.setRev_file(multi.getParameter("rev_file"));
		dto.setM_no(mdto.getM_no());
		dto.setRev_file(multi.getFilesystemName("rev_file"));
		dto.setRev_star(Integer.parseInt(multi.getParameter("rev_star")));
		
		
	
		// ip 저장
//		dto.setIp(request.getRemoteAddr());
		
		
		// BoardDAO 객체
		ReviewDAO dao = new ReviewDAO();
		// insertBoard()
		dao.insertReview(dto);
		
		request.setAttribute("dto", dto);
		request.setAttribute("sdto", sdto);
		
		
		// 페이지 이동정보 생성(티켓 생성)
		ActionForward forward2 = new ActionForward();
		forward2.setPath("./ReviewList.rv?s_no="+dto.getS_no());
		forward2.setRedirect(true);
		
		return forward2;
	}

}
