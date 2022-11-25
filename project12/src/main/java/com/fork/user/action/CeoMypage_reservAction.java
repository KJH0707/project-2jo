package com.fork.user.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.user.db.UserDAO;

public class CeoMypage_reservAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : CeoMypage_reservAction_execute 호출 ");
		
		// 세션제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./main.st");
			forward.setRedirect(true);
			return forward;
		}
		
		// 정보 가져오기
		String sno = request.getParameter("sno");
		if(sno == null) {
			sno="0";
		}
//		System.out.println("@@@@@@@@" + sno);
		
		/////// 페이징 처리(1)
		// 한 페이지에 보여줄 글의 개수 설정
		int pageSize=10;
		
		// 현 페이지가 몇페이지인지 확인
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		
		// 시작행 번호 계산
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		
		// 끝행 번호 계산
		int endRow = currentPage * pageSize;
		///////////////////////////////////
		
		// 예약목록 가져오기
		UserDAO vdao = new UserDAO();
		// 가게정보
		List storeInfo = vdao.getStoreInfo(id);
		
		// 예약목록
		List reservList = vdao.getCeoReservList(id,sno,startRow,pageSize);
		
		// 검색목록
		String schList = request.getParameter("schList");
		if(schList == null) {
			schList = "res_no";
		}
		
		// 검색어
		String search = request.getParameter("search");
		// 예약 수
		int vnt = vdao.CeoReservCount(id, sno, schList, search);
		System.out.println("예약 수 : " + vnt);
		
		/////////// 페이징 처리(2)
		// 총 페이지 = 글 개수 / 페이지당 출력
		// 전체 페이지수
		int pageCount = (vnt/pageSize)+(vnt%pageSize==0? 0:1);
		
		// 한 화면에 보여줄 페이지수
		int pageBlock = 10;
		
		// 페이지 블럭의 시작번호
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		
		// 페이지블럭의 끝번호
		int endPage = startPage + pageBlock -1;
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		if(schList !=null && search != null) {
			List searchList = vdao.getCeoReservSearch(id, sno, schList, search,startRow,pageSize);
			
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@");
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("totalVnt", vnt);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageBlock", pageBlock);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("sno", sno);
			request.setAttribute("storeInfo", storeInfo);
			request.setAttribute("searchList", searchList);
			request.setAttribute("schList", schList);
			request.setAttribute("search", search);
			
			
			forward.setPath("./member/ceoMyPage_reserv.jsp");
			forward.setRedirect(false);
			
			return forward;
		}

		
		System.out.println("***************************");
//		System.out.println(sno);
		// request 저장
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalVnt", vnt);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("sno", sno);
		request.setAttribute("storeInfo", storeInfo);
		request.setAttribute("reservList", reservList);
		
		// 페이지 이동
		forward.setPath("./member/ceoMyPage_reserv.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
