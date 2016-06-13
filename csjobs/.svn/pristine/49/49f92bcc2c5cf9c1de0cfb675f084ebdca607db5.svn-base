package csjobs.web.validator;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import csjobs.model.User;
import csjobs.model.dao.RegisterDao;

@Component
public class RegisterValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return User.class.isAssignableFrom(clazz);
	}

	@Autowired
	private RegisterDao registerDao;
	
	@Override
	public void validate(Object target, Errors errors) {
		User user = (User) target;
		
		if (!StringUtils.hasText(user.getEmail())) {
			errors.rejectValue("email", "error.field.empty");
		}
		if (!StringUtils.hasText(user.getAddress())) {
			errors.rejectValue("address", "error.field.empty");
		}
		if (!StringUtils.hasText(user.getFirstName())) {
			errors.rejectValue("firstName", "error.field.empty");
		}
		if (!StringUtils.hasText(user.getLastName())) {
			errors.rejectValue("lastName", "error.field.empty");
		}
		if (!StringUtils.hasText(user.getPassword())) {
			errors.rejectValue("password", "error.field.empty");
		}
		if (!StringUtils.hasText(user.getPhone())) {
			errors.rejectValue("phone", "error.field.empty");
		}
		
		if (StringUtils.hasText(user.getEmail()) && (registerDao.isDuplicate(user.getEmail().toLowerCase()).size() > 0)) {
				errors.rejectValue("email", "error.user.exist");
		}
	}

}
