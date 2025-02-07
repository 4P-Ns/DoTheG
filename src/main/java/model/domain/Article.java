package model.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString

public class Article {
	private long articleId;
	private long authorId;
	private String title;
	private String content;
	private Date createdAt;
	private Date updatedAt;
	private long familyId;
	private boolean taskDone;

	public Article(String title, String content) {
		this.title = title;
		this.content = content;
	}
}
