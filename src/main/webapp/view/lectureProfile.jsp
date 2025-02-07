<%@page import="model.dao.LectureDAO"%>
<%@page import="model.domain.Lecture"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lecture Profiles</title>
</head>
<body>
    <h1>Lecture Profiles</h1>
    <table border="1">
        <tr>
            <th>Lecture ID</th>
            <th>Lecture Name</th>
            <th>Description</th>
            <th>Created At</th>
            <th>End At</th>
        </tr>
        <%
            LectureDAO dao = new LectureDAO();
            List<Lecture> lectures = dao.getAllLectures();
            for (Lecture lecture : lectures) {
        %>
        <tr>
            <td><%= lecture.getLectureId() %></td>
            <td><%= lecture.getLectureName() %></td>
            <td><%= lecture.getDescription() %></td>
            <td><%= lecture.getCreatedAt() %></td>
            <td><%= lecture.getEndAt() %></td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
