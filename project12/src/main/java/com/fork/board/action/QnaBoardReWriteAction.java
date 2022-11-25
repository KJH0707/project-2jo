package com.fork.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.board.db.BoardDAO;
import com.fork.board.db.BoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class QnaBoardReWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : QnaBoardReWriteAction 호출");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("c_id");
		ActionForward forward = new ActionForward();
		if(!id.contains("ceo") || !id.contains("store")) {
			forward.setPath("./loginAction.us");
			forward.setRedirect(true);
		}
		
		String pageNum = request.getParameter("pageNum");
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
		BoardDTO dto = new BoardDTO();
		dto.setRev_ref(Integer.parseInt(multi.getParameter("rev_ref")));
		dto.setRev_seq(Integer.parseInt(multi.getParameter("rev_seq")));
		dto.setS_no(Integer.parseInt(multi.getParameter("s_no")));
		dto.setRev_subject(multi.getParameter("rev_subject"));
		dto.setRev_file(multi.getParameter("rev_file"));
		dto.setRev_content(multi.getParameter("rev_content"));
		
		BoardDAO dao = new BoardDAO();
		dao.reInsertBoard(dto);
		
		forward.setPath("./QnaList.br?pageNum="+pageNum);
		forward.setRedirect(true);
		
		return forward;
	}

}
