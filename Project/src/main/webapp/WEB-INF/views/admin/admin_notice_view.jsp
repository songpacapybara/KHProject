<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 상세페이지</title>
    
    <!-- CSS 파일 링크 -->
    <link rel="stylesheet" href="/project/resources/css/notice/notice_view.css"> 
    
    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gamja+Flower&display=swap" rel="stylesheet">

    <script src="/bbs/resources/js/httpRequest.js"></script>
    
    <script>
        function del(f) {
           
            if (!confirm("삭제 하시겠습니까?")) {
                return;
            }
            

            let url = "notice_delete.do";
            let param = "idx=${vo.notice_idx}";
            sendRequest(url, param, resultFn, "POST");
        }

        function resultFn() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                let data = xhr.responseText;
                let json = (new Function('return ' + data))();

                if (json[0].result == 'yes') {
                    alert("삭제성공");
                    location.href = "admin_notice_list.do?page=${param.page}";
                } else {
                    alert("삭제실패");
                }
            }
        }

        function modify(f) {
        	
        	let notice_title = f.notice_title.value;
        	let notice_name = f.notice_name.value;
        	let notice_content = f.notice_content.value;
        	let notice_idx = f.notice_idx.value;
        	
            let idx = "${vo.notice_idx}";
            let page = "${param.page}";

      
            let url = "admin_notice_modify.do?idx=" + idx + "&page=" + page;

          
            window.location.href = url;
        }
    </script>
    
    
</head>
<body>


<header>
    <jsp:include page="/WEB-INF/views/include/header.jsp"/>
</header>

<!-- main -->
<main>
    <form name="f" method="post">
        <h2>${vo.notice_title}</h2><!-- 글 제목 -->
        <input type="hidden" name="notice_title" value="${vo.notice_title}">
        <input type="hidden" name="notice_idx" value="${vo.notice_idx}">
        
        <div class="content-container">
            <div class="content-item">
                <span class="content-label">작성자</span>
                <span class="content-value">${vo.notice_name}</span>
                <input type="hidden" name="notice_name" value="${vo.notice_name }">
            </div>
            <div class="content-item">
                <span class="content-label">작성일</span>
                <span class="content-value">${vo.notice_regdate}</span>
                
            </div>
        </div>
        <hr>
            <div class="content-box">
                <span class="content-label">내용</span><br>
                <pre class="content-val">${vo.notice_content}</pre>
                <input type="hidden" name="notice_content" value="${vo.notice_content}">
            </div>
            <div class="button-container">
                <input type="button" value="목록으로" onclick="history.go(-1)">
                <input type="button" value="수정하기" onclick="modify(this.form);">
                <input type="button" value="삭제하기" onclick="del();"> 
            </div>
    </form>
</main>

<footer>
    <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</footer>
</body>
</html>
