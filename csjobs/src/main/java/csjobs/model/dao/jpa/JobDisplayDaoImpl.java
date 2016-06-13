package csjobs.model.dao.jpa;

import java.util.Date;
import java.util.List;

import csjobs.model.Job;
import csjobs.model.dao.DisplayJobsDao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.stereotype.Repository;

@Repository
public class JobDisplayDaoImpl implements DisplayJobsDao{

    @PersistenceContext
    private EntityManager entityManager;
    
	@Override
	@PostAuthorize("permitAll")
	public List<Job> getJobs() {
		// TODO Auto-generated method stub
		String query = "from Job where publishDate < :now "
	            + "and (closeDate is null or closeDate > :now) "
	            + "order by publishDate asc";

	        return entityManager.createQuery( query, Job.class )
	            .setParameter( "now", new Date() )
	            .getResultList();

	}

	@Override
	public Job getJob(Long id) {
		// TODO Auto-generated method stub
		return entityManager.find( Job.class, id );
	}

	@Override
	@PostAuthorize("hasRole('ROLE_ADMIN')")
	public List<Job> getJobsByDesc() {
		// TODO Auto-generated method stub
		return entityManager.createQuery("select j from Job j order by publishDate desc", Job.class).getResultList();
	}

}
