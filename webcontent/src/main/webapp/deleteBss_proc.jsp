<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.a.bss.service.impl.BssDAO" %>
<%@ page import="com.a.bbs.service.BssVO"%>  




<%
	//1. 삭제를 위한 seq 파라메터 값 추출
		String seq = request.getParameter("seq");

	//2. db 연동처리
		BssVO vo =new BssVO();
		vo.setSeq(Integer.parseInt(seq));
	
		BssDAO dao = new BssDAO();
		dao.deleteBss(vo);
	
	//3. 화면 내비게이션
	response.sendRedirect("getBssList.jsp");
%>
    
