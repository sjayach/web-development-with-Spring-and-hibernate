package cs520.review.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs520.review.model.GuestBookEntry;

@WebServlet("/AddComment")
public class AddComment extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public AddComment()
    {
        super();
    }

    protected void doGet( HttpServletRequest request,
        HttpServletResponse response ) throws ServletException, IOException
    {
        request.getRequestDispatcher( "/WEB-INF/AddComment.jsp" ).forward(
            request, response );
    }

    @SuppressWarnings("unchecked")
    protected void doPost( HttpServletRequest request,
        HttpServletResponse response ) throws ServletException, IOException
    {
        List<GuestBookEntry> entries = (List<GuestBookEntry>) getServletContext()
            .getAttribute( "entries" );

        String name = request.getParameter( "name" );
        if( name == null )
            name = (String) request.getSession().getAttribute( "name" );
        else
            request.getSession().setAttribute( "name", name );

        entries
            .add( new GuestBookEntry( name, request.getParameter( "comment" ) ) );

        response.sendRedirect( "GuestBook" );
    }
}
