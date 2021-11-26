<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.a.bss.service.impl.BssDAO" %>    
<%@ page import="com.a.bbs.service.BssVO"%>   


<%
	//1 사용자 입력 정보 추출
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String seq = request.getParameter("seq");


	//2 db 연동처리
	BssVO vo = new BssVO();
	vo.setSeq(Integer.parseInt(seq));
	vo.setTitle(title);
	vo.setContent(content);
		
	BssDAO dao = new BssDAO();
	dao.updateBss(vo);
	
	//3. 화면 내비게이션
	response.sendRedirect("getBssList.jsp");
%> 