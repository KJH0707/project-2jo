package com.fork.board.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.board.db.BoardDAO;

public class QnaListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : QnaListAction_execute 실행");
		String s_no = request.getParameter("s_no");
//		int s_no = Integer.parseInt(request.getParameter("s_no"));
		
		int rev_category = Integer.parseInt(request.getParameter("rev_category"));
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./Login.us");
			forward.setRedirect(true);
		}
		
		// BoardDAO 객체 생성
		BoardDAO dao = new BoardDAO();
		
		int cnt = dao.getQnaBoardCount();
		System.out.println("M : 전체 글 개수 "+cnt+"개");
		
		/////////////////////////////////////////////////////////////////////////////
		//페이징 처리 (1)
		
		// 한 페이지에 보여줄 글의 개수
		int pageSize = 5;
		
		// http://localhost:8088/JSP/board/boardList.jsp?pageNum=2
		// ctrl 누른 상태에서 주소누르면 들어가진다!
		
		// 현 페이지가 몇 페이지 인지 확인(listPro에서 pageNum 줘야함)
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		
		// 시작행 번호 계산하기 1, 11, 21, 31, 41, ...
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1)*pageSize+1;
		// 끝행 번호 계산하기 10, 20, 30, 40, 50, ...
		int endRow = currentPage * pageSize;
		/////////////////////////////////////////////////////////////////////////////		
		
		// 디비에 전체 글 리스트 가져오기
//				ArrayList boardListAll = dao.getBoardList();
		List qnaList = dao.getQnaBoardList(startRow,pageSize,s_no,rev_category);
		
//				System.out.println("M : "+boardListAll); // 한번하고나서 주석처리 하는 것 추천
		
		//////////////////////////////////////////////////////////////////////////////////////
		// 페이징 처리 (2)
		 // 글이 있을 때(count 위에 int로 받은 것 참고)
			
		// 총 페이지 = 글 개수(총량) / 페이지당 출력
		//	=> 만약 나머지가 있을 때, 페이지 1개 추가
			
		// 전체 페이지수
		int pageCount = (cnt/pageSize)+(cnt%pageSize == 0? 0:1);
			
		// 한 화면에 보여줄 페이지 수
		int pageBlock = 3;
			
		// 페이지 블럭의 시작번호	1~10 => 1, 11~20 => 11, 21~30 => 21, ...
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;		
		// 페이지 블럭의 끝번호		1~10 => 10, 11~20 => 20, 21~30 => 30, ...
		int endPage = startPage + pageBlock -1;
		
			if(endPage > pageCount){
				endPage = pageCount;	
			}
		//////////////////////////////////////////////////////////////////////////////////////
		
		
		
		// 직접 출력 -> 위임(대신 출력) view.jsp 페이지에서 출력
		// Action -> jsp 페이지 정보 전달 (request 영역객체 저장)
		request.setAttribute("qnaList", qnaList);
		request.setAttribute("id", id);
//		request.setAttribute("totalCnt", cnt);
//				request.setAttribute("boardListAll", dao.getBoardList()); // DB에 있는 정보 그대로 출력할 때
		request.setAttribute("m_id", id);
		request.setAttribute("s_no", s_no);
		request.setAttribute("rev_category", rev_category);
		// 페이징처리 정보 저장
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalCnt", cnt);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		// 페이지 이동 준비(티켓 생성)
//		ActionForward forward = new ActionForward();
		forward.setPath("./qnaBoard/qnaList.jsp");
		forward.setRedirect(false); // forward -> request 담아서 이동할 것이기 때문
		
		return forward;
	}

}
