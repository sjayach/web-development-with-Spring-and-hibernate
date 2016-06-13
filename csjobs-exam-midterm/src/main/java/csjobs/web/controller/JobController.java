package csjobs.web.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import csjobs.model.Job;
import csjobs.model.User;
import csjobs.model.dao.JobDao;
import csjobs.model.dao.UserDao;

@Controller
public class JobController {

    @Autowired
    private JobDao jobDao;
    
    @Autowired
    private UserDao userDao;
    
    @InitBinder
	public void initBinder(WebDataBinder binder) {
		  //The date format to parse or output your dates
	    SimpleDateFormat dateFormat = new SimpleDateFormat("M/d/yyyy");
	            //Create a new CustomDateEditor
	    CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
	            //Register it as custom editor for the Date type
	    binder.registerCustomEditor(Date.class, editor);
	}


    @RequestMapping({ "/index.html", "/job/list.html" })
    public String list( ModelMap models )
    {
        models.put( "openJobs", jobDao.getOpenJobs() );
        return "job/list";
    }

    @RequestMapping("/job/view.html")
    public String view( @RequestParam Long id, ModelMap models )
    {
        models.put( "job", jobDao.getJob( id ) );
        return "job/view";
    }
    
    @RequestMapping("/job/view_Jobs_Reviewer.html")
    public String view_job_reviewer( @RequestParam Long id, ModelMap models )
    {
        models.put( "job", jobDao.getJob( id ) );
        return "job/view_Jobs_Reviewer";
    }
    
    @RequestMapping(value="/job/addJob.html", method = RequestMethod.GET)
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
    	return "job/addJob";
    }
    @RequestMapping(value="/job/addJob.html", method = RequestMethod.POST)
    public String addJob(@ModelAttribute Job newJob, HttpServletRequest request, @RequestParam String committee_head,
    		@RequestParam String [] rev)
    {
    	String [] reviewers = rev;
    	User committeeChair = userDao.getUser(committee_head);
    	List<User> members = new ArrayList<User>();
    	for (String reviewer: reviewers) {
    		members.add(userDao.getUser(Long.parseLong(reviewer)));
    	}
    	
    	if (!members.contains(committeeChair))
    		members.add(committeeChair);
    	
    	newJob.setCommitteeChair(committeeChair);
    	newJob.setCommitteeMembers(members);
    	
    	jobDao.saveJob(newJob);
    	return "redirect:../admin.html";
    }
    @RequestMapping(value="/job/editJob.html", method = RequestMethod.GET)
    public String EditJob(@RequestParam long editId, ModelMap models) {
    	List<User> alluser = userDao.getUsers();
        Iterator<User> iterator = alluser.iterator();
    	while(iterator.hasNext()) {
    		if(!iterator.next().isReviewer()) {
    			iterator.remove();
    		}
    	}
    	models.put("availableReviewers", alluser);
    	models.put("jobEdit", jobDao.getJob(editId));
    	return "job/editJob";
    }
    @RequestMapping(value="/job/editJob.html", method = RequestMethod.POST)
    public String EditJob(@ModelAttribute Job jobEdit, HttpServletRequest request, @RequestParam String committee_head,
    		@RequestParam String [] rev) {
    	
    	String [] reviewers = rev;
    	User committeeChair = userDao.getUser(committee_head);
    	List<User> members = new ArrayList<User>();
    	for (String reviewer: reviewers) {
    		members.add(userDao.getUser(Long.parseLong(reviewer)));
    	}
    	
    	if (!members.contains(committeeChair))
    		members.add(committeeChair);
    	
    	jobEdit.setCommitteeChair(committeeChair);
    	jobEdit.setCommitteeMembers(members);
    	
    	jobDao.saveJob(jobEdit);

    	
    	return "redirect:../admin.html";
    }
    

}
