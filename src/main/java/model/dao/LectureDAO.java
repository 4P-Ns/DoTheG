package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.domain.Lecture;
import util.DataSourceManager;

public class LectureDAO {
	
    public static ArrayList<Lecture> getAllLectures() throws SQLException {
        String sql = "SELECT lecture_id, lecture_name, description, createdAt, endAt, member_id, family_id FROM lecture";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Lecture> lectures = new ArrayList<>();

        try {
            conn = DataSourceManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                lectures.add(new Lecture(
                        rs.getInt("lecture_id"),
                        rs.getString("lecture_name"),
                        rs.getString("description"),
                        rs.getDate("createdAt"),
                        rs.getDate("endAt"),
                        rs.getLong("member_id"),
                        rs.getLong("family_id") ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Database error occurred while fetching lectures.", e);
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return lectures;
    }
   
}
