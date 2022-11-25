package com.fork.review.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.review.db.ReviewDAO;
import com.fork.review.db.ReviewDTO;
import com.fork.store.db.StoreDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ReviewWriteAction implements Action {

	// 글쓰기 동작 수행하는 객체
	@Override
	public ActionForward execute(HttpServletRequest request,
							HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		if(m_id == null || !m_id.equals("m_id")) {
			response.sendRedirect("./메인으로가라");
			return null;
		}
		
		System.out.println(" M : ReviewWriteAction_execute() 호출 ");
		
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
		System.out.println(" M : 첨부파일 업로드 완료! ");

		// 전달정보 (파라메터 저장)
		
		ReviewDTO dto = new ReviewDTO();
		StoreDTO sdto = new StoreDTO();
		
		
		sdto.setS_name(multi.getParameter("s_name"));
		dto.setS_no(Integer.parseInt(multi.getParameter("s_no")));
		dto.setRev_subject(multi.getParameter("rev_subject"));
		dto.setRev_content(multi.getParameter("rev_content"));
		dto.setRev_file(multi.getParameter("rev_file"));
		
		dto.setRev_file(multi.getFilesystemName("rev_file"));
		
		
		
	
		// ip 저장
//		dto.setIp(request.getRemoteAddr());
		
		
		// BoardDAO 객체
		ReviewDAO dao = new ReviewDAO();
		// insertBoard()
		dao.insertReview(dto);
		
		request.setAttribute("dto", dto);
		request.setAttribute("sdto", sdto);
		
		
		// 페이지 이동정보 생성(티켓 생성)
		ActionForward forward = new ActionForward();
		forward.setPath("./ReviewList.rv?s_no="+dto.getS_no());
		forward.setRedirect(true);
		
		return forward;
	}

}
