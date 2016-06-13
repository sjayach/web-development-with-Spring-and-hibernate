package csjobs.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import csjobs.model.User;
import csjobs.model.dao.ApplicantDao;
import csjobs.model.dao.DisplayJobsDao;
import csjobs.model.dao.UserDao;



@Controller
public class AdminReviewerController {

	@Autowired
	UserDao userDao;
	
	@Autowired
	DisplayJobsDao jobDao;
	
	@Autowired
	ApplicantDao applicantDao;
	
	@RequestMapping("/admin.html")
	public String admin( ModelMap models, Authentication authentication) {
		User user=(User) authentication.getPrincipal();
		
		models.put("loggedInUser",user.getFullName());
		
		models.put("allJobs", jobDao.getJobsByDesc());
		return "admin";
	}
	
	
	@RequestMapping("/reviewer.html")
	public String reviewer(Authentication authentication, ModelMap models) {
		
		User user =(User)authentication.getPrincipal(); 
		
		models.put("loggedInUser", user.getFullName());
		models.put("openJobs", jobDao.getJobs());
		
		return "reviewer";
	}
	
	@RequestMapping("/viewApplications.html")
	public String viewApplications(ModelMap models, @RequestParam long jobId) {
		
		models.put("viewApp", applicantDao.getApplicationByJobId(jobId));
		return "viewApplications";
	}
}
