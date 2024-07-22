<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
		<head>	
			<meta charset="UTF-8">
			<title>Insert title here</title>
			
			<script>
    function send(f) {
       
       
            f.action = 'admin_insert.do'; 
            f.submit(); 
      
    }
</script>
		</head>
		
		
		
		
		<body>
		
	<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	
		<form name="f" method="post" action="insert.do">
		
			<table border="1" width="700" align="center">
				<caption>:: 공 지 사 항 : :</caption>
				
				<tr>
					<th style="width:300px">제 목</th>
					<td><input name="notice_title" size="50"></td>					
				</tr>
				
				<tr>
					<th>작성자</th>
					<td><input name="notice_name" value="운영자" size="50" readonly></td>					
				</tr>
				
				<tr>
					<th>내용</th>
					<td>
					<textarea row="20" cols="100"
							  style="resize:none"
							  name="notice_content"></textarea>	
					</td>					
				</tr>
				
				<tr>
					<th>어드민 비밀번호</th>
					<td>
					<input type="password" name="admin_pwd" value="">
					</td>					
				</tr>
				
				<tr>
				<th>어드민 비밀번호 확인</th>
					<td>
					<input type="password" name="admin_pwd_checked" value="">
					</td>
				</tr>
				
				<tr>
				<td colspan="2" align="center">
					<input type="button" value="등록" onclick="send(this.form)">    
					<input type="button" value="취소" onclick="history.go(-1)">
				</td>
			</tr>
			</table>
		</form>
		
		
		
		
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
		</body>
		
	</html>