package com.fork.board.action;

import java.io.PrintWriter;

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
		System.out.println("M : QnaBoardWriteAction_execute() 호출");
		
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
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		System.out.println("tlqkf s_no : "+ s_no);
		
		int rev_category = Integer.parseInt(request.getParameter("rev_category"));
		System.out.println("tlqkf rev_category : "+rev_category);
		
//		if(!s_no.equals()
		
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
//		 dto.setS_no(2);
		dto.setRev_category(Integer.parseInt(multi.getParameter("rev_category")));
//		dto.setM_no(Integer.parseInt(multi.getParameter("m_no")));
//		 dto.setRev_no(Integer.parseInt(multi.getParameter("rev_no")));
		// dto.setInt(multi.getRev_category());
		// dto.setInt(multi.getM_no())
		dto.setQna_sort(multi.getParameter("qna_sort"));
		dto.setRev_subject(multi.getParameter("rev_subject"));
		dto.setRev_content(multi.getParameter("rev_content"));
		dto.setRev_file(multi.getParameter("rev_file"));
		
		System.out.println(dto);
		//DAO
	   BoardDAO dao = new BoardDAO();
	   dao.insertQnaBoard(dto);
		
	   request.setAttribute("dto", dto);
	   request.setAttribute("m_id", id);
	   forward.setPath("./QnaList.br?s_no="+s_no+"&rev_category="+rev_category);
	   forward.setRedirect(true);
      
		return forward;
	}

}
