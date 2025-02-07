package model.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString

public class User {
	private long user_id;
	private String id;
	private String pw;
	private String name;
	private String nickname;
	private String email;
	private String role;
	private String profile_image_path;
	private String group_id;
}
