package com.aimae.model;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class UserInfo {
	
	private String userId;
	private String userPw;
	private String email;
	private String userName;
	private String tell;
	private String userAddress;
	private String birthday;
	
	
	public UserInfo(String userId, String userPw, String email, String userName, String tell,
			String userAddress, String birthday) {
		
		this.userId = userId;
		this.userPw = userPw;
		this.email = email;
		this.userName = userName;
		this.tell = tell;
		this.userAddress = userAddress;
		this.birthday = birthday;
	}


	public UserInfo(String userId, String userPw) {
		
		this.userId = userId;
		this.userPw = userPw;
	}

	
	
	
	
	

}
