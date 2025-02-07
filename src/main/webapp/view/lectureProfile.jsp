<%@page import="model.dao.LectureDAO"%>
<%@page import="model.domain.Lecture"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lecture Profiles</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1 {
            text-align: center;
        }
        .container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        .card {
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            padding: 20px;
            background-color: #fff;
        }
        .card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .card h2 {
            font-size: 20px;
            margin: 10px 0;
        }
        .card p {
            color: #666;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <h1>Lecture Profiles</h1>
    <div class="container">
        <%
            LectureDAO dao = new LectureDAO();
            List<Lecture> lectures = dao.getAllLectures();
            for (Lecture lecture : lectures) {
                // Placeholder image path, replace with actual paths from your database
                String imagePath = "../images/teacher0" + lecture.getLectureId() + ".png";
        %>
        <div class="card">
            <img src="<%= imagePath %>" alt="Lecture Image">
            <h2><%= lecture.getLectureName() %></h2>
            <p><%= lecture.getDescription() %></p>
            <p><strong>Start:</strong> <%= lecture.getCreatedAt() %></p>
            <p><strong>End:</strong> <%= lecture.getEndAt() %></p>
        </div>
        <%
            }
        %>
    </div>
</body>
</html>
