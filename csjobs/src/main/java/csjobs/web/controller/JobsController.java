package csjobs.web.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;

import csjobs.model.Job;
import csjobs.model.User;
import csjobs.model.dao.DisplayJobsDao;
import csjobs.model.dao.JobDao;
import csjobs.model.dao.UserDao;
import csjobs.web.editor.*;

@Controller
public class JobsController {

	@Autowired
	private DisplayJobsDao jobsDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private JobDao jobDao;
	
	@Autowired
    private WebApplicationContext context;

	
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		  //The date format to parse or output your dates
	    SimpleDateFormat dateFormat = new SimpleDateFormat("M/d/yyyy");
	            //Create a new CustomDateEditor
	    CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
	            //Register it as custom editor for the Date type
	    binder.registerCustomEditor(Date.class, editor);
	    binder.registerCustomEditor( User.class,
	            (UserPropertyEditor) context.getBean( "userPropertyEditor" ) );
	}

	
	@RequestMapping({"/index.html", "/jobs/list.html"})
	public String listJobs(ModelMap models) 
	{
		List<Job> jobs = jobsDao.getJobs();
		models.put("jobs", jobs);
		return "jobs/list";
	}
	
	@RequestMapping("/jobs/view.html")
	public String viewJob(@RequestParam Long id, ModelMap models) 
	{
		models.put("job", jobsDao.getJob(id));
		return "jobs/view";
		
	}
	
	@RequestMapping("/jobs/view_Jobs_Reviewer.html")
    public String view_job_reviewer( @RequestParam Long id, ModelMap models )
    {
        models.put( "job", jobsDao.getJob( id ) );
        return "jobs/view_Jobs_Reviewer";
    }
	
	@RequestMapping(value="/jobs/addJob.html", method = RequestMethod.GET)
    public String addJob( ModelMap models)
    {
    	
    	List<User> alluser = userDao.getUsers();
        Iterator<User> iterator = alluser.iterator();
    	while(iterator.hasNext()) {
    		if(!iterator.next().isReviewer()) {
    			iterator.remove();
    		}
    	}
    	models.put("availableReviewers", alluser);
    	models.put("newJob", new Job());
    	return "jobs/addJob";
    }
	@RequestMapping(value="/jobs/addJob.html", method = RequestMethod.POST)
    public String addJob(@ModelAttribute Job newJob)
    {
    	List<User> reviewers = newJob.getCommitteeMembers();
    	if (!reviewers.contains(newJob.getCommitteeChair()))
    		reviewers.add(newJob.getCommitteeChair());
    	
    	jobDao.saveJob(newJob);
    	return "redirect:../admin.html";
    }
	
	@RequestMapping(value="/jobs/editJob.html", method = RequestMethod.GET)
    public String EditJob(@RequestParam long editId, ModelMap models) {
		List<User> alluser = userDao.getUsers();
        Iterator<User> iterator = alluser.iterator();
    	while(iterator.hasNext()) {
    		if(!iterator.next().isReviewer()) {
    			iterator.remove();
    		}
    	}
    	models.put("availableReviewers", alluser);
		models.put("jobEdit", jobsDao.getJob(editId));
		return "jobs/editJob";
	}
	@RequestMapping(value="/jobs/editJob.html", method = RequestMethod.POST)
    public String EditJob(@ModelAttribute Job jobEdit) {
		
		List<User> reviewers = jobEdit.getCommitteeMembers();
    	if (!reviewers.contains(jobEdit.getCommitteeChair())) {
    		reviewers.add(jobEdit.getCommitteeChair());
    		System.out.println("added");
    	}
    	jobEdit.setCommitteeMembers(reviewers);
		jobDao.saveJob(jobEdit);
    	return "redirect:../admin.html";
	}
	
	
	
}
