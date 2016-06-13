package csjobs.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import csjobs.model.User;
import csjobs.model.dao.LoginDao;

@Repository
public class LoginDaoImpl implements LoginDao {

	@PersistenceContext
    private EntityManager entityManager;
	
	@Override
	public User getUser(String email, String password) {
		// TODO Auto-generated method stub
		return entityManager.createQuery("from User where email=:email and password=:password", User.class).setParameter("email", email).setParameter("password", password).getSingleResult();
	}

	@Override
	public List<User> isUserAvailable(String email, String password) {
		// TODO Auto-generated method stub
		return entityManager.createQuery("from User where email=:email and password=:password", User.class).setParameter("email", email).setParameter("password", password).getResultList();
	}

}
