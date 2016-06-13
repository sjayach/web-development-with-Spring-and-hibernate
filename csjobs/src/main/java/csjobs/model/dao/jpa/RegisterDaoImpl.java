package csjobs.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import csjobs.model.User;
import csjobs.model.dao.RegisterDao;

@Repository
public class RegisterDaoImpl implements RegisterDao {
	
    @PersistenceContext
    private EntityManager entityManager;

	@Override
	@Transactional
	public User register(User user) {
		// TODO Auto-generated method stub
		System.out.println("put into db");
		return entityManager.merge(user);
	}

	@Override
	public List<User> isDuplicate(String email) {
		// TODO Auto-generated method stub
		return entityManager.createQuery( "from User where lower(email)=:username ", User.class ).setParameter("username", email)
		        .getResultList();
	}

}
