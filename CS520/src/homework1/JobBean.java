package homework1;


public class JobBean {
	int jobid = 0;
	String job;
	String date;
	static int count = 0;
	public JobBean(String job, String date) {
		
		super();
		this.jobid = count ++;
		this.job = job;
		this.date = date;
	}
	public int getJobid() {
		return jobid;
	}
	public String getJob() {
		return job;
	}
	public String getDate() {
		return date;
	}
	
	
	

}
