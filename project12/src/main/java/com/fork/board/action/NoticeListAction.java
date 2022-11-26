package com.fork.board.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.user.db.UserDAO;

public class NoticeListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		UserDAO dao = new UserDAO();

		ActionForward forward = new ActionForward();
		
		int pageSize = 9;
		
		int cnt = dao.getNoticeCount(0);
		
		
		
		// http://localhost:8088/JSP/board/boardList.jsp?pageNum=2
		
		// 현 페이지가 몇페이지 인지 확인
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
		pageNum = "1";
		}
		
		
		// 시작행 번호 계산하기 1  11  21  31  41 .....
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		
		// 끝행 번호 계산하기 10  20  30  40  50 .....
		int endRow = currentPage * pageSize;
		////////////////////////////////////////////////////////////
		
		
		
		// 디비에 전체 글 리스트 가져오기
		//ArrayList boardListAll = dao.getBoardList();
		List noticeList = dao.adminGetNoticeList(startRow, pageSize, 0);
		List noticeList2 = dao.adminGetNoticeList(startRow, pageSize, 1);
//		StringBuffer sb = new StringBuffer();
//		if (c_id!=null) {
//			request.setAttribute("keyword",c_id );
//			c_id = c_id.trim();
//			sb.append(c_id);
//			sb.insert(0, "%");
//			sb.insert(c_id.length()+1, "%");
//			ceoMemList = dao.adminGetCeoMemList(startRow, pageSize, sb.toString());
//			cnt = dao.adminCntGetCeoMemList(startRow, pageSize, sb.toString());
//		}
//		else {
//			ceoMemList = dao.adminGetCeoMemList(startRow,pageSize);
//		}
		
		
		////////////////////////////////////////////////////////////
		// 페이징 처리 (2)
		
		// 글이 있을때

		// 총 페이지 = 글개수(총량) / 페이지당 출력
		// => 만약에 나머지가 있을때 페이지 1개 추가

		// 전체 페이지수
		int pageCount = (cnt / pageSize) + (cnt % pageSize == 0 ? 0 : 1);

		// 한 화면에 보여줄 페이지수
		int pageBlock = 5;

		// 페이지블럭의 시작번호 1~10 => 1, 11 ~ 20 => 11, 21 ~ 30 => 21 ...
		int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;

		// 페이지 블럭의 끝번호
		int endPage = startPage + pageBlock - 1;

		if (endPage > pageCount) {
			endPage = pageCount;
		}
		////////////////////////////////////////////////////////////
		
		
		
		//System.out.println(" M : " + boardListAll);
		// 직접출력 -> 위임(대신출력) view.jsp페이지에서 출력
		// Action -> jsp 페이지 정보 전달(request 영역객체 저장)
		
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("noticeList2", noticeList2);
		//request.setAttribute("boardListAll", dao.getBoardList());
		
		// 페이징처리 정보 저장
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalCnt", cnt);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		forward.setPath("./main/notice.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
