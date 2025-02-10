<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>article_view.jsp</title>

<style>
@font-face {
	font-family: 'NoonnuBasicGothicRegular';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/noon-2410@1.0/NoonnuBasicGothicRegular.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

.header {
	height: 50px; /* 헤더 높이 줄이기 */
	display: flex;
	align-items: center;
	justify-content: left;
	padding-left: 20px; /* 왼쪽에 여백 추가 */
}

.headerLogo {
    margin-top: 15px; /* 위쪽 여백 추가 */
}

.headerLogo img {
	height: 50px; /* 로고 크기 조정 */
}

body {
	background-color: #fff3d7;
	font-family: 'NoonnuBasicGothicRegular';
	margin: 0;
	padding: 0;
}

table {
	width: 90%; /* 테이블 크기 조정 */
	max-width: 1000px; /* 최대 크기 제한 */
	margin: 20px auto;
	border-collapse: collapse;
	background-color: #FFFFFF;
}

th, td {
	padding: 10px;
	text-align: center;
	border: 1px solid #e3e4e6;
}

th {
	background-color: #ef9a4a;
	color: #553631;
	font-weight: bold;
}

td {
	font-size: 9pt;
}

a {
	text-decoration: none;
	color: #336699;
	font-weight: bold;
}

a:hover {
	color: #ef9a4a;
}

hr {
	background: #FFE39F;
	height: 3px;
	border: 0;
}

div[align="right"] {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

/* 글쓰기 버튼 스타일 */
.write-button {
    display: inline-block;
    background-color: #FF7A00;
    color: white;
    padding: 8px 16px;
    font-size: 14px;
    font-weight: bold;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: background-color 0.3s;
    float: right; /* 상단 우측 정렬 */
    margin-bottom: 10px; /* 버튼 아래 간격 */
}

.write-button:hover {
    background-color: #FF4500;
}
</style> 

</head>

<body>

	<div class="header">
		<a href="/DoTheG/view/main.jsp">
        	<div class="headerLogo">
            	<img src="/DoTheG/images/serviceLogo_ko.png" alt="로고 이미지">
        	</div>
		</a>
    </div>

	<div class="main">
		
		<div align="right">
			<a href="view/write.html" class="write-button">글쓰기</a>
		</div>
	
		<table align="center" cellpadding="5" cellspacing="2" width="100%"
			bordercolordark="white" bordercolorlight="black">
			<colgroup>
				<col width="40%" />
				<col width="20%" />
				<col width="20%" />
				<col width="20%" />
			</colgroup>

			<tr>
				<td bgcolor="#336699">
					<p align="center">
						<font color="white"> <b><span style="font-size: 9pt;">제목</span></b>
						</font>
					</p>
				</td>
				<td bgcolor="#336699">
					<p align="center">
						<font color="white"> <b><span style="font-size: 9pt;">작
									성 자</span></b>
						</font>
					</p>
				</td>
				<td bgcolor="#336699">
					<p align="center">
						<font color="white"><b><span style="font-size: 9pt;">작
									성 일</span></b></font>
					</p>
				</td>
				<td bgcolor="#336699">
					<p align="center">
						<font color="white"><b><span style="font-size: 9pt;">수행
									여부</span></b></font>
					</p>
				</td>
			</tr>

			<c:choose>
				<c:when test="${empty requestScope.articles}">
					<tr>
						<td colspan="5">
							<p align="center">
								<b><span style="font-size: 9pt;">등록된 게시글이 없습니다.</span></b>
							</p>
						</td>
					</tr>
				</c:when>

				<c:otherwise>
					<!-- ArrayList에 방명록 데이터가 있는 상태 -->
					<c:forEach items="${requestScope.articles}" var="article">
						<tr>
							<td bgcolor="">
								<p>
									<span style="font-size: 9pt;"> <!-- 제목 클리시 해당 게시글만 보기 화면으로 이동
									기능 구현시 pk에 즉 게시글 구분하는 방명록 번호가 중요
									요청시 게시글 보기와 방명록 번호값 전송 
									 --> <a
										href="/DoTheG/article?command=article_detail&article_id=${article.articleId}">
											${article.title}</a>
									</span>
								</p>
							</td>
							<td bgcolor="">
								<p align="center">
									<span style="font-size: 9pt;"> ${article.authorName}</span>
								</p>
							</td>
							<td bgcolor="">
								<p align="center">
									<span style="font-size: 9pt;"> ${article.createdAt}</span>
								</p>
							</td>
							<td bgcolor="">
								<p align="center">
									<span style="font-size: 9pt;"> ${article.taskDone}</span>
								</p>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	<hr>

</body>
</html>