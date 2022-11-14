<?xml version="1.0" encoding="UTF-8"?>
<%@page import="com.fork.review.db.ReviewDAO"%>
<%@page import="com.fork.review.db.ReviewDTO"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 댓글 정보를 전달받아 AJAX_COMMENT테이블에 저장하고 저장결과를 XML텍스트데이터로 응답하는 JSP문서 --%>
<%
	// 비정상적인 요청에대한 처리
	if(request.getMethod().equals("GET")) {
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	}

	// 한글 입력값에 대한 처리
	request.setCharacterEncoding("UTF-8");
	
	int m_no=Integer.parseInt(request.getParameter("m_no"));
	String rev_content=request.getParameter("rev_content");
	
	ReviewDTO dto = new ReviewDTO();
	dto.setM_no(m_no);
	dto.setRev_content(rev_content);
	
%>