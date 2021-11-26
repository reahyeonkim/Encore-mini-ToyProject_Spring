<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.a.bss.service.impl.BssDAO"%>
<%@ page import="com.a.bbs.service.BssVO" %>
<%@ page import="java.util.List"%>
<%-- 로그인이 성공했을 경우, 게시판 목록을 출력하는 파일 (Controller / view) 기능   --%>

<%
	//1. db 연동 처리
	BssVO vo = new BssVO();
	BssDAO dao = new BssDAO();
	List<BssVO> bssList = dao.getBssList(vo);

	//2. 응답(목록)화면 처리
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>커뮤니티</title>
</head>
<body>
	<h1>커뮤니티 게시판</h1>
	<!-- 검색목록 결과 출력 시작 -->
	<div align="center">
	<!-- 검색어 입력창 -->
	<form action="getBssList.jsp" method="post">
		<table class="table table-striped" >
			<tr>
				<td>
					<select name="searchCondition">
						<option value="TITLE">제목</option>
						<option value="CONTENT">내용</option>
					</select>
					<input type="text" name="searchKeyword" />
					<input type="submit" value="검색" />
				</td>
			</tr>
		</table>
	</form>
	<!-- 검색어 입력창 끝 -->
		<table class="table table-striped" >
			<tr>
				<th width ="100">번호</th>
				<th width ="200">제목</th>
				<th width ="150">작성자</th>
				<th width ="150">등록일</th>
				<th width ="100">조회수</th>
			</tr>
			<%
				for (BssVO bss : bssList) {
			%>
			<tr>
				<td width ="100"><%= bss.getSeq() %></td>
				<td width ="200"> 
				<a href="getBss.jsp?seq=<%= bss.getSeq() %>" >
					 <%= bss.getTitle() %>
				</a>
				</td>
				<td width ="150"><%= bss.getWriter() %></td>
				<td width ="150"><%= bss.getRegDate() %></td>
				<td width ="100"><%= bss.getCnt() %></td>
			</tr>
			<%
				}
			%>

		</table>

	</div>


	<br/>
	<form class="d-flex"  action="insertBss.jsp">
        <button class="btn btn-outline-success" type="submit" >글등록 하러 가기</button>
	</form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>