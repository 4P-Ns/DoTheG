<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>배우는 즐거움 떠나는 설렘, 두더지(DoTheG)</title>
    <style>
    @font-face {
        font-family: 'NoonnuBasicGothicRegular';
        src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noon-2410@1.0/NoonnuBasicGothicRegular.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
    }
    body {
        font-family: 'NoonnuBasicGothicRegular';
        height: 100%;
        margin: 0;
        padding: 0;
    }

    .header {
        background-color: #FFE39F;
        padding: 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .headerLogo img {
        width: 180px;
        height: auto;
    }

    .headerLinks a {
        margin-left: 20px;
        text-decoration: none;
        font-size: 28px;
        font-weight: bold;
        color: #553631;
    }

    .headerLinks a:hover {
        color: #FFAD60;
    }

    .main {
        display: flex;
        align-items: center;
        padding: 100px;
        justify-content: space-between;
    }

    .mainText {
        flex: 1;
        padding-right: 50px;
    }

    .mainText * {
        max-width: 100%;
        box-sizing: border-box;
    }

    .mainText .firstParagraph {
        font-size: 28px;
        font-weight: bold;
        color: #553631;
    }

    .mainText h1 {
        line-height: 1.2;
        font-size: 50px;
        color: #E28D3E;
    }

    .mainText .secondParagraph {
        line-height: 1.5;
        font-size: 18px;
        color: #553631;
    }

    .mainImage {
        flex: 0 0 auto;
        width: 40%;
    }

    .mainImage img {
        width: 100%;
        height: auto;
        display: block;
    }

    .mainButton {
        background-color: #E28D3E;
        color: white;
        border: none;
        padding: 15px 30px;
        font-size: 18px;
        font-weight: bold;
        border-radius: 5px;
        cursor: pointer;
    }

    .mainButton:hover {
        background-color: #FFE39F;
    }

    .footer {
        position: fixed;
        bottom: 0;
        left: 0;
        right: 0;
        background-color: #FFE39F;
        padding: 20px;
        display: flex;
        justify-content: flex-end;
        align-items: flex-end;
    }

    .footerLogo img {
        width: 100px;
        height: auto;
    }

    .footerSnsLinks {
        display: flex;
        align-items: flex-end;
    }

    .footerSnsLinks a {
        margin-left: 20px;
        text-decoration: none;
        color: #553631;
        font-size: 30px;
    }
    </style>
</head>
<body>

    <!-- Header Section -->
    <div class="header">
        <div class="headerLogo">
            <img src="/DoTheG/images/serviceLogo_ko.png" alt="로고 이미지">
        </div>
        <div class="headerLinks">
            <a href="/DoTheG/view/lectureProfile.jsp">수업 목록</a>
            
            <!-- 로그인 상태일 때만 "나의 수업" 버튼 보이기 -->
            <c:if test="${not empty cookie.userId.value}">
                <a href="/DoTheG/article?command=board">나의 수업</a>
                <a href="/DoTheG/article?command=logout">로그아웃</a>
            </c:if>

            <!-- 로그인 상태가 아닐 때만 "로그인 / 회원가입" 버튼 보이기 -->
            <c:if test="${empty cookie.userId.value}">
                <a href="login.html">로그인</a>
                <a href="signup.html">회원가입</a>
            </c:if>
        </div>
    </div>

    <!-- MainPage Section -->
    <div class="main">
        <div class="mainText">
            <p class="firstParagraph">배우고 싶은 것도, 보고 싶은 것도 많은 당신</p>
            <h1>두지런하게 공부하고 함께 떠나요</h1>
            <p class="secondParagraph">*두지런하게'란? :'두(Do) + 더(더하다) + G(지식)'의 의미를 가진 '두더지'와 '부지런하게'의 합성어로,<br>
                "두더지처럼 부지런하게 배움의 땅을 파고드는 긍정적인 도전자들의 자세"를 의미합니다.</p><br><br>
            <button class="mainButton" onclick="location.href='/DoTheG/view/lectureProfile.jsp'" >떠날 준비하기</button>
        </div>
        <div class="mainImage">
            <img src="/DoTheG/images/mainPage.png" alt="메인 이미지">
        </div>
    </div>

    <!-- Footer Section -->
    <div class="footer">
        <div class="footerLogo">
            <img src="/DoTheG/images/companyLogo.png" alt="회사 로고">
        </div>
        <div class="footerSnsLinks">
            <a href="#"><i class="fa fa-instagram" style="color: #553631;"></i></a>
            <a href="#"><i class="fa fa-linkedin" style="color: #553631;"></i></a>
            <a href="#"><i class="fa fa-youtube" style="color: #553631;"></i></a>
        </div>
    </div>

</body>
</html>
