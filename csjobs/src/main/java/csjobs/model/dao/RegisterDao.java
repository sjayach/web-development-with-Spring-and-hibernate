package csjobs.model.dao;

import java.util.List;

import csjobs.model.User;

public interface RegisterDao {
	
	User register(User user);
	List<User> isDuplicate(String email);
	
}
