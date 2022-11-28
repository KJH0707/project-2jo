package com.fork.review.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.review.db.ReviewDAO;
import com.fork.review.db.ReviewDTO;
import com.fork.store.db.StoreDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ReviewUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

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
		
		
		
		
		System.out.println(" M : BoardUpdateProAction_execute() 호출 ");
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
		System.out.println(" M : 첨부파일 업로드 완료! ");
		
		ReviewDTO dto = new ReviewDTO();
		dto.setS_no(Integer.parseInt(multi.getParameter("s_no")));
		dto.setRev_no(Integer.parseInt(multi.getParameter("rev_no")));
		dto.setRev_subject(multi.getParameter("rev_subject"));
		dto.setRev_content(multi.getParameter("rev_content"));
		if(multi.getParameter("rev_star")!=null) {
			dto.setRev_star(Integer.parseInt(multi.getParameter("rev_star")));
		}
		dto.setRev_file(multi.getFilesystemName("rev_file"));
		
		StoreDTO sdto = new StoreDTO();
		sdto.setS_name(multi.getParameter("s_name"));
		
		String pageNum = multi.getParameter("pageNum");
		
		// DB에 가서 수정
		ReviewDAO dao = new ReviewDAO();
		dao.updateReview(dto);
		
		request.setAttribute("dto", dto);
		request.setAttribute("sdto", sdto);
		
		forward.setPath("./ReviewList.rv?s_no="+dto.getS_no()+"&pageNum="+pageNum);
		forward.setRedirect(true);
		
		return forward;
		
		
		
	}

}
