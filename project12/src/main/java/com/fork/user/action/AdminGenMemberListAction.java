package com.fork.user.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.user.db.UserDAO;

public class AdminGenMemberListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		UserDAO dao = new UserDAO();

		// 아이디 제어 (어드민)
		String id =null;
		HttpSession session = request.getSession();
		if (session.getAttribute("id")!=null) {
			 id = (String) session.getAttribute("id");
		}
		ActionForward forward = new ActionForward();
		
		if(id == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();		
			out.print("<script>");
			out.print("alert('잘못된 접근입니다');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			return null;
		}
		else if (!(id.equals("admin"))){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();		
			out.print("<script>");
			out.print("alert('잘못된 접근입니다');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			return null;
		}
		
		// 아이디 제어 (어드민)
		
		String keyword = (String)request.getParameter("keyword");
		
		
		int cnt = dao.getGenMemCount();
		int pageSize = 9;
		
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
		List genMemList = null;
		
		if (keyword!=null) {
			StringBuffer sb = new StringBuffer();
			request.setAttribute("keyword", keyword);
			keyword = keyword.trim();
			sb.append(keyword);
			sb.insert(0, "%");
			sb.insert(keyword.length()+1, "%");
			System.out.println(sb);
			genMemList = dao.adminGetGenMemList(startRow,pageSize,sb.toString());
			cnt = dao.adminCntGetGenMemList(startRow,pageSize,sb.toString());
		}
		else {
			genMemList = dao.adminGetGenMemList(startRow,pageSize);
		}
		
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
		
		request.setAttribute("genMemList", genMemList);
		//request.setAttribute("boardListAll", dao.getBoardList());
		
		// 페이징처리 정보 저장
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalCnt", cnt);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		// 일반회원 페이징
		
		
		
		
		forward.setPath("./admin/adminGenMemberList.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
