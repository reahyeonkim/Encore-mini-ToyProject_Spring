<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.a.users.servicee.impl.UserDAO" %>
<%@ page import="com.a.users.servicee.UserVO" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");

	UserVO vo = new UserVO();
	vo.setId(id);
	vo.setPassword(password);
	vo.setName(name);
	vo.setEmail(email);

	UserDAO dao = new UserDAO();
	dao.insertUser(vo);
	
	response.sendRedirect("main.jsp");
	

	
%>