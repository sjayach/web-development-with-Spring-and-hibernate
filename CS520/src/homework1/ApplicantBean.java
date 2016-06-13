package homework1;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class ApplicantBean {
	String name;
	String date;
	String[] jobids;
	List<DegreeBean> degreedetails;
	public ApplicantBean(String name, String[] jobids,List<DegreeBean> degreedetails) {
		super();
		this.name = name;
		this.jobids = jobids;
		this.degreedetails = degreedetails;
		Date appDate = new Date();
		String DATE_FORMAT = "M/dd/yyyy";
	    SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
	    this.date = sdf.format(appDate);
	}
	public String getDate() {
		return date;
	}
	public String getName() {
		return name;
	}
	public List<DegreeBean> getDegreedetails() {
		return degreedetails;
	}
	public String[] getJobids() {
		return jobids;
	}

	
	
	

}
