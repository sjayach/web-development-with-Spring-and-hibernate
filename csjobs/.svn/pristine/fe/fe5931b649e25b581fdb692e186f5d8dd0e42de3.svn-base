package csjobs.web.validator;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import csjobs.model.Application;
import csjobs.model.Degree;

@Component
public class ApplicationValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return Application.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Application app = (Application) target;
		if (!StringUtils.hasText(app.getCurrentJobTitle())) {
			errors.rejectValue("currentJobTitle", "error.field.empty");
		}
		if (!StringUtils.hasText(app.getCurrentJobInstitution())) {
			errors.rejectValue("currentJobInstitution", "error.field.empty");
		}
		if (app.getCurrentJobYear() == null || app.getCurrentJobYear() <= 0 ) {
			errors.rejectValue("currentJobYear", "error.invalid.year");
		}
		for(int i=0; i<app.getDegrees().size();i++) {
			if (!StringUtils.hasText(app.getDegrees().get(i).getName())) {
				errors.rejectValue("degrees["+i+"].name", "error.field.empty");
			}
			if (!StringUtils.hasText(app.getDegrees().get(i).getSchool())) {
				errors.rejectValue("degrees["+i+"].school", "error.field.empty");
			}
			if (app.getDegrees().get(i).getYear() == null || app.getDegrees().get(i).getYear() <= 0) {
				errors.rejectValue("degrees["+i+"].year", "error.field.empty");
			}
			
		}
		
		
		
	}

}
