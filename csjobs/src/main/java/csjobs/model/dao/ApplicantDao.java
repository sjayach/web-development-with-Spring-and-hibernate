package csjobs.model.dao;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import csjobs.model.Application;
import csjobs.model.File;
import csjobs.model.Job;
import csjobs.model.User;

public interface ApplicantDao {
	
	List<Job> getAppliedJobs(String email);
	List<Job> getAvailableJobs(String email);
	Application getApplication(long id, String userEmail);
	Application apply(Application app);
	User getUser(String email);
	List<Application> isAlreadyApplied(long id, String userEmail);
	
	List<Application> getApplicationByJobId(long jobid);
	
	Application getApplicationById(long id);
	
	File fileSave(MultipartFile file, User applicant,
    		Application app) throws IllegalStateException, IOException;
	
	File Download(long fileId);
}
