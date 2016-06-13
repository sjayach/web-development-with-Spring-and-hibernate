package csjobs.web.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;








import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import csjobs.model.Application;
import csjobs.model.Degree;
import csjobs.model.File;
import csjobs.model.Job;
import csjobs.model.User;
import csjobs.model.dao.ApplicantDao;
import csjobs.model.dao.DisplayJobsDao;
import csjobs.model.dao.UserDao;
import csjobs.web.validator.ApplicationValidator;

@Controller
public class ApplicantController {
	
	@Autowired
	private ApplicantDao applicantDao;
	@Autowired 
	private DisplayJobsDao jobDao;
	@Autowired 
	private UserDao userDao;
	
	@Autowired
	private ApplicationValidator applicationValidator;
	
	@Autowired
    private ServletContext context;

	
	
	
	@RequestMapping(value="/applicant.html", method=RequestMethod.GET)
	public String applicantView(ModelMap models, Authentication authentication) {
		User user=(User) authentication.getPrincipal();
		
		models.put("loggedInUser",user.getFullName());
		String appEmail = user.getEmail();
		User applicant = userDao.getUser(appEmail);
		if (applicant == null || !(applicant.getRoles().contains("ROLE_APPLICANT")) ) {
			System.out.println("something went wrong"+appEmail);
			return "redirect:user/login.html";
		}
		
		List<Job> jobs = applicantDao.getAppliedJobs(appEmail);
		List<Job> availablejobs = applicantDao.getAvailableJobs(appEmail);
		models.put("appliedjobs", jobs);
		models.put("availablejobs", availablejobs);
		models.put("appEmail", appEmail);
		if (availablejobs.size() == 0)
			models.put("NoAvailableJobs", "No Jobs Available.");
		return "applicant";
	}
	
	@RequestMapping(value="/application/showApplication.html", method=RequestMethod.GET)
	public String showApplication(@RequestParam(required=false) Long id, Authentication authentication, ModelMap models,
								@RequestParam(required=false) Long appId) {
		Application app = null;
		if (id != null) {
			User user = (User)authentication.getPrincipal();
			String userEmail = user.getEmail();
			app = applicantDao.getApplication(id, userEmail);
		} else if (appId != null) {
			app = applicantDao.getApplicationById(appId);
		}
		models.put("app", app);
		return "application/showApplication";
	}
	
	@RequestMapping(value="/application/apply.html", method=RequestMethod.GET)
	public String Apply(@RequestParam long jobid, ModelMap models, Authentication authentication) {
		
		User user = (User) authentication.getPrincipal();
		String appEmail = user.getEmail();
		
		if (applicantDao.isAlreadyApplied(jobid, appEmail).size() > 0)
			return "redirect:../applicant.html?appEmail="+appEmail;
		
		models.put("application", new Application());
		Job job =jobDao.getJob(jobid);
		models.put("jobDetail", job);
		models.put("jobTitle", job.getTitle());
		System.out.println("get app email" +appEmail);
		return "application/apply";
	}
	
	@RequestMapping(value="/application/apply.html", method=RequestMethod.POST)
	public String Apply(@RequestParam long jobid, @ModelAttribute Application application, BindingResult result, 
						Authentication authentication, ModelMap models,
						@RequestParam MultipartFile cv1,
				        @RequestParam MultipartFile ts1, 
				        @RequestParam MultipartFile rs1) throws IllegalStateException, IOException {
		
		User user = (User) authentication.getPrincipal();
		String appEmail = user.getEmail();
		System.out.println("application degree" + application.getDegrees().size() + "something"+application.getCurrentJobYear());
		application.setJob(jobDao.getJob(jobid));
		System.out.println("app Email"+appEmail);
		application.setApplicant(applicantDao.getUser(appEmail));
		application.setSubmitDate(new Date());
	
		applicationValidator.validate(application, result);
		
		if (result.hasErrors()){
			models.put("jobTitle", application.getJob().getTitle());
			models.put("numdegrees", application.getDegrees().size() );
			return "application/apply";
		}
		
		application = applicantDao.apply(application);
		
		
    	/* Save the CV File */
    	if (!cv1.isEmpty())
    		application.setCv(applicantDao.fileSave(cv1,application.getApplicant(), application ));
    	
       	/* Save the Research Statement File */
    	if (!rs1.isEmpty())
    		application.setResearchStatement(applicantDao.fileSave(rs1, application.getApplicant(), application));
       	/* Save the Teaching Statement File */
    	if(!ts1.isEmpty())
    		application.setTeachingStatement(applicantDao.fileSave(ts1, application.getApplicant(), application));

    	application = applicantDao.apply( application );
		
		
		return "redirect:ApplicationSuccess.html";
	}
	@RequestMapping("/application/ApplicationSuccess.html")
	public String appSuccess() {
		return "application/ApplicationSuccess";
	}
	
	private java.io.File getFileDirectory() {
    	String path = context.getRealPath("/WEB-INF/files");
    	return new java.io.File(path);
    }
	
	@RequestMapping(value="/application/download.html")
    public String download(@RequestParam long fileId, HttpServletResponse response) throws IOException {
    	
    	File down = applicantDao.Download(fileId);
    	response.setContentType( down.getType() );
    	
        int endIndex = down.getName().lastIndexOf("_");
        String fileName = null;
        if (endIndex != -1) {
        	fileName = down.getName().substring(0,endIndex);
        }
        response.setHeader( "Content-Disposition",
            "attachment;filename="+fileName );

        java.io.FileInputStream in = new java.io.FileInputStream( getFileDirectory() +"/"+down.getName() );
        OutputStream out = response.getOutputStream();

        byte buffer[] = new byte[2048];
        int bytesRead;
        while( (bytesRead = in.read( buffer )) > 0 )
            out.write( buffer, 0, bytesRead );

        in.close();
    	
    	return null;
    }

	
	

}
