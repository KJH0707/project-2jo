package com.fork.user.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.store.db.StoreDAO;
import com.fork.user.db.CeoDTO;
import com.fork.user.db.UserDAO;

public class CeoMypage_stAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : CeoMypage_stAction_execute 호출 ");
		
		// 아이디 제어 (점주)
		HttpSession session = request.getSession();
		
		String id = null;
		if (session.getAttribute("id")!=null) {
			id = (String) session.getAttribute("id");
		}
		ActionForward forward = new ActionForward();
		StoreDAO adao = new StoreDAO();
		
		if(id==null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();		
			out.print("<script>");
			out.print("alert('잘못된 접근입니다');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			return null;
			
		} else if(adao.isCeo(id)==0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();		
			out.print("<script>");
			out.print("alert('잘못된 접근입니다');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			return null;
		}	
		// 아이디 제어 (점주)
		
		String listType = request.getParameter("listType");
		if(listType == null) {
			listType = "s_regdate";
			
		}
//		System.out.println("@@@@" + listType);
		String s = request.getParameter("s");
		if(s==null) {
			s = "0";
		}
//		System.out.println("@@@@@@@"+s);
		
		/////// 페이징 처리 (1)
		// 한 페이지에 보여줄 글의 개수 설정
		int pageSize=3;
		
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
		
		// DAO - 가게정보 가져오기(getStoreList(id))
		UserDAO sdao = new UserDAO();
		List storeList = sdao.getStoreList(id,listType,startRow,pageSize,s);
		int snt = sdao.getStoreCount(id);
		
		System.out.println("가게 수 : "+snt);
		
		///////// 페이징 처리(2)
		// 글이 있을 때
		// 총 페이지 = 글 개수 / 페이지당 출력
		//  => 만약에 나머지가 있을 때 페이지 1개 추가
		
		// 전체 페이지수
		int pageCount = (snt/pageSize)+(snt%pageSize==0? 0:1);
		
		// 한 화면에 보여줄 페이지수
		int pageBlock = 10;
		
		// 페이지블럭의 시작번호
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		
		// 페이지블럭의 끝번호
		int endPage = startPage + pageBlock -1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		// 정보 request 에 저장
		request.setAttribute("storeList", storeList);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalSnt", snt);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("listType", listType);
		request.setAttribute("s", s);
		
//		System.out.println(storeList);
		
		// 페이지 이동
		forward.setPath("./member/ceoMyPage_st.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
