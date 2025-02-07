<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>article_view.jsp</title>
</head>

<body>
	<table align="center" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">
		<colgroup>
			<col width="7%" />
			<col width="60%" />
			<col width="11%" />
			<col width="15%" />
			<col width="7%" />
		</colgroup>
	
		<tr>
			<td bgcolor="#336699">
				<p align="center">
					<font color="white"> 
						<b><span style="font-size: 9pt;">제목</span></b>
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
					<font color="white"><b><span style="font-size: 9pt;">수행 여부</span></b></font>
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
								<span style="font-size: 9pt;"> 
									<!-- 제목 클리시 해당 게시글만 보기 화면으로 이동
									기능 구현시 pk에 즉 게시글 구분하는 방명록 번호가 중요
									요청시 게시글 보기와 방명록 번호값 전송 
									 -->
									<a href="board?command=article_detail&num=${article.articleId}"> ${article.title}</a>
								</span>
							</p>
						</td>
						<td bgcolor="">
							<p align="center">
								<span style="font-size: 9pt;"> ${article.authorId}</span>
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
	<hr>
	
	<div align="right">
		<span style="font-size: 9pt;">&lt;<a href="write.html">글쓰기</a>&gt;
		</span>
	</div>
</body>
</html>