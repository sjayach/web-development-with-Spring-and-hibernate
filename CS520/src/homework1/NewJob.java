package homework1;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NewJob
 */
@WebServlet("/NewJob")
public class NewJob extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	public void init() throws ServletException {
		// TODO Auto-generated method stub
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/homework1/NewJobView.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jobName = request.getParameter("JobName");
		ServletContext context = this.getServletContext();
		List<JobBean> job = (List<JobBean>) context.getAttribute("jobContext");
		if (job == null) {
			System.out.println("job is null");
		}
		Date date = new Date();
		String DATE_FORMAT = "M/dd/yyyy";
	    SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
	    System.out.println("Today is " + sdf.format(date));
		job.add(0, new JobBean(jobName,sdf.format(date) ));
		
		response.sendRedirect("Admin");
	}

}
