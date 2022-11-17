package com.fork.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.board.db.BoardDAO;
import com.fork.board.db.BoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class QnaBoardWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		HttpSession session = request.getSession();
//		String m_id = session.getId();
//		if(m_id == null) {
//			response.sendRedirect("/Main.re");
//		}
		
		// 한글 처리
		// 1) 파일 업로드
	      // 업로드 가상폴더 생성 /upload
	      // 첨부파일 크기 지정 / 10MB
	      
	      String realPath = request.getRealPath("/upload");
	      System.out.println(" M : realPath : "+realPath);
	      int maxSize = 10 * 1024 * 1024;
	      
	      // 파일업로드 -> 파일업로드 객체 생성(MultipartRequest)
	      MultipartRequest multi = new MultipartRequest(
	                                request,
	                                realPath,
	                                maxSize,
	                                "UTF-8",
	                                new DefaultFileRenamePolicy()
	                                );
	      
	      System.out.println(" M : 첨부파일 업로드 성공! ");
		// 정보 저장
		BoardDTO dto = new BoardDTO();
		
		// 가게 상세페이지에서 받아오는거 확인 후 수정 필요!
		 dto.setS_no(Integer.parseInt(multi.getParameter("s_no")));
		// dto.setInt(multi.getRev_category());
		// dto.setInt(multi.getM_no())
		dto.setQna_sort(multi.getParameter("qna_sort"));
		dto.setRev_subject(multi.getParameter("rev_subject"));
		dto.setRev_content(multi.getParameter("rev_content"));
		dto.setRev_file(multi.getParameter("rev_file"));
		
		//DAO
		   BoardDAO dao = new BoardDAO();
		      dao.insertQnaBoard(dto);
		      
      ActionForward forward = new ActionForward(); 
      forward.setPath("./QnaList.br");
      forward.setRedirect(true);
      
      return forward;
	}

}