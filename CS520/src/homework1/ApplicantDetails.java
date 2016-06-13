package homework1;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ApplicantDetails
 */
@WebServlet("/ApplicantDetails")
public class ApplicantDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext context = this.getServletContext();
		List<ApplicantBean> applicants = (List<ApplicantBean>) context.getAttribute("applicantContext");
		List<JobBean> jobs = (List<JobBean>) context.getAttribute("jobContext");
		for (JobBean job : jobs) {
			if (job.getJobid() == Integer.parseInt(request.getParameter("id"))) {
				request.setAttribute("jobTitle", job.getJob());
				break;
			}
		}
		
		for (ApplicantBean app : applicants) {
			if (app.getName().equals(request.getParameter("name"))) {
				request.setAttribute("applicantDetails", app);
			}
		}
		request.getRequestDispatcher("/WEB-INF/homework1/ApplicantDetails.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
