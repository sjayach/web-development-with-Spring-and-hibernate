package csjobs.model.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import csjobs.model.Job;
import csjobs.model.dao.JobDao;

@Repository
public class JobDaoImpl implements JobDao{
	
	@PersistenceContext
    private EntityManager entityManager;

	
	@Override
	@Transactional
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public Job saveJob(Job job) {
		// TODO Auto-generated method stub
		return entityManager.merge( job );
	}

}
