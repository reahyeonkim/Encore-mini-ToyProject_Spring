<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.a.users.servicee.impl.UserDAO" %>
<%@ page import="com.a.users.servicee.UserVO" %>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");

	UserVO vo = new UserVO();
	vo.setId(id);
	vo.setPassword(password);

	UserDAO dao = new UserDAO();
	UserVO user = dao.getUser(vo);
	

	if (user != null) {
		response.sendRedirect("main.jsp");

	} else {
		response.sendRedirect("login.jsp");
	}
%>
