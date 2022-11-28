package com.fork.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.board.db.BoardDAO;
import com.fork.board.db.BoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class QnaBoardUpdateAction implements Action {

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
		// 정보 저장
		BoardDTO dto = new BoardDTO();
		
//		dto.setS_no(Integer.parseInt(request.getParameter("s_no")));
//		dto.setRev_no(Integer.parseInt(request.getParameter("rev_no")));
//		dto.setQna_sort(request.getParameter("qna_sort"));
//		dto.setRev_subject(request.getParameter("rev_subject"));
//		dto.setRev_file(request.getParameter("rev_file"));
//		dto.setRev_content(request.getParameter("rev_content"));
		
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
		
		
		// 가게 상세페이지에서 받아오는거 확인 후 수정 필요!
		 dto.setS_no(Integer.parseInt(multi.getParameter("s_no")));
		 dto.setRev_no(Integer.parseInt(multi.getParameter("rev_no")));
		// dto.setInt(multi.getRev_category());
		// dto.setInt(multi.getM_no())
		dto.setQna_sort(multi.getParameter("qna_sort"));
		dto.setRev_subject(multi.getParameter("rev_subject"));
		dto.setRev_content(multi.getParameter("rev_content"));
		dto.setRev_file(multi.getParameter("rev_file"));
		
		//DAO
		BoardDAO dao = new BoardDAO();
		dao.updateQnaBoard(dto);
		
		request.setAttribute("pageNum", pageNum);
		      
		
    forward.setPath("./QnaList.br?pageNum="+pageNum);
    forward.setRedirect(true);
    
    return forward;
	}

}
