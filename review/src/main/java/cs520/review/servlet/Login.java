package cs520.review.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public Login()
    {
        super();
    }

    protected void doGet( HttpServletRequest request,
        HttpServletResponse response ) throws ServletException, IOException
    {
        request.getRequestDispatcher( "/WEB-INF/Login.jsp" ).forward( request,
            response );
    }

    protected void doPost( HttpServletRequest request,
        HttpServletResponse response ) throws ServletException, IOException
    {
        String username = request.getParameter( "username" );
        String password = request.getParameter( "password" );

        if( username.equalsIgnoreCase( "cysun" ) && password.equals( "abcd" ) )
        {
            HttpSession session = request.getSession();
            session.setAttribute( "user", "cysun" );
            response.sendRedirect( "Members" );
        }
        else
            response.sendRedirect( "Login" );
    }

}
