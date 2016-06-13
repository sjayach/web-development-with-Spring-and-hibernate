package csjobs.model.dao.jpa;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import csjobs.model.Application;
import csjobs.model.File;
import csjobs.model.Job;
import csjobs.model.User;
import csjobs.model.dao.ApplicantDao;

@Repository
public class ApplicantDaoImpl implements ApplicantDao {

	@PersistenceContext
    private EntityManager entityManager;
	
	@Autowired
    private ServletContext context;

	
	@Override
	public List<Job> getAppliedJobs(String email) {
		
		return entityManager.createQuery( "select j from Job j where j in (select a.job from Application a join a.applicant app where app.email=:applicantEmail)", Job.class )
	            .setParameter("applicantEmail", email).getResultList();
	}

	@Override
	public List<Job> getAvailableJobs(String email) {
		// TODO Auto-generated method stub
		return entityManager.createQuery( "select j from Job j where j.publishDate is not null and ( j.closeDate >= CURRENT_DATE or j.closeDate is null) and j not in (select a.job from Application a join a.applicant app where app.email=:applicantEmail)", Job.class )
	            .setParameter("applicantEmail", email).getResultList();
	}

	@Override
	@PostAuthorize ("principal.username == returnObject.applicant.username")
	public Application getApplication(long id, String appEmail) {
		// TODO Auto-generated method stub
		return entityManager.createQuery("select app from Application app join app.job j join app.applicant user where j.id=:jobid and user.email=:userEmail", Application.class).setParameter("jobid", id).setParameter("userEmail", appEmail ).getSingleResult() ;
	}

	@Override
	@Transactional
	@PreAuthorize("principal.username == #app.applicant.username")
	public Application apply(Application app) {
		// TODO Auto-generated method stub
		return entityManager.merge(app);
	}

	@Override
	public User getUser(String email) {
		String query = "from User where email='"+email+"'";
		return entityManager.createQuery(query, User.class).getSingleResult();
	}

	@Override
	public List<Application> isAlreadyApplied(long id, String appEmail) {
		// TODO Auto-generated method stub
		return entityManager.createQuery("select app from Application app join app.job j join app.applicant user where j.id=:jobid and user.email=:userEmail", Application.class).setParameter("jobid", id).setParameter("userEmail", appEmail).getResultList();

	}
	
	private java.io.File getFileDirectory() {
    	String path = context.getRealPath("/WEB-INF/files");
    	return new java.io.File(path);
    }
	
	
	@Override
    @Transactional
    public File fileSave(MultipartFile file, User applicant, Application app) throws IllegalStateException, IOException {
    	
    	
    	file.transferTo(new java.io.File(getFileDirectory(),file.getOriginalFilename()+"_"+app.getId()));
    	File fileInfo = new File();
    	
    	fileInfo.setName(file.getOriginalFilename()+"_"+app.getId());
    	fileInfo.setType(file.getContentType());
    	fileInfo.setSize(file.getSize());
    	fileInfo.setDate(new Date());
    	fileInfo.setOwner(applicant);
    	
    	return entityManager.merge(fileInfo);
    	
    }
	
	@Override
	public File Download(long fileId) {
		String query = null;
		query ="select f from File f where id="+fileId;
		System.out.println("query"+query);
		return entityManager.createQuery(query, File.class).getSingleResult();
	}

	@Override
	public List<Application> getApplicationByJobId(long jobid) {
		// TODO Auto-generated method stub
		return entityManager.createQuery("from Application where job.id =:jobid",Application.class ).setParameter("jobid", jobid).getResultList();
	}

	@Override
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_REVIEWER')")
	public Application getApplicationById(long appId) {
		// TODO Auto-generated method stub
		return entityManager.find(Application.class, appId);
	}


}
