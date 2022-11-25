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
				if(command.equals("/CouponManage.co")) {
					System.out.println(" C : /CouponManage.co 호출 ");
					
					forward = new ActionForward();
					forward.setPath("./coupon/CouponManagement.jsp");
					forward.setRedirect(false);
					
					
				}
				else if(command.equals("/CouponIssue.co")) {
					System.out.println(" C : /CouponIssue.co 호출 ");
					
					forward = new ActionForward();
					forward.setPath("./coupon/IssueCoupon3.jsp");
					forward.setRedirect(false);
					
				}
				else if(command.equals("/issueCouponAction.co")) {
					
					action = new IssueCouponAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				else if(command.equals("/CouponManage.co")) {
					
					action = new GetCouponAction();
					
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
