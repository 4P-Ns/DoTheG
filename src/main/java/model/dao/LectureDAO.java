package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.domain.Lecture; // Lecture 클래스 import 필요
import util.DataSourceManager;

public class LectureDAO {
    public List<Lecture> getAllLectures() {
        List<Lecture> lectures = new ArrayList<>();
        String sql = "SELECT lecture_id, lecture_name, description, createdAt, endAt FROM lecture";

        try (Connection conn = DataSourceManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Lecture lecture = new Lecture();
                lecture.setLectureId(rs.getInt("lecture_id"));
                lecture.setLectureName(rs.getString("lecture_name"));
                lecture.setDescription(rs.getString("description"));
                lecture.setCreatedAt(rs.getDate("createdAt"));
                lecture.setEndAt(rs.getDate("endAt"));
                lectures.add(lecture);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lectures;
    }
}
