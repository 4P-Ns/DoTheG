<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>read.jsp</title>

<style>
@font-face {
    font-family: 'NoonnuBasicGothicRegular';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noon-2410@1.0/NoonnuBasicGothicRegular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

/* 🔹 전체 페이지 스타일 */
body {
    background-color: #fff3d7;
    font-family: 'NoonnuBasicGothicRegular';
    margin: 0;
    padding: 0;
}

/* 🔹 테이블 스타일 */
table {
    width: 90%;
    max-width: 1000px;
    margin: 40px auto;
    border-collapse: collapse;
    background-color: #FFFFFF;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
}

/* 🔹 테이블 헤더 스타일 */
th {
    background-color: #336699;
    color: #FFFFFF;
    font-weight: bold;
    padding: 12px;
    text-align: center;
    font-size: 16px;
}

/* 🔹 테이블 내용 스타일 */
td {
    padding: 14px;
    text-align: left;
    font-size: 14px;
    border-bottom: 1px solid #e3e4e6;
}

/* 🔹 왼쪽 헤더(작성자, 작성일, 제목 등) 스타일 */
.td-label {
    font-weight: bold;
    text-align: center;
    background-color: #f5f5f5;
    width: 150px;
    border-right: 2px solid #e3e4e6; 
}

/* 🔹 '내용' 영역 확장 */
.td-content {
    min-height: 250px; 
    height: auto;
    padding: 20px;
    vertical-align: top;
}

/* 🔹 '내 용' 부분을 넓게 설정 */
.td-content-large {
    min-height: 250px; 
    height: auto;
    padding: 20px;
    vertical-align: top;
}

/* 🔹 테이블 링크 스타일 */
a {
    text-decoration: none;
    color: #336699;
    font-weight: bold;
}

a:hover {
    color: #ef9a4a;
}

/* 🔹 구분선 */
hr {
    background: #FFE39F;
    height: 3px;
    border: 0;
}

/* 🔹 버튼 스타일 */
button {
    background-color: #336699;
    color: white;
    border: none;
    padding: 10px 15px;
    border-radius: 5px;
    font-size: 14px;
    cursor: pointer;
}

button:hover {
    background-color: #ef9a4a;
}

/* 🔹 하단 버튼 정렬 */
div[align="right"] {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}
</style>

<script>
    function sendUpdate() {
        document.requestForm.command.value = "updateForm";
        document.requestForm.submit();
    }

    function sendDelete() {
        var password = prompt("삭제할 게시물의 비밀번호를 입력하세요");
        if (password) {
            document.requestForm.command.value = "delete";
            document.requestForm.password.value = password;
            document.requestForm.submit();
        } else {
            return false;
        }
    }
</script>
</head>

<body>
    <table>
        <tr>
            <th colspan="4">공부 내용 보기</th>
        </tr>
        <tr>
            <td class="td-label"><b>작성자</b></td>
            <td>${requestScope.author}</td>
        </tr>
        <tr>
            <td class="td-label"><b>작성일</b></td>
            <td>${requestScope.resultContent.createdAt}</td>
        </tr>
        <tr>
            <td class="td-label"><b>제 목</b></td>
            <td>${requestScope.resultContent.title}</td>
        </tr>
        <tr>
            <td class="td-label"><b>내 용</b></td>
            <td class="td-content-large">${requestScope.resultContent.content}</td> 
        </tr>
        <tr>
            <td colspan="4" style="text-align: center;">
                <form name="requestForm" method="post" action="article">
                    <input type="hidden" name="article_id" value="${requestScope.resultContent.articleId}">
                    <input type="hidden" name="command" value="">
                    
                    <c:if test="${cookie.userId.value eq requestScope.authorUserId}">
                        <button type="button" onclick="sendUpdate()">수정하기</button>
                        <button type="button" onclick="sendDelete()">삭제하기</button>
                    </c:if>
                </form>
            </td>
        </tr>
    </table>

    <hr>
    <div align='right'><a href="article?command=board">게시판으로 돌아가기</a></div>

</body>
</html>
