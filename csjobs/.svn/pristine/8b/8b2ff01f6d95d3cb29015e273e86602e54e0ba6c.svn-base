package csjobs.web.controller;

import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import csjobs.model.User;
import csjobs.model.dao.*;
import csjobs.web.validator.RegisterValidator;

@Controller
public class LoginController {
	
	@Autowired
	private RegisterDao registerDao;
	
	@Autowired
	private LoginDao loginDao;
	
	@Autowired
	private RegisterValidator registerValidator;
	
	
	@RequestMapping(value="/register.html", method=RequestMethod.GET)
	public String register(ModelMap models) {
		models.put("user", new User());
		return "register";
	}
	
	
	@RequestMapping(value="/register.html", method=RequestMethod.POST)
	public String register(@ModelAttribute User user, BindingResult result) {
		Set<String> role = new HashSet<String>();
		role.add("ROLE_APPLICANT");
		user.setRoles(role);
		registerValidator.validate(user, result);
		if (result.hasErrors()) return "register";
		
		user = registerDao.register(user);
		return "redirect:RegisterSuccess.html";
	}
	@RequestMapping("/RegisterSuccess.html")
	public String registerSuccess() {
		return "RegisterSuccess";
	}
	
	@RequestMapping(value="/user/login.html", method=RequestMethod.GET)
	public String login() {
		return "user/login";
		
	}
	
	@RequestMapping(value="/user/login.html", method=RequestMethod.POST)
	public String login(ModelMap models, @RequestParam String username, @RequestParam String password,
			HttpServletRequest request,HttpSession session) {
		
		if(loginDao.isUserAvailable(username, password).size() == 0) {
			models.put("LoginError", "User Name/Password is Invalid.");
			return "user/login";
		}
		
		String role ="redirect:";
		User user = loginDao.getUser(username, password);
		
		System.out.println("Role is " + user.getRoles());
		
		if (user.getRoles().contains("ROLE_ADMIN"))
			role = role + "admin.html";
		
		else if(user.getRoles().contains("ROLE_REVIEWER"))
			role = role + "reviewer.html?reviewerEmail="+user.getEmail();
		
		else if (user.getRoles().contains("ROLE_APPLICANT"))
			role = role+"../applicant/view.html?appEmail="+user.getEmail();
		
		System.out.println("redirect link" + role);
		session = request.getSession();
		session.setAttribute("login", user.getId());
		return role;
		
	}
	
	@RequestMapping(value = "/login.html")
	public String login(ModelMap model) {
		System.out.println("security");
		return "login";
		 
	}
	

}
