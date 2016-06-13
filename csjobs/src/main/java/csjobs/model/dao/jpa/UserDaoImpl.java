package csjobs.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import csjobs.model.User;
import csjobs.model.dao.UserDao;

@Repository
public class UserDaoImpl implements UserDao {

	@PersistenceContext
    private EntityManager entityManager;

	@Override
    public User getUser( Long id )
    {
        return entityManager.find( User.class, id );
    }
	
	@Override
	public User getUser(String userEmail) {
		// TODO Auto-generated method stub
		User user;
		try {
		System.out.println("try");
		String query="from User where email='"+userEmail+"'";
		user = entityManager.createQuery(query, User.class).getSingleResult();
		}
		catch(Exception e) {
			System.out.println("catch");
			user = null;
		}
		return user;
	}
	
	@Override
	public List<User> getUsers() {
		// TODO Auto-generated method stub
		return entityManager.createQuery("from User order by id", User.class).getResultList();
	}
	
	@Override
    public User getUserByUsername( String username )
    {
        // This method is mainly used by the security code which usually needs
        // both the user credentials (i.e. username and password) and the
        // granted authorities (i.e. roles), so here we load the roles
        // collection "eagerly" using a join fetch to avoid a second query.
        String query = "from User user left join fetch user.roles "
            + "where lower(email) = :username";
        System.out.println("query " + query +" "+username);
        List<User> users = entityManager.createQuery( query, User.class )
            .setParameter( "username", username.toLowerCase() )
            .getResultList();
        System.out.println("size of the query" +users.size());
        return users.size() == 0 ? null : users.get( 0 );
    }

}
