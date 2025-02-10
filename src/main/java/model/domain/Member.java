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

public class Member {
	private long memberId;
	private String id;
	private String pw;
	private String name;
	private String nickname;
	private String email;
	private String role;
	private String profileImagePath;
	private long familyId;
	
	public Member(String id, String password, String username, String nickname, String email, String role) {
		this.id = id;
		this.pw = password;
		this.name = username;
		this.nickname = nickname;
		this.email = email;
		this.role = role;
	}
}
