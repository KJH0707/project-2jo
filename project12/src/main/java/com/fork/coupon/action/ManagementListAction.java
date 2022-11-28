package com.fork.coupon.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.coupon.db.CouponDAO;
import com.fork.store.db.StoreDAO;
import com.fork.user.db.CeoDTO;
import com.fork.user.db.UserDAO;

public class ManagementListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		ActionForward forward = new ActionForward();
		if(id==null) {
			forward.setPath("./Login.us");
			forward.setRedirect(true);
			return forward;
		}
		
		// 전달정보 처리
		UserDAO udao = new UserDAO();
		CeoDTO cdto = udao.getCEO(id);
		int c_no = cdto.getC_no();
		
		CouponDAO dao = new CouponDAO();
		//List couponList = dao.getIssueCoupon(id);
		List couponList = dao.getAllCoupon(id, c_no);
		List InvaildCoupon = dao.getInvaildCoupon(id, c_no);
		
		// 게시판 전체 글 개수 확인
		int cnt = dao.getCouponCount(id, c_no);
	
		System.out.println(" M : 전체 쿠폰 개수 : " +cnt+ "개");
		
		////////////////////////////////////////////////////////////////////////////
		//페이징 처리(1) -  페이지에서 몇 개를 보여줄 것인지
				
		// 한 페이지에 보여줄 글의 개수
		int pageSize = 5;
		
		// 현 페이지가 몇 페이지인지 확인
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		
		// 시작행 번호 계산하기 	1	6	11	...
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		
		// 끝행 번호 계산하기 	5	10	15	40 ...
		int endRow = currentPage * pageSize;
		
		
		///////////////////////////////////////////////////////////////////////////////////////////////
		/////////////////////////페이징 처리 (2)- 몇 페이지 인지//////////////////////////////////////////////
				
		// 글이 있을 때
		
		// 총 페이지 = 글 개수(총량) / 페이지당 출력
		// 	=> 만약, 나머지가 있을 때 페이지 1개 추가
		
		// 전체 페이지 수
		int pageCount =(cnt/pageSize)+(cnt%pageSize==0? 0:1);
		
		// 한 화면에 보여줄 페이지 수
		int pageBlock = 5;
		
		// 페이지블럭의 시작번호	1 ~ 10 => 1, 	11 ~ 20 => 11	21 ~ 30 => 21
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		// 페이지블럭의 끝번호
		int endPage = startPage+pageBlock-1 ;
		
		if(endPage > pageCount){
		endPage = pageCount;
		}
		
		/////////////////////////////////////////////////////////////////////////////////////////////////////
		
		// Action -> jsp페이지 정보 전달 (request 영역객체 저장)
		ArrayList couponListAll = dao.getAllCoupon(id, c_no, startRow, pageSize);
		request.setAttribute("couponListAll", couponListAll);
		
		// 페이징처리 정보 저장
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalCnt", cnt);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);

		// request 영역에 저장
		request.setAttribute("couponList", couponList);
		request.setAttribute("InvaildCoupon", InvaildCoupon);
		
		forward.setPath("./coupon/CouponManagement.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
