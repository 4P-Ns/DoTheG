package model.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString

public class Lecture {
	private long lectureId;
	private String lectureName;
	private String description;
	private Date createdAt; 
	private Date endAt;
	private long memberId; // teacherId
	private long familyId;
}
