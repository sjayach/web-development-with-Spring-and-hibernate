package cs520.review.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs520.review.model.GuestBookEntry;

@WebServlet("/EditComment")
@SuppressWarnings("unchecked")
public class EditComment extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public EditComment()
    {
        super();
    }

    protected void doGet( HttpServletRequest request,
        HttpServletResponse response ) throws ServletException, IOException
    {
        List<GuestBookEntry> entries = (List<GuestBookEntry>) getServletContext()
            .getAttribute( "entries" );

        int index = Integer.parseInt( request.getParameter( "index" ) );
        request.setAttribute( "entry", entries.get( index ) );
        request.getRequestDispatcher( "/WEB-INF/EditComment.jsp" ).forward(
            request, response );
    }

    protected void doPost( HttpServletRequest request,
        HttpServletResponse response ) throws ServletException, IOException
    {
        List<GuestBookEntry> entries = (List<GuestBookEntry>) getServletContext()
            .getAttribute( "entries" );

        int index = Integer.parseInt( request.getParameter( "index" ) );
        GuestBookEntry entry = entries.get( index );
        entry.setName( request.getParameter( "name" ) );
        entry.setComment( request.getParameter( "comment" ) );

        response.sendRedirect( "GuestBook" );
    }

}
