package csjobs.model.dao;

import java.util.List;

import csjobs.model.User;

public interface LoginDao {
	
	User getUser(String email, String password);
	List<User> isUserAvailable(String email, String password);
}
