package com.fork.coupon.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.co")
public class CouponFrontController extends HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" Store - doProcess()");
		
			// 1. 가상주소 계산
			String requestURI = request.getRequestURI();
			System.out.println(" C : requestURI : " + requestURI);
			String ctxPath = request.getContextPath();
			System.out.println(" C : ctxPath : " + ctxPath);
			String command = requestURI.substring(ctxPath.length());
			System.out.println(" C : command : " + command);
			
			System.out.println(" C : 1. 가상주소 계산 끝 \n");
			
			Action action = null;
			ActionForward forward = null;
					
			// 2. 가상주소 매핑
			if(command.equals("/CouponManage.co")) { // 점주용
				System.out.println(" C : /CouponManage.co 호출 ");
				
				action = new ManagementListAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/CouponIssue.co")) {
				System.out.println(" C : /CouponIssue.co 호출 ");
				
				action = new CouponIssuePreAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/issueCouponAction.co")) {
				System.out.println(" C : /issueCouponAction.co 호출 ");
				
				action = new IssueCouponAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/CouponModify.co")) {
				System.out.println(" C : /CouponModify.co 호출 ");
				
				// 수정 전 데이터 불러오기 - CouponModifyAction
				action = new CouponModifyAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/ModifyCouponAction.co")) {
				System.out.println(" C : /ModifyCouponAction.co 호출 ");
				
				// 쿠폰 데이터 수정  - CouponModifyProAction
				action = new CouponModifyProAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/CouponDeleteAction.co")) {
				System.out.println(" C : /CouponDeleteAction.co 호출 ");
				
				// 쿠폰 삭제 - CouponDeleteAction
				action = new CouponDeleteAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/MemberCoupon.co")) { // 회원 쿠폰 정보 가져오기
				System.out.println(" C : /MemberCoupon.co 호출 ");
				
				action = new GetCouponAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/eventDetail.co")) { // 이벤트페이지
				System.out.println(" C : /eventDetail.co 호출 ");
				
				// 이벤트 정보 가져오기 - eventDetailAction
				action = new eventDetailAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/getCouponAction.co")) { // 쿠폰발급하기
				System.out.println(" C : /getCouponAction.co 호출 ");
				
				// getCouponProAction
				action = new GetCouponProAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(command.equals("/UseCoupon.co")) { // 쿠폰사용하기
				System.out.println(" C : /UseCoupon.co 호출 ");
				
				// UseCouponAction
				action = new UseCouponAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			System.out.println(" C : 2. 가상주소 매핑 끝 \n");
			// 3. 페이지 이동
			if(forward != null) {
				if(forward.isRedirect()) { // true
					System.out.println(" C : sendRedirect() : " + forward.getPath());
					response.sendRedirect(forward.getPath());
				}else {	// false
					System.out.println(" C : forward() : " + forward.getPath());
					RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
					dis.forward(request, response);
				}
			}
			System.out.println(" C : 3. 페이지 이동 끝 \n");
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" Store - doGet()");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" Store - doPost()");
		doProcess(request, response);

	}
}
