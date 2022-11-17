package com.fork.review.action;

import java.util.ArrayList;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.review.db.ReviewDAO;
import com.fork.review.db.ReviewDTO;

public class ReviewListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		HttpSession session = request.getSession();
//		String m_id = (String)session.getAttribute("m_id");
//		if(m_id == null || !m_id.equals("m_id")) {
//			response.sendRedirect("./메인으로가라");
//			return null;
//		}나중에 로그인하면 다시 풀어야함.
		

		
		ReviewDAO dao = new ReviewDAO();
		
		int cnt = dao.getReviewCount();
		System.out.println(cnt);		
		int pageSize = 9;
		
		
//		ReviewDTO dto = new ReviewDTO();
		
//		dto.setS_no(Integer.parseInt(request.getParameter("s_no")));
		// 	http://localhost:8088/JSP/board/boardList.jsp?pageNum=3 
		
		// 현 페이지가 몇 페이지 인지 확인
		
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		
		// 시작행 번호 계산하기 1   11   21   31   41   .....
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage -1)*pageSize + 1;
		
		// 끝행 번호 계산하기 10   20   30   40   .....
		int endRow = currentPage * pageSize;
		//////////////////////////////////////////////////////////////////////////////////////////////
		
		
		// 디비에 전체 글 리스트 가져오기
//		ArrayList boardListAll =  dao.getBoardList();
		ArrayList reviewListAll = dao.getReviewList(startRow, pageSize);
		   /////////////////////////////////////////////////////////////////////////////////////////////////
			// 페이징 처리 (2)
			
			// 컨트롤 + h => 검색기능
		
//			if(cnt != 0){ // 글이 있을 때
				
				// 총 페이지 = 글 개수(총량) / 페이지 당 출력
				// 		=> 만약에 나머지가 있을 때 페이지 1개 추가
				
				// 전체 페이지 수
				int pageCount = (cnt/pageSize)+(cnt%pageSize==0? 0:1); // 삼항연산자
				
				// 한 화면에 보여줄 페이지 수
				int pageBlock = 2;
				
				// 페이지블럭의 시작번호		1~10 => 1, 11~20 => 11, 21~30 => 21
				int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
				
				// 페이지블럭의 끝번호
				int endPage = startPage+pageBlock-1;
				
				if(endPage > pageCount){
					endPage = pageCount;
//				}
			}
		
//		System.out.println(" M : "+boardListAll); // 확인하고 주석처리해야 덜느려짐 보드에 모든 글이 다 나타나기 때문
		
		// 직접 출력 -> 위임(대신 출력) view .jsp페이지에서 출력
		
		// Action -> jsp 페이지 정보 전달(request 영역객체 저장)
		request.setAttribute("reviewListAll", reviewListAll); // +a를 넣을경우, 추가적인 정보를 담을경우
		request.setAttribute("totalCnt", cnt);
		// 페이징처리 정보 저장
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalCnt", cnt);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		request.setAttribute("endPage", endPage);
		request.setAttribute("endPage", endPage);
		
//		request.setAttribute("boardListAll", dao.getBoardList()); // 디비에 있는 정보를 그대로 출력만 할 경우
		
		// 페이지 이동준비(티켓 생성)
		ActionForward forward = new ActionForward();
		forward.setPath("./board/reviewList.jsp");
		forward.setRedirect(false);
		
		
		return forward;
	}

}