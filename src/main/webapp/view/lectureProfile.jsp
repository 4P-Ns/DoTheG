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
	    grid-template-columns: repeat(3, 1fr);
	    gap: 30px;
	}
	
	.teacher-card {
	    text-align: center;
	    padding: 10px;
	    border-radius: 12px;
	    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	    background-color: rgba(255, 227, 159, 1);
	    position: relative;
	    box-shadow: 0 2px 5px #553631;
	    height: 500px;
	}
	
	.teacher-image {
	    width: 90%;
	    height: auto;
	    object-fit: cover;
	    border-radius: 8px;
	    margin-top: 20px; /* 상단 여백 추가 */
	    margin-bottom: 10px;
	    position: relative;
	    z-index: 1;
	}
	
	
	.teacher-name {
	    font-weight: bold;
	    margin: 20px 0;
	    font-size: 36px;
	    color: #553631;
	
	}
	
	.teacher-desc {
	    color: #444444;
	    font-weight: bold;
	    margin: 15px 0;
	    font-size: 28px;
	}
	</style>
</head>
<body>
    <h1>🦔 두더지 선생님 리스트 🦔</h1>
    <div class="container">
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
          
        <div class="teacher-grid">
	        <div class="teacher-card">
	            <img src="<%= imagePath %>" alt="Lecture Image" class="teacher-image">
	            <h3 class="teacher-name"><%= teacherName %>선생님</h3>
	            <p class="teacher-desc"><%= lecture.getDescription() %></p>
	            <p><strong>Start:</strong> <%= lecture.getCreatedAt() %></p>
	            <p><strong>End:</strong> <%= lecture.getEndAt() %></p>
	            
	        </div>
		</div>
		
        <%
            }
        %>
    </div>
    
</body>
</html>
