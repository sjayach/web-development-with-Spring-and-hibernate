package homework1;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Applicant
 */
@WebServlet("/Applicant")
public class Applicant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	public void init() throws ServletException {
		// TODO Auto-generated method stub
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext context = this.getServletContext();
		List<JobBean> jobs= (List<JobBean>) context.getAttribute("jobContext");
		
		request.setAttribute("jobs", jobs);
		if (jobs.size() <= 0) {
			request.setAttribute("nojobs", 0);
			System.out.println("jobs is null");
		}
		List<ApplicantBean> applicant = (List<ApplicantBean>) context.getAttribute("applicantContext");
		List <String> applicantNames = new ArrayList<String>();
		for(ApplicantBean app: applicant) {
			applicantNames.add("\""+app.getName()+"\"");
		}
		//request.setAttribute("appNames", applicantNames);
		
		request.getRequestDispatcher("/WEB-INF/homework1/ApplicantView.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("ApplicantName");
		String [] jobs = request.getParameterValues("jobcheckbox");
		StringBuilder jobbuilder = new StringBuilder();
		int count = Integer.parseInt(request.getParameter("field"));
		
		System.out.println("Name: "+name);
		if (jobs != null) {
			
			for(String job : jobs) {
				jobbuilder.append(job+",");
			}
			ServletContext context = this.getServletContext();
			List<ApplicantBean> applicant = (List<ApplicantBean>) context.getAttribute("applicantContext");
			List<DegreeBean> degreeList = new ArrayList<DegreeBean>();
			for(int i=1; i <=count; i++) {
				String degree = request.getParameter("degree" +i)== null ? "" : request.getParameter("degree" +i);
				String univ =request.getParameter("univ" + i) == null ? "" : request.getParameter("univ" +i);
				String year = request.getParameter("year" +i) == null ? "" : request.getParameter("year" +i);
				if (degree.trim().length() > 0 || univ.trim().length() > 0 || year.trim().length() > 0)
					degreeList.add(new DegreeBean(degree,univ,year));
			}
			applicant.add(new ApplicantBean(name,jobs, degreeList));
		}
		request.getRequestDispatcher("/WEB-INF/homework1/Sucess.jsp").forward(request,response);
		
	}

}
