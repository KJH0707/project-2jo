package com.fork.review.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fork.review.db.ReviewDAO;
import com.fork.review.db.ReviewDTO;
import com.fork.review.db.StoreDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ReviewWriteAction implements Action {

	// 글쓰기 동작 수행하는 객체
	@Override
	public ActionForward execute(HttpServletRequest request,
							HttpServletResponse response) throws Exception {
		
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
		
		dto.setS_no(Integer.parseInt(multi.getParameter("s_no")));
		sdto.setS_name(multi.getParameter("s_name"));


		dto.setRev_subject(multi.getParameter("rev_subject"));
		dto.setRev_content(multi.getParameter("rev_content"));
		
		if(multi.getParameter("rev_star")!=null) {
			dto.setRev_star(Integer.parseInt(multi.getParameter("rev_star")));
		}
		
		dto.setRev_file(multi.getFilesystemName("rev_file"));
		
		
		
	
		// ip 저장
//		dto.setIp(request.getRemoteAddr());
		
		
		// BoardDAO 객체
		ReviewDAO dao = new ReviewDAO();
		// insertBoard()
		dao.insertReview(dto);
		
		
		// 페이지 이동정보 생성(티켓 생성)
		ActionForward forward = new ActionForward();
		forward.setPath("./ReviewList.rv");
		forward.setRedirect(true);
		
		return forward;
	}

}
