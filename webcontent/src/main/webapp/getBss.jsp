<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.a.bss.service.impl.BssDAO" %>    
<%@ page import="com.a.bbs.service.BssVO" %>  

<%	//검색 조회 할글 번호 추출
	String seq = request.getParameter("seq");

	BssVO vo = new BssVO();
	vo.setSeq(Integer.parseInt(seq));
	
	BssDAO dao = new  BssDAO();
	BssVO bss = dao.getBss(vo);
	
	

%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<title>글 상세</title>
</head>
<body>
	<h1>글 상세(수정)보기</h1>
	<hr />
	
	<div align="center">
		<form action="updateBss_proc.jsp" method="post">
		<!--hidden 은 사용자 화면 에 보이지 않고 값을 전송할 경우   -->
			<input type="hidden" name="seq" value="<%= bss.getSeq() %>"/>
		
			<table class="table table-striped" >
				<tr>
					<td>제목</td>
					<td><input type="text" name="tatle" value="<%= bss.getTitle() %>" /> </td>
				
				</tr>
				<tr>
					<td>작성자</td>
					<td><%= bss.getWriter() %>" /> </td>
				
				</tr>
				<tr>
					<td>내용</td>
					<td><input type="text" name="content" value="<%= bss.getContent() %> "/> </td>
				
				</tr>
				<tr>
					<td>등록일</td>
					<td><%= bss.getRegDate() %>" /> </td>
				
				</tr>
				<tr>
					<td>조회수</td>
					<td><%= bss.getCnt() %></td>
				</tr>
				<tr>	
					<td><input type="submit" value="글수정" /></td>
					<td><input type="reset" value="취소" /></td>
				</tr>
			</table>
		
		</form>
	</div>
	<hr />
	<form class="d-flex"  action="insertBss.jsp">
        <button class="btn btn-outline-success" type="submit" >새글 등록 하기</button>
      </form>
     
	<button class="btn btn-outline-success" type ="submit" >
	<a href="deleteBss_proc.jsp?seq=<%= bss.getSeq() %>" style="text-decoration:none">글 삭제</a>
	</button>
	 <form class="d-flex"  action=getBssList.jsp>
	 
        <button class="btn btn-outline-success" type="submit" >커뮤니티 가기</button>
      </form>
	
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>	
	
</body>
</html>