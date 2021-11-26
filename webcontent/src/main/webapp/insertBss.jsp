<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 새로운 글을 입력하는 화면 --%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>글 등록</title>
</head>
<body>
	<h1>커뮤니티 글등록 하기</h1>
	<hr />
	<div align="center">
		<form action="insertBss_proc.jsp" method="post">
			<table class="table table-striped">
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" required="required" /></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="title" required="required" /></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="content" rows="15" cols="100" required="required"></textarea></td>
				</tr>
				<tr>
					<td><input type="submit" value="글등록"></td>
					<td><input type="reset" value="취소"></td>
				</tr>
			
			</table>
		
		
		</form>
	
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	</div>
	<form class="d-flex"  action="getBssList.jsp">
        <button class="btn btn-outline-success" type="submit" >커뮤니티 로 가기</button>
    </form>
</body>
</html>