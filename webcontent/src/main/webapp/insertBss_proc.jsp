<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.a.bss.service.impl.BssDAO"%>
<%@ page import="com.a.bbs.service.BssVO" %>



<%
	//1. 사용자 입력 정보 추출
	//전송방식이 post 로 전달되기 떄문에 한글 깨짐 방지
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String writer= request.getParameter("writer");
	String content= request.getParameter("content");
	
	//2. db 연동 처리
	BssVO vo = new BssVO();
	vo.setTitle(title);
	vo.setWriter(writer);
	vo.setContent(content);
	
	BssDAO dao = new BssDAO();
	dao.insertBss(vo);
	
	//3. 화면 내비게이션 (글목록으로 이동)
	response.sendRedirect( "getBssList.jsp");





%>