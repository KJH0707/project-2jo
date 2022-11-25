package com.fork.user.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.user.db.UserDAO;

public class CeoMypage_revAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : CeoMypage_revAction_excute ");
		
		// 세션제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./main.st");
			forward.setRedirect(true);
			return forward;
		}
		
		/////// 페이징 처리(1)
		// 한 페이지에 보여줄 글의 개수 설정
		int pageSize=6;
		
		// 현 페이지가 몇페이지인지 확인
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum="1";
		}
		
		// 시작행 번호 계산하기
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		
		// 끝행 번호 계산하기
		int endRow = currentPage * pageSize;
		////////////////////////////////////////////////////
		
		// 정보 가져오기
		String sno = request.getParameter("sno");
		if(sno == null) {
			sno="0";
		}
		
		String listType = request.getParameter("listType");
		if(listType == null) {
			listType = "date";
		}
//		System.out.println("@@@@@@@"+listType);
		
		String s = request.getParameter("s");
		if(s==null) {
			s = "0";
		}
		
//		System.out.println("@@@@@@@"+s);
		
		// 가게정보
		UserDAO rdao = new UserDAO();
		List storeInfo = rdao.getStoreInfo(id);		
		
		// 가게목록
		List reList = rdao.getCeoRevList(id, sno, listType,s,startRow,pageSize);
		System.out.println(sno);
//		System.out.println(reList);
		System.out.println(listType);
		
		// 리뷰 수
		int rnt = rdao.CeoReCount(id, sno);
		System.out.println("리뷰 수 : "+rnt);
		
		///////// 페이징 처리(2)
		// 글이 있을 때
		// 총 페이지 = 글 개수 / 페이지당 출력
		//  => 만약에 나머지가 있을 때 페이지 1개 추가
		
		// 전체 페이지수
		int pageCount = (rnt/pageSize)+(rnt%pageSize==0? 0:1);
		
		// 한 화면에 보여줄 페이지수
		int pageBlock = 10;
		
		// 페이지블럭의 시작번호
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		
		// 페이지블럭의 끝번호
		int endPage = startPage + pageBlock -1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		// request 저장
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalSnt", rnt);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("listType", listType);
		request.setAttribute("sno", sno);
		request.setAttribute("storeInfo", storeInfo);
		request.setAttribute("reList", reList);
		request.setAttribute("s", s);
		
		
		// 페이지 이동
		forward.setPath("./member/ceoMyPage_review.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
