<%@page import="java.util.Map"%>
<%@page import="model.dao.MemberDAO"%>
<%@page import="model.domain.Member"%>
<%@page import="model.dao.LectureDAO"%>
<%@page import="model.domain.Lecture"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>🦔 두더지 선생님 리스트 🦔</title>
    <style>
	@font-face {
	    font-family: 'NoonnuBasicGothicRegular';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noon-2410@1.0/NoonnuBasicGothicRegular.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
	}
	
	img {
	        max-width: 100%;
	        height: auto;
	    }
	
	h1 {
	    text-align: center;
	    margin-bottom: 40px;
	    font-size: 50px;
	    color: #553631;
	}
	
	body {
	  background-color: #fffdf7;
	  font-family: 'NoonnuBasicGothicRegular';
	}
	  
	
	.language-list {
	    display: flex;
	    justify-content: center;
	    gap: 20px;
	    margin-bottom: 40px;
	    flex-wrap: wrap;
	}
	
	.language-item {
	    display: flex;
	    align-items: center;
	    background-color: #ffd462;
	    border-radius: 15px;
	    padding: 10px;
	    box-shadow: 0 2px 5px #553631;
	}
	
	.language-item img {
	    width: 40px;
	    height: 40px;
	    object-fit: contain;
	    margin-right: 10px;
	}
	
	.language-item span {
	    font-weight: bold;
	    color: #333;
	    font-size: 28px;
	}
	
	.teacher-grid {
	    display: grid;
	    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); /* 반응형 3열 구조 */
	    gap: 20px; /* 카드 간격 */
	    padding: 20px; /* 컨테이너 내부 여백 */
	    justify-content: center; /* 가운데 정렬 */
	    align-items: start; /* 상단 정렬 */
	}
	
	.teacher-card {
	    text-align: center;
	    padding: 20px;
	    border-radius: 16px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    background-color: rgba(255, 227, 159, 1);
	    position: relative;
	    height: auto; /* 높이를 내용에 맞게 조정 */
	}
	
	.teacher-image {
	    width: 100%;
	    height: 200px; /* 이미지 높이 고정 */
	    object-fit: cover; /* 이미지 비율 유지 */
	    border-radius: 8px;
	    margin-bottom: 15px;
	}
	
	
	.teacher-name {
	    font-weight: bold;
	    margin: 10px 0;
	    font-size: 24px; /* 폰트 크기 축소 */
	    color: #553631;
	}
	
	.teacher-desc {
	    color: #444444;
	    font-weight: bold;
	    margin: 10px 0;
	    font-size: 18px; /* 폰트 크기 축소 */
	}
	
	p {
    margin: 5px 0; /* 텍스트 간격 조정 */
    font-size: 16px; /* 기본 폰트 크기 */
    color: #333333;
	}
	</style>
</head>
<body>
    <h1>🦔 두더지 선생님 리스트 🦔</h1>
    <div class="container">
    <div class="language-list">
            <div class="language-item">
                <img src="../images/english_lang.png" alt="영어">
                <span>영어</span>
            </div>
            <div class="language-item">
                <img src="../images/japanes_lang.png" alt="일본어">
                <span>일본어</span>
            </div>
            <div class="language-item">
                <img src="../images/chinese_lang.png" alt="중국어">
                <span>중국어</span>
            </div>
            <div class="language-item">
                <img src="../images/franch_lang.png" alt="프랑스어">
                <span>프랑스어</span>
            </div>
            <div class="language-item">
                <img src="../images/spanish_lang.png" alt="스페인어">
                <span>스페인어</span>
            </div>
            <div class="language-item">
                <img src="../images/arabic_lang.png" alt="아랍어">
                <span>아랍어</span>
            </div>
        </div>
        
        <div class="teacher-grid">
	        <%
	            LectureDAO dao = new LectureDAO();
	            List<Lecture> lectures = dao.getAllLectures();
	            
	            MemberDAO dao2 = new MemberDAO();
	            Map<Integer, String> lectureTeachers = dao2.getLecturesTeacher();
	           
	        %>
	        
	        <% 
	            for (Lecture lecture : lectures) {
	                // Placeholder image path, replace with actual paths from your database
	                String imagePath = "../images/teacher0" + lecture.getLectureId() + ".png";
	
	                int lectureId = Integer.parseInt(String.valueOf(lecture.getLectureId()).trim());
	
	                boolean idExists = lectureTeachers.containsKey(lectureId);
	
	                String teacherName = "정보 없음";
	                if (idExists) {
	                    teacherName = lectureTeachers.get(lectureId);
	                }
	        %>

	        <div class="teacher-card">
	            <img src="<%= imagePath %>" alt="Lecture Image" class="teacher-image">
	            <h3 class="teacher-name"><%= teacherName %> 선생님</h3>
	            <p class="teacher-desc"><%= lecture.getDescription() %></p>
	            <p><strong>Start:</strong> <%= lecture.getCreatedAt() %></p>
	            <p><strong>End:</strong> <%= lecture.getEndAt() %></p>
	            
	        </div>

		
        <%
            }
        %>
   	 		</div>
    	</div>
</body>
</html>
