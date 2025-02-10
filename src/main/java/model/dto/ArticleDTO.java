package model.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import model.domain.Article;
import model.domain.Member;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class ArticleDTO {
	private long articleId;
	private String title;
	private String content;
	private Date createdAt;
	private Date updatedAt;
	private boolean taskDone;
	private String authorName;
	
	public ArticleDTO(Article article, String nickname){
		this.articleId = article.getArticleId();
		this.title = article.getTitle();
		this.content = article.getContent();
		this.createdAt = article.getCreatedAt();
		this.updatedAt = article.getUpdatedAt();
		this.taskDone = article.isTaskDone();
		this.authorName = nickname;
	}
}
