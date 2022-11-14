<?xml version="1.0" encoding="UTF-8"?>
<%@page import="site.itwill.utility.Utility"%>
<%@page import="com.fork.review.db.ReviewDAO"%>
<%@page import="com.fork.review.db.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- AJAX_COMMENT테이블에 저장된 모든 댓글을 검색하여 XML텍스트데이터로 응답하는 JSP문서 >> 값저장은 JSON텍스트로 --%>
<%
	// 전체검색
	List<ReviewDTO> ajaxCommentList=ReviewDAO.getDAO().selectAjaxCommentList();
%>

<result>
	<% if (!ajaxCommentList.isEmpty()) { %>
		<code>success</code>
		<data><![CDATA[
			[
			<% for(int i=0; i<reviewtList.size();i++) { %>
				<% if(i>0) { %>,<% } %>
				{"num":<%=ajaxCommentList.get(i).getNum()%>
				,"writer":"<%=Utility.toJSON(ajaxCommentList.get(i).getWriter())%>"
				,"content":"<%=Utility.toJSON(ajaxCommentList.get(i).getContent())%>"
				,"writeDate":"<%=ajaxCommentList.get(i).getWriteDate()%>"}
				
			<% } %>
			]
		]]></data>
	<% } else { %>
		<code>empty</code>
		<message><![CDATA[첫번째 댓글을 등녹해 주떼욤]]></message>
	<% } %>
</result>