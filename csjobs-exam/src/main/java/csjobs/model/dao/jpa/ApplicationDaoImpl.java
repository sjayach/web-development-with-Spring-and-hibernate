package csjobs.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import csjobs.model.Application;
import csjobs.model.Job;
import csjobs.model.User;
import csjobs.model.dao.ApplicationDao;

@Repository
public class ApplicationDaoImpl implements ApplicationDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    @PostAuthorize("returnObject.applicant.id == principal.id or returnObject.isReviewer(principal) or hasRole('ROLE_ADMIN')")
    public Application getApplication( Long id )
    {
        return entityManager.find( Application.class, id );
    }

    @Override
    public Application getApplication( Job job, User applicant )
    {
        String query = "from Application where job = :job and applicant = :applicant";

        List<Application> results = entityManager
            .createQuery( query, Application.class )
            .setParameter( "job", job )
            .setParameter( "applicant", applicant )
            .getResultList();
        return results.size() == 0 ? null : results.get( 0 );
    }

    @Override
    @Transactional
    @PreAuthorize("#application.applicant.id == principal.id")
    public Application saveApplication( Application application )
    {
        return entityManager.merge( application );
    }

	@Override
	public List<Application> getAllApplication(long reviewerId, String term) {
		// TODO Auto-generated method stub
		TypedQuery<Application> query = entityManager.createNamedQuery(
	            "apps.get", Application.class );
		 return query.setParameter( "reviewerId", reviewerId ).
				 setParameter("term", term).getResultList();
	}
	
	@Override
	@Transactional
	public int Update(String text, long appId) {
		TypedQuery<Application> query = entityManager.createNamedQuery(
	            "apps.update", Application.class );
		 return query.setParameter( "appId", appId ).setParameter("text", text).executeUpdate();
	}

}