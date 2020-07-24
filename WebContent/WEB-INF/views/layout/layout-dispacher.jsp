<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String view = request.getParameter("view");
	if (view.contains("show")) {
		pageContext.forward("admin-layout.jsp");
	} else {
		pageContext.forward("blank-layout.jsp");
	}
%>